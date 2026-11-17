package br.com.vias.dto;

import br.com.vias.model.enums.RespostaCadastro;
import br.com.vias.model.enums.StatusAcessibilidade;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

/** Item da listagem/pesquisa de unidades. */
public record UnidadeResumoResponse(
        Long id,
        String codigoCnes,
        String nome,
        String tipoUnidade,
        String bairro,
        RegiaoResumo regiao,
        RespostaCadastro atendeSus,
        StatusAcessibilidade acessibilidade,
        BigDecimal latitude,
        BigDecimal longitude,
        List<String> servicos,
        String fonte,
        LocalDate dataReferenciaFonte) {
}
