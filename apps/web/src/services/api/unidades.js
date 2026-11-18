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

export const TAMANHO_MAXIMO_PAGINA = 100;
const LIMITE_PAGINAS = 15; // até 1.500 unidades; hoje a base inteira tem 1.092

/**
 * Todas as unidades de um serviço, juntando as páginas da API, para o
 * navegador ordenar pela distância até a pessoa (D-18). A API não aceita
 * localização, e a localização não sai do aparelho.
 * Devolve { items, total, completo } — `completo` é false se o limite de
 * páginas cortou a lista (a tela avisa).
 */
export async function listarTodasUnidadesDoServico({ servicoId, signal }) {
  const primeira = await listarUnidades({ servicoId, pagina: 0, tamanho: TAMANHO_MAXIMO_PAGINA, signal });
  const totalPaginas = Math.max(1, Number(primeira?.totalPaginas) || 1);
  const ate = Math.min(totalPaginas, LIMITE_PAGINAS);
  const restantes = await Promise.all(
    Array.from({ length: ate - 1 }, (_, i) =>
      listarUnidades({ servicoId, pagina: i + 1, tamanho: TAMANHO_MAXIMO_PAGINA, signal }),
    ),
  );
  const items = [primeira, ...restantes].flatMap((pagina) => pagina?.items ?? []);
  return { items, total: primeira?.total ?? items.length, completo: ate === totalPaginas };
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
