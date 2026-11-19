package br.com.vias.dto;

import br.com.vias.model.enums.RespostaCadastro;

import java.math.BigDecimal;
import java.util.List;

/**
 * Detalhe da unidade. "avisos" explica ao front-end o que o dado NAO garante
 * (horario cadastral, acessibilidade desconhecida...), para nao virar promessa ao cidadao.
 */
public record UnidadeDetalheResponse(
        Long id,
        String codigoCnes,
        String nome,
        String razaoSocial,
        Integer codigoTipoUnidade,
        String tipoUnidade,
        EnderecoResponse endereco,
        String telefone,
        BigDecimal latitude,
        BigDecimal longitude,
        String horarioFuncionamento,
        RespostaCadastro atendeSus,
        AcessibilidadeDto acessibilidade,
        RegiaoResumo regiao,
        List<ServicoVinculoResponse> servicos,
        ProvenienciaResponse proveniencia,
        boolean camposCadastraisProtegidos,
        List<String> avisos) {
}
