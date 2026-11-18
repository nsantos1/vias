/**
 * Funções puras da tela de percurso (D-20). Os horários chegam da API como
 * "AAAA-MM-DDTHH:mm:ss" no fuso de São Paulo; a tela mostra só "HH:mm", sem
 * converter fuso (assim não muda conforme o relógio do aparelho).
 */

export const FOLGAS = Object.freeze([
  { valor: "0", rotulo: "Na hora marcada" },
  { valor: "15", rotulo: "15 minutos antes" },
  { valor: "30", rotulo: "30 minutos antes" },
]);
export const FOLGA_PADRAO = "15";
/** O Google só tem a programação das linhas para alguns dias à frente. */
export const DIAS_A_FRENTE = 6;

const TIPOS = {
  A_PE: "A pé",
  ONIBUS: "Ônibus",
  METRO: "Metrô",
  TREM: "Trem",
  OUTRO: "Transporte",
};

/** "13:42" a partir de "2026-11-19T13:42:00"; null se faltar ou vier inválido. */
export function horaDe(valor) {
  if (typeof valor !== "string") return null;
  const achado = /T(\d{2}):(\d{2})/.exec(valor);
  return achado ? `${achado[1]}:${achado[2]}` : null;
}

export function rotuloTipo(tipo) {
  return TIPOS[tipo] ?? TIPOS.OUTRO;
}

/** "1 h 05 min" ou "28 min". */
export function formatarDuracao(minutos) {
  if (!Number.isFinite(minutos) || minutos < 0) return null;
  const total = Math.round(minutos);
  if (total < 60) return `${total} min`;
  const horas = Math.floor(total / 60);
  const resto = total % 60;
  return resto ? `${horas} h ${String(resto).padStart(2, "0")} min` : `${horas} h`;
}

/** "350 m" ou "1,2 km". */
export function formatarMetros(metros) {
  if (!Number.isFinite(metros) || metros <= 0) return null;
  if (metros < 1000) return `${Math.round(metros / 10) * 10 || metros} m`;
  return `${(metros / 1000).toLocaleString("pt-BR", { maximumFractionDigits: 1 })} km`;
}

/** Data local "AAAA-MM-DD" (sem passar por UTC, que mudaria o dia à noite). */
export function dataLocal(data = new Date(), somarDias = 0) {
  const d = new Date(data.getFullYear(), data.getMonth(), data.getDate() + somarDias);
  return [d.getFullYear(), String(d.getMonth() + 1).padStart(2, "0"), String(d.getDate()).padStart(2, "0")].join("-");
}

/** "2026-11-19T14:30:00", ou null se a data ou a hora estiverem incompletas. */
export function montarHorario(data, hora) {
  if (!/^\d{4}-\d{2}-\d{2}$/.test(data ?? "") || !/^\d{2}:\d{2}$/.test(hora ?? "")) return null;
  return `${data}T${hora}:00`;
}

/** Minutos entre a chegada prevista e o atendimento (positivo = chega antes). */
export function minutosDeSobra(chegada, atendimento) {
  const a = Date.parse(chegada);
  const b = Date.parse(atendimento);
  if (Number.isNaN(a) || Number.isNaN(b)) return null;
  return Math.round((b - a) / 60_000);
}

/** Resumo das linhas de uma opção: "Ônibus 8000-10 → Metrô Linha 2". */
export function resumoLinhas(trechos = []) {
  const partes = trechos
    .filter((t) => t.tipo !== "A_PE")
    .map((t) => [rotuloTipo(t.tipo), t.linha?.codigo ?? t.linha?.nome].filter(Boolean).join(" "));
  return partes.length ? partes.join(" → ") : "Só a pé";
}

/**
 * Link do Google Maps com o destino e o modo transporte público. A origem não
 * vai na URL: o app de mapas usa a localização do próprio aparelho.
 */
export function linkComoChegar(unidade) {
  const lat = numero(unidade?.latitude);
  const lon = numero(unidade?.longitude);
  if (lat === null || lon === null) return null;
  const params = new URLSearchParams({ api: "1", destination: `${lat},${lon}`, travelmode: "transit" });
  return `https://www.google.com/maps/dir/?${params}`;
}

/** Número a partir do valor da API; null (e não 0) quando falta. */
export function numero(valor) {
  if (valor === null || valor === undefined || valor === "") return null;
  const n = Number(valor);
  return Number.isFinite(n) ? n : null;
}
