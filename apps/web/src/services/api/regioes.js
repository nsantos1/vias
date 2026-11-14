import { requisitar } from "./client";

/**
 * GET /api/regioes — regiões para o filtro.
 * Endpoint PROPOSTO no Alinhamento Técnico §5; ainda não confirmado (D-04).
 * Devolve o JSON como a API mandar; a adaptação entra aqui quando o DTO for confirmado.
 */
export function listarRegioes({ signal } = {}) {
  return requisitar("/regioes", { signal });
}
