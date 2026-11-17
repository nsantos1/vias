package br.com.vias.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/** Indicadores agregados do cadastro para o painel do gestor. Sem dados pessoais. */
public record ResumoGestaoResponse(
        long totalUnidades,
        List<ContagemResponse> porTipoUnidade,
        List<ContagemResponse> porAtendeSus,
        List<ContagemResponse> porAcessibilidade,
        List<ContagemResponse> porServico,
        List<ContagemResponse> regioesComMaisUnidades,
        long unidadesSemCoordenadas,
        long unidadesSemRegiao,
        LocalDate dataReferenciaMaisAntiga,
        LocalDate dataReferenciaMaisRecente,
        List<String> definicoes,
        LocalDateTime consultadoEm) {
}
