// O cliente HTTP é substituído por um dublê; nenhum dado real.
import { ErroApi, TIPOS_ERRO } from "@/services/api/client";
import { calcularPercurso } from "@/services/api/percursos";

jest.mock("@/services/api/client", () => {
  const real = jest.requireActual("@/services/api/client");
  return { ...real, requisitar: jest.fn(() => Promise.resolve({})) };
});
const { requisitar } = jest.requireMock("@/services/api/client");

beforeEach(() => requisitar.mockReset());

const origem = { latitude: -23.5, longitude: -46.6, precisaoMetros: 30 };

test("envia a origem no corpo (POST), sem a precisão do GPS", async () => {
  requisitar.mockResolvedValue({});
  await calcularPercurso({ unidadeId: "7", origem, horarioAtendimento: "2026-11-19T14:30:00", folgaMinutos: 15 });

  const [caminho, opcoes] = requisitar.mock.calls[0];
  expect(caminho).toBe("/percursos");
  expect(opcoes.metodo).toBe("POST");
  expect(opcoes.params).toBeUndefined();
  expect(opcoes.corpo).toEqual({
    unidadeId: 7,
    origem: { latitude: -23.5, longitude: -46.6 },
    horarioAtendimento: "2026-11-19T14:30:00",
    folgaMinutos: 15,
  });
});

test("sair agora não manda folga", async () => {
  requisitar.mockResolvedValue({});
  await calcularPercurso({ unidadeId: 7, origem, horarioAtendimento: null, folgaMinutos: 15 });
  expect(requisitar.mock.calls[0][1].corpo).toMatchObject({ horarioAtendimento: null, folgaMinutos: null });
});

test("422 e 503 mostram a mensagem escrita pela API do VIAS", async () => {
  requisitar.mockRejectedValue(
    new ErroApi({ tipo: TIPOS_ERRO.HTTP, status: 422, mensagem: "genérica", detalhe: "Mensagem fictícia da API." }),
  );
  await expect(calcularPercurso({ unidadeId: 7, origem })).rejects.toMatchObject({
    status: 422,
    mensagem: "Mensagem fictícia da API.",
  });
});

test("outros erros passam sem mudança", async () => {
  const erro = new ErroApi({ tipo: TIPOS_ERRO.HTTP, status: 500, mensagem: "genérica", detalhe: "técnico" });
  requisitar.mockRejectedValue(erro);
  await expect(calcularPercurso({ unidadeId: 7, origem })).rejects.toBe(erro);
});
