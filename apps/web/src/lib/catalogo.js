/**
 * Catálogo de serviços da busca (GET /api/servicos).
 *
 * D-19: exames e especialidades dependem de uma carga nova no banco (equipamentos
 * e serviços especializados do CNES) e de um campo `categoria` na API. O front já
 * agrupa por categoria quando ela vier; enquanto não vier, a lista continua sem
 * cabeçalhos. Nada aqui inventa serviço ou sinônimo: só filtra o que a API mandou.
 */

export const CATEGORIAS = Object.freeze({
  EXAME: "Exames",
  ESPECIALIDADE: "Especialidades",
  ATENDIMENTO: "Atendimento",
});

const ORDEM = ["EXAME", "ESPECIALIDADE", "ATENDIMENTO"];
const OUTROS = "Outros serviços";

/** Sem acento e sem diferença de maiúsculas ("cirurgico" acha "Centro cirúrgico"). */
export function normalizar(texto) {
  return String(texto ?? "")
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .trim();
}

function posicaoCategoria(categoria) {
  const i = ORDEM.indexOf(categoria);
  return i === -1 ? ORDEM.length : i;
}

/**
 * Serviços que batem com o termo (no nome ou na descrição), na ordem:
 * categoria (exames, especialidades, atendimento, outros) → começa com o termo → nome.
 */
export function filtrarCatalogo(catalogo, termo, maximo = 12) {
  const lista = Array.isArray(catalogo) ? catalogo : [];
  const t = normalizar(termo);
  const encontrados = t
    ? lista.filter((s) => normalizar(s.nome).includes(t) || normalizar(s.descricao).includes(t))
    : lista;
  return [...encontrados]
    .sort(
      (a, b) =>
        posicaoCategoria(a.categoria) - posicaoCategoria(b.categoria) ||
        Number(!normalizar(a.nome).startsWith(t)) - Number(!normalizar(b.nome).startsWith(t)) ||
        String(a.nome).localeCompare(String(b.nome), "pt-BR"),
    )
    .slice(0, maximo);
}

/** true quando a API já manda `categoria` em pelo menos um serviço. */
export function temCategorias(catalogo) {
  return Array.isArray(catalogo) && catalogo.some((s) => s?.categoria);
}

/**
 * Agrupa a lista (já filtrada e ordenada) para os cabeçalhos do combobox.
 * Cada item guarda o `indice` na lista plana, usado pela navegação por teclado.
 * Sem categorias na API, devolve um grupo só, sem rótulo.
 */
export function agruparPorCategoria(sugestoes, comCategorias) {
  const lista = Array.isArray(sugestoes) ? sugestoes : [];
  if (!comCategorias) {
    return lista.length ? [{ chave: "todos", rotulo: null, itens: lista.map((servico, indice) => ({ servico, indice })) }] : [];
  }
  const grupos = new Map();
  lista.forEach((servico, indice) => {
    const chave = ORDEM.includes(servico.categoria) ? servico.categoria : "OUTROS";
    if (!grupos.has(chave)) {
      grupos.set(chave, { chave, rotulo: CATEGORIAS[chave] ?? OUTROS, itens: [] });
    }
    grupos.get(chave).itens.push({ servico, indice });
  });
  return [...grupos.values()];
}
