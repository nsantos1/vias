// Verifica que os módulos de domínio montam as chamadas propostas no Alinhamento §5
// sem inventar filtros. O cliente é substituído por um dublê.
import { listarRegioes, obterRegiao } from "@/services/api/regioes";
import { listarServicos, obterServico } from "@/services/api/servicos";
import { listarUnidades, obterUnidade } from "@/services/api/unidades";

jest.mock("@/services/api/client", () => ({
  requisitar: jest.fn(() => Promise.resolve(null)),
}));
const { requisitar } = jest.requireMock("@/services/api/client");

beforeEach(() => requisitar.mockClear());

test("listarServicos chama /servicos", async () => {
  await listarServicos();
  expect(requisitar).toHaveBeenCalledWith("/servicos", { signal: undefined });
});

test("listarRegioes chama /regioes", async () => {
  await listarRegioes();
  expect(requisitar).toHaveBeenCalledWith("/regioes", { signal: undefined });
});

test("listarUnidades repassa só os filtros previstos e o signal", async () => {
  const signal = new AbortController().signal;
  await listarUnidades({ servicoId: "ficticio-3", regiaoId: "ficticio-1", outro: "ignorado", signal });
  expect(requisitar).toHaveBeenCalledWith("/unidades", {
    params: { servicoId: "ficticio-3", regiaoId: "ficticio-1", bairro: undefined, acessibilidade: undefined },
    signal,
  });
});

test("listarUnidades repassa a paginação da API Java", async () => {
  await listarUnidades({ servicoId: "1", pagina: 2, tamanho: 10 });
  expect(requisitar).toHaveBeenCalledWith("/unidades", {
    params: { servicoId: "1", regiaoId: undefined, bairro: undefined, acessibilidade: undefined, pagina: 2, tamanho: 10 },
    signal: undefined,
  });
});

test("obterServico e obterRegiao chamam o recurso pelo id", async () => {
  await obterServico(3);
  expect(requisitar).toHaveBeenCalledWith("/servicos/3", { signal: undefined });
  await obterRegiao(296);
  expect(requisitar).toHaveBeenCalledWith("/regioes/296", { signal: undefined });
});

test("obterUnidade codifica o id e exige id", async () => {
  await obterUnidade("a/b");
  expect(requisitar).toHaveBeenCalledWith("/unidades/a%2Fb", { signal: undefined });
  expect(() => obterUnidade("")).toThrow(TypeError);
});
