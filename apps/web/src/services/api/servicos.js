import { requisitar } from "./client";

/**
 * GET /api/servicos — catálogo de serviços/necessidades.
 * Endpoint PROPOSTO no Alinhamento Técnico §5; ainda não confirmado (D-04).
 * Devolve o JSON como a API mandar. A adaptação de campos entra aqui, e só
 * aqui, quando o Raphael confirmar o DTO.
 */
export function listarServicos({ signal } = {}) {
  return requisitar("/servicos", { signal });
}
