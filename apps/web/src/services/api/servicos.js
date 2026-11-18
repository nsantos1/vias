import { requisitar } from "./client";

/**
 * GET /api/servicos: catálogo de serviços (contrato confirmado em 16/11).
 * Cada item: { id, codigo, nome, descricao, campoOrigem, fonte, totalUnidades }.
 * D-19: quando a API passar a mandar `categoria` (EXAME / ESPECIALIDADE /
 * ATENDIMENTO), a busca agrupa as sugestões sozinha (src/lib/catalogo.js).
 */
export function listarServicos({ signal } = {}) {
  return requisitar("/servicos", { signal });
}

/** GET /api/servicos/{id}: um serviço do catálogo (404 se não existir). */
export function obterServico(id, { signal } = {}) {
  return requisitar(`/servicos/${encodeURIComponent(id)}`, { signal });
}
