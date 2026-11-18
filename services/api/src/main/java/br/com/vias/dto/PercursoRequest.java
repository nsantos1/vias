package br.com.vias.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

/**
 * Pedido de percurso ate uma unidade. A origem vai no corpo (e nao na URL) porque e a
 * localizacao da pessoa: a API usa so para este calculo e nao grava nem registra em log.
 *
 * @param horarioAtendimento horario marcado na unidade (fuso de Sao Paulo); nulo = sair agora
 * @param folgaMinutos minutos de antecedencia para chegar antes do atendimento (padrao 15)
 */
public record PercursoRequest(
        @NotNull(message = "Informe a unidade de destino.") Long unidadeId,
        @NotNull(message = "Informe a origem (latitude e longitude).") @Valid Origem origem,
        @Schema(example = "2026-11-19T14:30:00") LocalDateTime horarioAtendimento,
        @Min(value = 0, message = "A folga não pode ser negativa.")
        @Max(value = 60, message = "A folga vai até 60 minutos.") Integer folgaMinutos) {

    public record Origem(
            @NotNull(message = "Informe a latitude.")
            @DecimalMin(value = "-90", message = "Latitude inválida.")
            @DecimalMax(value = "90", message = "Latitude inválida.") Double latitude,
            @NotNull(message = "Informe a longitude.")
            @DecimalMin(value = "-180", message = "Longitude inválida.")
            @DecimalMax(value = "180", message = "Longitude inválida.") Double longitude) {
    }
}
