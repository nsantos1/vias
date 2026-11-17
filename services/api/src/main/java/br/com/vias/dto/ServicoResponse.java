package br.com.vias.dto;

public record ServicoResponse(Long id, String codigo, String nome, String descricao, String campoOrigem,
                              String fonte, long totalUnidades) {
}
