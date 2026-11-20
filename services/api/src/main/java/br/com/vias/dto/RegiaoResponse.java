package br.com.vias.dto;

import br.com.vias.model.enums.TipoRegiao;

public record RegiaoResponse(Long id, String nome, TipoRegiao tipo, String codigoMunicipio, String uf,
                             String fonte, long totalUnidades) {
}
