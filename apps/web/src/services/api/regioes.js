import { requisitar } from "./client";

/**
 * GET /api/regioes: regiões para o filtro (contrato confirmado em 16/11).
 * Hoje a região é o bairro informado no cadastro do CNES.
 * Cada item: { id, nome, tipo, codigoMunicipio, uf, fonte, totalUnidades }.
 */
export function listarRegioes({ signal } = {}) {
  return requisitar("/regioes", { signal });
}

/** GET /api/regioes/{id}: uma região (404 se não existir). */
export function obterRegiao(id, { signal } = {}) {
  return requisitar(`/regioes/${encodeURIComponent(id)}`, { signal });
}
