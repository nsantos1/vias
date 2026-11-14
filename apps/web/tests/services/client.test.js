/**
 * @jest-environment node
 */
// Testa o cliente da API contra um servidor HTTP local com respostas FICTÍCIAS.
import http from "node:http";
import {
  ErroApi,
  mensagemDeErro,
  montarUrl,
  requisitar,
  TIPOS_ERRO,
  urlBase,
} from "@/services/api/client";
import { ERRO_404_FICTICIO, LISTA_FICTICIA, LISTA_VAZIA } from "../fixtures/respostas";

let servidor;
let base;
let ultimaUrl;

beforeAll(async () => {
  servidor = http.createServer((req, res) => {
    ultimaUrl = req.url;
    const json = (status, corpo) => {
      res.writeHead(status, { "Content-Type": "application/json" });
      res.end(JSON.stringify(corpo));
    };
    if (req.url.startsWith("/api/ok")) return json(200, LISTA_FICTICIA);
    if (req.url.startsWith("/api/vazio")) return json(200, LISTA_VAZIA);
    if (req.url.startsWith("/api/sem-corpo")) {
      res.writeHead(204);
      return res.end();
    }
    if (req.url.startsWith("/api/404")) return json(404, ERRO_404_FICTICIO);
    if (req.url.startsWith("/api/400")) return json(400, { status: 400, message: "servicoId inválido" });
    if (req.url.startsWith("/api/500")) {
      res.writeHead(500, { "Content-Type": "text/plain" });
      return res.end("java.lang.NullPointerException at br.com.vias...");
    }
    if (req.url.startsWith("/api/html")) {
      res.writeHead(200, { "Content-Type": "text/html" });
      return res.end("<html>oops</html>");
    }
    if (req.url.startsWith("/api/lento")) {
      const timer = setTimeout(() => json(200, { atrasado: true }), 2000);
      req.on("close", () => clearTimeout(timer));
      return undefined;
    }
    return json(418, {});
  });
  await new Promise((resolver) => servidor.listen(0, "127.0.0.1", resolver));
  base = `http://127.0.0.1:${servidor.address().port}/api`;
});

afterAll(async () => {
  servidor.closeAllConnections();
  await new Promise((resolver) => servidor.close(resolver));
});

async function capturarErro(promessa) {
  try {
    await promessa;
  } catch (erro) {
    return erro;
  }
  throw new Error("deveria ter lançado ErroApi");
}

describe("respostas de sucesso", () => {
  test("200 devolve o JSON", async () => {
    await expect(requisitar("/ok", { base })).resolves.toEqual(LISTA_FICTICIA);
  });

  test("200 com lista vazia é sucesso, não erro", async () => {
    await expect(requisitar("/vazio", { base })).resolves.toEqual(LISTA_VAZIA);
  });

  test("204 devolve null", async () => {
    await expect(requisitar("/sem-corpo", { base })).resolves.toBeNull();
  });

  test("filtros vazios ficam fora da URL, mas o 0 é mantido", async () => {
    await requisitar("/ok", {
      base,
      params: { servicoId: 3, regiaoId: undefined, bairro: "", acessibilidade: null, pagina: 0 },
    });
    expect(ultimaUrl).toBe("/api/ok?servicoId=3&pagina=0");
  });
});

describe("erros HTTP", () => {
  test("404 tem mensagem amigável e guarda o detalhe do backend", async () => {
    const erro = await capturarErro(requisitar("/404", { base }));
    expect(erro).toBeInstanceOf(ErroApi);
    expect(erro).toMatchObject({
      tipo: TIPOS_ERRO.HTTP,
      status: 404,
      mensagem: "Não encontramos o que você procurou.",
      detalhe: "Unidade não encontrada",
    });
    expect(erro.podeTentarDeNovo).toBe(false);
  });

  test("400 pede para revisar os filtros", async () => {
    const erro = await capturarErro(requisitar("/400", { base }));
    expect(erro.status).toBe(400);
    expect(erro.mensagem).toMatch(/filtros/);
  });

  test("500 não expõe stack trace e permite tentar de novo", async () => {
    const erro = await capturarErro(requisitar("/500", { base }));
    expect(erro.status).toBe(500);
    expect(erro.mensagem).not.toMatch(/Exception|java/);
    expect(erro.podeTentarDeNovo).toBe(true);
  });

  test("200 com HTML vira RESPOSTA_INVALIDA", async () => {
    const erro = await capturarErro(requisitar("/html", { base }));
    expect(erro.tipo).toBe(TIPOS_ERRO.RESPOSTA_INVALIDA);
  });
});

describe("rede, tempo e cancelamento", () => {
  test("demora acima do limite vira TIMEOUT", async () => {
    const erro = await capturarErro(requisitar("/lento", { base, timeoutMs: 200 }));
    expect(erro.tipo).toBe(TIPOS_ERRO.TIMEOUT);
    expect(erro.podeTentarDeNovo).toBe(true);
  });

  test("cancelamento externo vira CANCELADO, não TIMEOUT", async () => {
    const controle = new AbortController();
    const promessa = requisitar("/lento", { base, signal: controle.signal });
    setTimeout(() => controle.abort(), 50);
    const erro = await capturarErro(promessa);
    expect(erro.tipo).toBe(TIPOS_ERRO.CANCELADO);
  });

  test("API fora do ar vira REDE", async () => {
    const erro = await capturarErro(requisitar("/ok", { base: "http://127.0.0.1:9/api" }));
    expect(erro.tipo).toBe(TIPOS_ERRO.REDE);
    expect(erro.podeTentarDeNovo).toBe(true);
  });
});

describe("configuração e URL", () => {
  test("sem NEXT_PUBLIC_API_URL vira CONFIGURACAO", () => {
    expect(() => urlBase("")).toThrow(expect.objectContaining({ tipo: TIPOS_ERRO.CONFIGURACAO }));
  });

  test("protocolo diferente de http/https vira CONFIGURACAO", () => {
    expect(() => urlBase("ftp://exemplo/api")).toThrow(
      expect.objectContaining({ tipo: TIPOS_ERRO.CONFIGURACAO }),
    );
  });

  test("barra final da URL base é removida", () => {
    expect(montarUrl("/unidades", {}, urlBase("http://localhost:8080/api/"))).toBe(
      "http://localhost:8080/api/unidades",
    );
  });

  test("mensagemDeErro cobre status sem texto próprio", () => {
    expect(mensagemDeErro({ tipo: TIPOS_ERRO.HTTP, status: 503 })).toMatch(/problema/);
    expect(mensagemDeErro()).toMatch(/problema/);
  });
});
