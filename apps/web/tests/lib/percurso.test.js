import {
  categoriaDaOpcao,
  dataLocal,
  decodificarPolilinha,
  escolherDestaque,
  geometriasDo,
  horariosDosTrechos,
  linhasDoMapa,
  minutosEntre,
  onibusAcessivelParaEmbarque,
  formatarDuracao,
  formatarMetros,
  horaDe,
  linkComoChegar,
  minutosDeSobra,
  montarHorario,
  resumoLinhas,
} from "@/lib/percurso";

test("horaDe pega HH:mm sem converter fuso", () => {
  expect(horaDe("2026-11-19T13:42:00")).toBe("13:42");
  expect(horaDe(null)).toBeNull();
  expect(horaDe("lixo")).toBeNull();
});

test("formatarDuracao e formatarMetros", () => {
  expect(formatarDuracao(28)).toBe("28 min");
  expect(formatarDuracao(65)).toBe("1 h 05 min");
  expect(formatarDuracao(120)).toBe("2 h");
  expect(formatarDuracao(null)).toBeNull();
  expect(formatarMetros(347)).toBe("350 m");
  expect(formatarMetros(1250)).toBe("1,3 km");
  expect(formatarMetros(0)).toBeNull();
});

test("montarHorario exige data e hora completas", () => {
  expect(montarHorario("2026-11-19", "14:30")).toBe("2026-11-19T14:30:00");
  expect(montarHorario("2026-11-19", "")).toBeNull();
  expect(montarHorario("", "14:30")).toBeNull();
});

test("dataLocal usa o dia local, inclusive somando dias", () => {
  const noite = new Date(2026, 10, 19, 23, 30);
  expect(dataLocal(noite)).toBe("2026-11-19");
  expect(dataLocal(noite, 1)).toBe("2026-11-20");
});

test("minutosDeSobra: positivo quando chega antes", () => {
  expect(minutosDeSobra("2026-11-19T14:04:00", "2026-11-19T14:30:00")).toBe(26);
  expect(minutosDeSobra("2026-11-19T14:40:00", "2026-11-19T14:30:00")).toBe(-10);
  expect(minutosDeSobra(null, "2026-11-19T14:30:00")).toBeNull();
});

test("resumoLinhas ignora caminhadas", () => {
  expect(
    resumoLinhas([{ tipo: "A_PE" }, { tipo: "ONIBUS", linha: { codigo: "9999-10" } }, { tipo: "METRO", linha: { nome: "Linha fictícia" } }]),
  ).toBe("Ônibus 9999-10 → Metrô Linha fictícia");
  expect(resumoLinhas([{ tipo: "A_PE" }])).toBe("Só a pé");
});

test("linkComoChegar leva só o destino, nunca a origem", () => {
  const link = linkComoChegar({ latitude: -23.56, longitude: -46.66 });
  expect(link).toBe("https://www.google.com/maps/dir/?api=1&destination=-23.56%2C-46.66&travelmode=transit");
  expect(link).not.toMatch(/origin/);
  expect(linkComoChegar({ latitude: null, longitude: null })).toBeNull();
});

// ---------------------------------------------------------------- mapa e opções

test("decodificarPolilinha segue o exemplo da documentação do Google", () => {
  expect(decodificarPolilinha("_p~iF~ps|U_ulLnnqC_mqNvxq`@")).toEqual([
    [38.5, -120.2],
    [40.7, -120.95],
    [43.252, -126.453],
  ]);
  expect(decodificarPolilinha("")).toEqual([]);
  expect(decodificarPolilinha(null)).toEqual([]);
});

test("geometria aceita lista (API nova) ou texto (API antiga) e nunca inventa linha", () => {
  expect(geometriasDo({ geometria: ["a", "", null, "b"] })).toEqual(["a", "b"]);
  expect(geometriasDo({ geometria: "a" })).toEqual(["a"]);
  expect(geometriasDo({})).toEqual([]);
  const linhas = linhasDoMapa([{ tipo: "A_PE" }, { tipo: "ONIBUS", geometria: ["_p~iF~ps|U_ulLnnqC"] }]);
  expect(linhas).toHaveLength(1);
  expect(linhas[0]).toMatchObject({ indice: 1, tipo: "ONIBUS" });
});

