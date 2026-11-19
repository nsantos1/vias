package br.com.vias.dto;

import br.com.vias.model.UnidadeSaude;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * De onde veio o dado e quando. Tres instantes diferentes, nunca misturados:
 * dataReferencia (a fonte), dataCarga (entrada no banco) e dataAtualizacao (ultima edicao pela API).
 */
public record ProvenienciaResponse(String fonte, String nomeFonte, String url, boolean oficial,
                                   LocalDate dataReferencia, LocalDateTime dataCarga, LocalDateTime dataAtualizacao) {

    public static ProvenienciaResponse de(UnidadeSaude u) {
        return new ProvenienciaResponse(u.getFonte().getSigla(), u.getFonte().getNome(), u.getFonte().getUrl(),
                u.getFonte().isOficial(), u.getDataReferenciaFonte(), u.getDataCarga(), u.getDataAtualizacao());
    }
}
