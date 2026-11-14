import { requisitar } from "./client";

/**
 * Endpoints de unidades PROPOSTOS no Alinhamento Técnico §5, ainda não
 * confirmados (D-04). Os nomes dos filtros (servicoId, regiaoId, bairro,
 * acessibilidade) seguem a proposta e mudam aqui se o Raphael mudar.
 * Devolvem o JSON como a API mandar; a adaptação de campos entra aqui quando o
 * DTO for confirmado (inclusive acessibilidade e proveniência, D-02 e D-03).
 */

/**
 * GET /api/unidades — lista filtrada. Só os filtros informados vão na URL.
 * O filtro de acessibilidade só deve ser usado depois que o domínio for
 * confirmado (D-02); até lá a tela não o oferece.
 */
export function listarUnidades({ servicoId, regiaoId, bairro, acessibilidade, signal } = {}) {
  return requisitar("/unidades", {
    params: { servicoId, regiaoId, bairro, acessibilidade },
    signal,
  });
}

/** GET /api/unidades/{id} — detalhe. 404 chega como ErroApi com status 404. */
export function obterUnidade(id, { signal } = {}) {
  if (id === undefined || id === null || id === "") {
    throw new TypeError("obterUnidade precisa de um id");
  }
  return requisitar(`/unidades/${encodeURIComponent(id)}`, { signal });
}