test("categoriaDaOpcao separa ônibus, trilhos, misto e a pé", () => {
  expect(categoriaDaOpcao({ trechos: [{ tipo: "A_PE" }, { tipo: "ONIBUS" }] })).toBe("ONIBUS");
  expect(categoriaDaOpcao({ trechos: [{ tipo: "METRO" }, { tipo: "TREM" }] })).toBe("TRILHOS");
  expect(categoriaDaOpcao({ trechos: [{ tipo: "ONIBUS" }, { tipo: "METRO" }] })).toBe("MISTO");
  expect(categoriaDaOpcao({ trechos: [{ tipo: "A_PE" }] })).toBe("A_PE");
});

test("escolherDestaque: a recomendada; senão, a que sai mais tarde e chega a tempo", () => {
  const a = { saida: "2026-11-19T13:00:00", chegada: "2026-11-19T13:40:00", chegaATempo: true };
  const b = { saida: "2026-11-19T13:10:00", chegada: "2026-11-19T13:50:00", chegaATempo: true };
  const c = { saida: "2026-11-19T13:20:00", chegada: "2026-11-19T14:30:00", chegaATempo: false };
  expect(escolherDestaque([a, b, c], true)).toBe(b);
  expect(escolherDestaque([a, b, c], false)).toBe(a);
  expect(escolherDestaque([a, { ...c, recomendada: true }], true).recomendada).toBe(true);
  expect(escolherDestaque([], true)).toBeNull();
});

test("horariosDosTrechos soma as caminhadas a partir dos horários da API", () => {
  const opcao = {
    saida: "2026-11-19T13:25:00",
    trechos: [
      { tipo: "A_PE", duracaoMinutos: 5 },
      { tipo: "ONIBUS", embarque: { horario: "2026-11-19T13:30:00" }, desembarque: { horario: "2026-11-19T13:50:00" } },
      { tipo: "A_PE", duracaoMinutos: 4 },
    ],
  };
  expect(horariosDosTrechos(opcao)).toEqual(["2026-11-19T13:25:00", "2026-11-19T13:30:00", "2026-11-19T13:50:00"]);
});

test("minutosEntre usa só a hora local, sem fuso", () => {
  expect(minutosEntre("2026-11-19T13:00:00", "2026-11-19T13:25:00")).toBe(25);
  expect(minutosEntre("2026-11-19T23:50:00", "2026-11-20T00:10:00")).toBe(20);
  expect(minutosEntre(null, "2026-11-19T13:25:00")).toBeNull();
});

test("onibusAcessivelParaEmbarque só vale perto do horário de embarque", () => {
  const trecho = (embarque) => ({
    embarque: { horario: embarque },
    aoVivo: {
      status: "DISPONIVEL",
      onibus: [
        { prefixo: "F1", previsto: "2026-11-19T13:20:00", acessivel: true },
        { prefixo: "F2", previsto: "2026-11-19T13:28:00", acessivel: false },
        { prefixo: "F3", previsto: "2026-11-19T13:33:00", acessivel: true },
      ],
    },
  });
  expect(onibusAcessivelParaEmbarque(trecho("2026-11-19T13:22:00")).prefixo).toBe("F1");
  // Às 13:30 o F1 (13:20) já passou antes de a pessoa chegar ao ponto.
  expect(onibusAcessivelParaEmbarque(trecho("2026-11-19T13:30:00")).prefixo).toBe("F3");
  expect(onibusAcessivelParaEmbarque(trecho("2026-11-19T14:30:00"))).toBeNull();
  expect(onibusAcessivelParaEmbarque({ aoVivo: { status: "SEM_PREVISAO" } })).toBeNull();
});
