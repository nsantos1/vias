import { agruparPorCategoria, filtrarCatalogo, normalizar, temCategorias } from "@/lib/catalogo";

// Catálogo FICTÍCIO de teste. Nomes e números não são dados reais do CNES.
const SEM_CATEGORIA = [
  { id: 1, nome: "Atendimento fictício B", descricao: "Indicador fictício" },
  { id: 2, nome: "Atendimento fictício A", descricao: "Outro indicador" },
];

const COM_CATEGORIA = [
  { id: 10, nome: "Ultrassonografia fictícia", descricao: "Exame de imagem", categoria: "EXAME" },
  { id: 11, nome: "Pediatria fictícia", descricao: "Consulta", categoria: "ESPECIALIDADE" },
  { id: 12, nome: "Atendimento fictício", descricao: "Indicador", categoria: "ATENDIMENTO" },
  { id: 13, nome: "Mamografia fictícia", descricao: "Exame de imagem", categoria: "EXAME" },
  { id: 14, nome: "Item sem grupo conhecido", descricao: "", categoria: "OUTRA" },
];

test("normalizar ignora acento e maiúsculas", () => {
  expect(normalizar("  Ultrassonografía ")).toBe("ultrassonografia");
});

describe("filtrarCatalogo", () => {
  test("acha pelo nome sem acento e pela descrição", () => {
    expect(filtrarCatalogo(COM_CATEGORIA, "ULTRASSON").map((s) => s.id)).toEqual([10]);
    // Só trecho do texto: "ultrassom" (com m) não é parte de "ultrassonografia".
    expect(filtrarCatalogo(COM_CATEGORIA, "ultrassom")).toEqual([]);
    expect(filtrarCatalogo(COM_CATEGORIA, "imagem").map((s) => s.id)).toEqual([13, 10]);
  });

  test("termo sem correspondência devolve lista vazia (não inventa sinônimo)", () => {
    expect(filtrarCatalogo(COM_CATEGORIA, "raio-x")).toEqual([]);
  });

  test("ordem: exames, especialidades, atendimento, outros; depois nome", () => {
    expect(filtrarCatalogo(COM_CATEGORIA, "").map((s) => s.id)).toEqual([13, 10, 11, 12, 14]);
  });

  test("sem categorias: ordem alfabética, respeitando o máximo", () => {
    expect(filtrarCatalogo(SEM_CATEGORIA, "", 1).map((s) => s.id)).toEqual([2]);
  });
});

describe("agruparPorCategoria", () => {
  test("sem categorias na API: um grupo só, sem cabeçalho", () => {
    const grupos = agruparPorCategoria(filtrarCatalogo(SEM_CATEGORIA, ""), temCategorias(SEM_CATEGORIA));
    expect(grupos).toHaveLength(1);
    expect(grupos[0].rotulo).toBeNull();
  });

  test("com categorias: grupos com rótulo e índice plano para o teclado", () => {
    const lista = filtrarCatalogo(COM_CATEGORIA, "");
    const grupos = agruparPorCategoria(lista, temCategorias(COM_CATEGORIA));
    expect(grupos.map((g) => g.rotulo)).toEqual(["Exames", "Especialidades", "Atendimento", "Outros serviços"]);
    expect(grupos.flatMap((g) => g.itens.map((i) => i.indice))).toEqual([0, 1, 2, 3, 4]);
  });

  test("lista vazia: nenhum grupo", () => {
    expect(agruparPorCategoria([], true)).toEqual([]);
  });
});
