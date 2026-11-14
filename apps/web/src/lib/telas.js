/**
 * Dados de cada tela para o cabeçalho: rótulo ao lado do logo e para onde o
 * botão "Voltar" leva quando não há histórico. Segue docs/sitemap.md e as
 * referências de UI (docs/referencias-ui.md).
 */
const TELAS = [
  { padrao: /^\/$/, rotulo: "Busca de atendimento", voltarPara: null },
  { padrao: /^\/unidades\/[^/]+$/, rotulo: "Unidade de saúde", voltarPara: "/unidades" },
  { padrao: /^\/unidades$/, rotulo: "Resultado da busca", voltarPara: "/" },
  { padrao: /^\/rota$/, rotulo: "Percurso", voltarPara: "/unidades" },
  { padrao: /^\/gestao/, rotulo: "Painel do gestor", voltarPara: "/" },
  { padrao: /^\/dev\//, rotulo: "Desenvolvimento", voltarPara: "/" },
];

export function dadosDaTela(pathname) {
  return TELAS.find((tela) => tela.padrao.test(pathname)) ?? { rotulo: null, voltarPara: "/" };
}
