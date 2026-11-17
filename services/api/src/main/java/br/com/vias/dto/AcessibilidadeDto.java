package br.com.vias.dto;

import br.com.vias.model.enums.StatusAcessibilidade;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PastOrPresent;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

/**
 * Acessibilidade com o estado e a comprovacao. ACESSIVEL/NAO_ACESSIVEL exigem fonte e data.
 */
public record AcessibilidadeDto(
        @Schema(example = "ACESSIVEL") @NotNull StatusAcessibilidade status,
        @Schema(example = "Vistoria da equipe VIAS com o checklist NBR 9050") @Size(max = 200) String fonte,
        @Schema(example = "2026-11-14") @PastOrPresent LocalDate dataVerificacao) {
}
