package br.com.vias.dto;

import br.com.vias.model.UnidadeServico;

import java.time.LocalDate;

/** Servico registrado para a unidade, com a fonte do vinculo. Nao significa vaga ou agenda. */
public record ServicoVinculoResponse(Long id, String codigo, String nome, String fonte, LocalDate dataReferencia) {

    public static ServicoVinculoResponse de(UnidadeServico us) {
        return new ServicoVinculoResponse(us.getServico().getId(), us.getServico().getCodigo(), us.getServico().getNome(),
                us.getFonte().getSigla(), us.getDataReferenciaFonte());
    }
}
