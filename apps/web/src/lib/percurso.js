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

// ---------------------------------------------------------------- mapa e opções (D-20, revisão de 18/11)

/**
 * Decodifica uma polilinha do Google ("encoded polyline", precisão 5) em
 * [[lat, lon], …]. Texto inválido devolve o que deu para ler, sem inventar pontos.
 */
export function decodificarPolilinha(texto) {
  if (typeof texto !== "string" || !texto) return [];
  const pontos = [];
  let indice = 0;
  let lat = 0;
  let lon = 0;
  while (indice < texto.length) {
    const valores = [];
    for (let k = 0; k < 2; k += 1) {
      let resultado = 0;
      let deslocamento = 0;
      let byte;
      do {
        if (indice >= texto.length) return pontos;
        byte = texto.charCodeAt(indice++) - 63;
        resultado |= (byte & 0x1f) << deslocamento;
        deslocamento += 5;
      } while (byte >= 0x20);
      valores.push(resultado & 1 ? ~(resultado >> 1) : resultado >> 1);
    }
    lat += valores[0];
    lon += valores[1];
    pontos.push([lat / 1e5, lon / 1e5]);
  }
  return pontos;
}

/** A API manda `geometria` como lista; versões antigas mandavam um texto só. */
export function geometriasDo(trecho) {
  const g = trecho?.geometria;
  if (Array.isArray(g)) return g.filter((x) => typeof x === "string" && x);
  return typeof g === "string" && g ? [g] : [];
}

/** Linhas (lat/lon) de cada trecho para o mapa; trecho sem geometria fica sem linha. */
export function linhasDoMapa(trechos = []) {
  return trechos
    .map((trecho, indice) => ({
      indice,
      tipo: trecho.tipo,
      cor: trecho.linha?.cor ?? null,
      pontos: geometriasDo(trecho).flatMap(decodificarPolilinha),
    }))
    .filter((l) => l.pontos.length > 1);
}

/** "ONIBUS", "TRILHOS" (metrô ou trem), "MISTO" ou "A_PE". */
export function categoriaDaOpcao(opcao) {
  const tipos = new Set((opcao?.trechos ?? []).map((t) => t.tipo).filter((t) => t !== "A_PE"));
  if (!tipos.size) return "A_PE";
  const trilhos = tipos.has("METRO") || tipos.has("TREM");
  const onibus = tipos.has("ONIBUS") || tipos.has("OUTRO");
  if (trilhos && onibus) return "MISTO";
  return trilhos ? "TRILHOS" : "ONIBUS";
}

export const FILTROS = Object.freeze([
  { valor: "TODAS", rotulo: "Todas", aceita: () => true },
  { valor: "ONIBUS", rotulo: "Só ônibus", aceita: (c) => c === "ONIBUS" },
  { valor: "TRILHOS", rotulo: "Com metrô ou trem", aceita: (c) => c === "TRILHOS" || c === "MISTO" },
]);

/**
 * Escolhe a opção a destacar dentro de uma lista: a que a API recomendou, se
 * estiver nela; senão, com horário marcado, a que chega a tempo saindo mais
 * tarde; sem horário, a que chega primeiro (a mesma regra da API).
 */
export function escolherDestaque(opcoes, comHorario) {
  if (!opcoes?.length) return null;
  const daApi = opcoes.find((o) => o.recomendada);
  if (daApi) return daApi;
  const aTempo = opcoes.filter((o) => o.chegaATempo !== false);
  const base = comHorario && aTempo.length ? aTempo : opcoes;
  return [...base].sort((a, b) =>
    comHorario && aTempo.length
      ? String(b.saida).localeCompare(String(a.saida))
      : String(a.chegada).localeCompare(String(b.chegada)),
  )[0];
}

function somarMinutos(isoLocal, minutos) {
  const m = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})/.exec(isoLocal ?? "");
  if (!m || !Number.isFinite(minutos)) return null;
  const d = new Date(Date.UTC(+m[1], +m[2] - 1, +m[3], +m[4], +m[5] + minutos));
  return d.toISOString().slice(0, 16) + ":00";
}

/**
 * Hora de início de cada trecho, para a linha do tempo: ônibus e metrô usam o
 * horário de embarque da API; a caminhada começa onde o trecho anterior termina.
 */
export function horariosDosTrechos(opcao) {
  let cursor = opcao?.saida ?? null;
  return (opcao?.trechos ?? []).map((t) => {
    if (t.tipo === "A_PE") {
      const inicio = cursor;
      cursor = somarMinutos(cursor, t.duracaoMinutos ?? 0);
      return inicio;
    }
    const inicio = t.embarque?.horario ?? cursor;
    cursor = t.desembarque?.horario ?? somarMinutos(inicio, t.duracaoMinutos ?? 0);
    return inicio;
  });
}

/** Minutos entre dois horários locais "AAAA-MM-DDTHH:mm:ss" (b - a). */
export function minutosEntre(a, b) {
  const pa = Date.parse(`${String(a).slice(0, 19)}Z`);
  const pb = Date.parse(`${String(b).slice(0, 19)}Z`);
  if (Number.isNaN(pa) || Number.isNaN(pb)) return null;
  return Math.round((pb - pa) / 60_000);
}

/**
 * Ônibus acessível da previsão ao vivo que serve para o embarque planejado:
 * o primeiro com chegada entre 3 min antes e 20 min depois do horário de
 * embarque (antes disso, a pessoa ainda não chegou ao ponto). Sem horário de embarque, o próximo acessível. A previsão só cobre
 * ônibus que já estão rodando, então um embarque distante não tem um.
 */
export function onibusAcessivelParaEmbarque(trecho) {
  const aoVivo = trecho?.aoVivo;
  if (aoVivo?.status !== "DISPONIVEL") return null;
  const embarque = trecho.embarque?.horario;
  if (!embarque) return aoVivo.proximoAcessivel ?? null;
  return (
    (aoVivo.onibus ?? []).find((o) => {
      if (o.acessivel !== true) return false;
      const diferenca = minutosEntre(embarque, o.previsto);
      return diferenca !== null && diferenca >= -3 && diferenca <= 20;
    }) ?? null
  );
}
