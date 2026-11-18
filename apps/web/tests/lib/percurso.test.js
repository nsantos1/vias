import {
  dataLocal,
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
