import { requisitar } from "./client";

/**
 * Endpoints de unidades da API Java (contrato confirmado pelo Raphael em 16/11).
 *
 * GET /api/unidades devolve uma página:
 *   { items: UnidadeResumo[], total, pagina, tamanho, totalPaginas }
 * UnidadeResumo:
 *   { id, codigoCnes, nome, tipoUnidade, bairro, regiao: { id, nome, tipo } | null,
 *     atendeSus: "SIM" | "NAO" | "NAO_INFORMADO",
 *     acessibilidade: "ACESSIVEL" | "NAO_ACESSIVEL" | "NAO_INFORMADO" | "NAO_VERIFICADO",
 *     latitude, longitude, servicos: string[], fonte, dataReferenciaFonte }
 *
 * `pagina` começa em 0; `tamanho` vai de 1 a 100 (padrão 20).
 */
export function listarUnidades({
  servicoId,
  regiaoId,
  bairro,
  acessibilidade,
  pagina,
  tamanho,
  signal,
} = {}) {
  return requisitar("/unidades", {
    params: { servicoId, regiaoId, bairro, acessibilidade, pagina, tamanho },
    signal,
  });
}

/**
 * GET /api/unidades/{id}: detalhe com endereço, serviços, acessibilidade
 * ({ status, fonte, dataVerificacao }), proveniência e avisos escritos pela API.
 * 404 chega como ErroApi com status 404.
 */
export function obterUnidade(id, { signal } = {}) {
  if (id === undefined || id === null || id === "") {
    throw new TypeError("obterUnidade precisa de um id");
  }
  return requisitar(`/unidades/${encodeURIComponent(id)}`, { signal });
}
