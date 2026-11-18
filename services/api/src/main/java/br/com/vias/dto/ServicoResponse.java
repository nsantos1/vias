package br.com.vias.dto;

/**
 * Item do catalogo. categoria: EXAME, ESPECIALIDADE ou ATENDIMENTO (V5).
 */
public record ServicoResponse(Long id, String codigo, String nome, String descricao, String campoOrigem,
                              String categoria, String fonte, long totalUnidades) {
}
