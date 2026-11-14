// Verifica que os módulos de domínio montam as chamadas propostas no Alinhamento §5
// sem inventar filtros. O cliente é substituído por um dublê.
import { listarRegioes } from "@/services/api/regioes";
import { listarServicos } from "@/services/api/servicos";
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

test("obterUnidade codifica o id e exige id", async () => {
  await obterUnidade("a/b");
  expect(requisitar).toHaveBeenCalledWith("/unidades/a%2Fb", { signal: undefined });
  expect(() => obterUnidade("")).toThrow(TypeError);
});
