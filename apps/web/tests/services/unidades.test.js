// Verifica que os módulos de domínio montam as chamadas propostas no Alinhamento §5
// sem inventar filtros. O cliente é substituído por um dublê.
import { listarRegioes, obterRegiao } from "@/services/api/regioes";
import { listarServicos, obterServico } from "@/services/api/servicos";
import { listarTodasUnidadesDoServico, listarUnidades, obterUnidade } from "@/services/api/unidades";

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

describe("listarTodasUnidadesDoServico", () => {
  // Páginas FICTÍCIAS no formato da API Java.
  const pagina = (n, totalPaginas) => ({
    items: [{ id: `ficticio-${n}` }],
    total: totalPaginas,
    pagina: n,
    tamanho: 100,
    totalPaginas,
  });

  test("junta todas as páginas do serviço, de 100 em 100", async () => {
    requisitar.mockImplementation((_caminho, { params }) => Promise.resolve(pagina(params.pagina, 3)));
    const r = await listarTodasUnidadesDoServico({ servicoId: "3" });
    expect(r.items.map((u) => u.id)).toEqual(["ficticio-0", "ficticio-1", "ficticio-2"]);
    expect(r.completo).toBe(true);
    expect(requisitar).toHaveBeenCalledTimes(3);
    expect(requisitar.mock.calls.every(([, { params }]) => params.tamanho === 100 && params.servicoId === "3")).toBe(true);
  });

  test("respeita o limite de páginas e avisa que a lista ficou incompleta", async () => {
    requisitar.mockImplementation((_caminho, { params }) => Promise.resolve(pagina(params.pagina, 40)));
    const r = await listarTodasUnidadesDoServico({ servicoId: "6" });
    expect(r.items).toHaveLength(15);
    expect(r.completo).toBe(false);
  });

  test("uma página só: uma chamada", async () => {
    requisitar.mockImplementation(() => Promise.resolve(pagina(0, 1)));
    const r = await listarTodasUnidadesDoServico({ servicoId: "1" });
    expect(requisitar).toHaveBeenCalledTimes(1);
    expect(r.completo).toBe(true);
  });
});
