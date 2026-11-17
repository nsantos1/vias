package br.com.vias.dto;

import br.com.vias.model.Regiao;
import br.com.vias.model.enums.TipoRegiao;

public record RegiaoResumo(Long id, String nome, TipoRegiao tipo) {

    public static RegiaoResumo de(Regiao r) {
        return r == null ? null : new RegiaoResumo(r.getId(), r.getNome(), r.getTipo());
    }
}
