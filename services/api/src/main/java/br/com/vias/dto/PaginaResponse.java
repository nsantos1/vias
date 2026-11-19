package br.com.vias.dto;

import org.springframework.data.domain.Page;

import java.util.List;

/** Lista paginada: itens e total da consulta. */
public record PaginaResponse<T>(List<T> items, long total, int pagina, int tamanho, int totalPaginas) {

    public static <T> PaginaResponse<T> de(Page<?> page, List<T> items) {
        return new PaginaResponse<>(items, page.getTotalElements(), page.getNumber(), page.getSize(), page.getTotalPages());
    }
}
