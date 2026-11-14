// FIXTURES FICTÍCIAS — só para testes. Não representam unidades nem serviços reais.

export const LISTA_FICTICIA = Object.freeze({
  items: [
    { id: "ficticio-1", nome: "Registro fictício 1" },
    { id: "ficticio-2", nome: "Registro fictício 2" },
  ],
  total: 2,
});

export const LISTA_VAZIA = Object.freeze({ items: [], total: 0 });

// Formato de erro do Alinhamento Técnico §5.4 (ainda a confirmar com o Raphael)
export const ERRO_404_FICTICIO = Object.freeze({
  timestamp: "2026-11-14T10:00:00",
  status: 404,
  error: "NOT_FOUND",
  message: "Unidade não encontrada",
  path: "/api/unidades/ficticio-inexistente",
});
