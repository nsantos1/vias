const DATA = new Intl.DateTimeFormat("pt-BR", { day: "2-digit", month: "2-digit", year: "numeric" });
const DATA_HORA = new Intl.DateTimeFormat("pt-BR", {
  day: "2-digit",
  month: "2-digit",
  year: "numeric",
  hour: "2-digit",
  minute: "2-digit",
});

function paraData(valor) {
  if (valor === null || valor === undefined || valor === "") return null;
  // "AAAA-MM-DD" sozinho é lido como meia-noite local, não UTC (evita mostrar o dia anterior).
  const texto = typeof valor === "string" && /^\d{4}-\d{2}-\d{2}$/.test(valor) ? `${valor}T00:00:00` : valor;
  const data = new Date(texto);
  return Number.isNaN(data.getTime()) ? null : data;
}

/** "14/11/2026", ou null se a data faltar ou for inválida (nunca inventa uma data). */
export function formatarData(valor) {
  const data = paraData(valor);
  return data ? DATA.format(data) : null;
}

/** "14/11/2026, 13:05", ou null se a data faltar ou for inválida. */
export function formatarDataHora(valor) {
  const data = paraData(valor);
  return data ? DATA_HORA.format(data) : null;
}
