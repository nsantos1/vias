import { formatarData, formatarDataHora } from "@/lib/formatos";
import { dadosDaTela } from "@/lib/telas";

describe("formatarData", () => {
  test("data AAAA-MM-DD não volta um dia por causa do fuso", () => {
    expect(formatarData("2026-11-14")).toBe("14/11/2026");
  });

  test.each([null, undefined, "", "não é data", "2026-13-45"])("valor %p devolve null (nunca inventa)", (v) => {
    expect(formatarData(v)).toBeNull();
  });

  test("data e hora", () => {
    expect(formatarDataHora("2026-11-14T13:05:00")).toMatch(/14\/11\/2026.*13:05/);
  });
});

describe("dadosDaTela (cabeçalho)", () => {
  test.each([
    ["/", "Busca de atendimento", null],
    ["/unidades", "Resultado da busca", "/"],
    ["/unidades/ficticio-1", "Unidade de saúde", "/unidades"],
    ["/unidades/ficticio-1/percurso", "Percurso", "/unidades"],
  ])("%s → %s", (caminho, rotulo, voltarPara) => {
    expect(dadosDaTela(caminho)).toMatchObject({ rotulo, voltarPara });
  });

  test("rota desconhecida volta para o início", () => {
    expect(dadosDaTela("/qualquer")).toEqual({ rotulo: null, voltarPara: "/" });
  });
});
