package br.com.vias.service;

import br.com.vias.dto.ContagemResponse;
import br.com.vias.dto.ResumoGestaoResponse;
import br.com.vias.repository.UnidadeSaudeRepository;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Camada BO: indicadores do painel do gestor. Cada indicador e uma contagem direta do cadastro;
 * nao ha inferencia de "deserto de acesso" (exigiria dados populacionais e de rota).
 */
@Service
public class GestaoService {

    private static final List<String> DEFINICOES = List.of(
            "totalUnidades: unidades cadastradas no banco (CNES ativos + cadastros manuais).",
            "porTipoUnidade: contagem pelo tipo de unidade informado pela fonte.",
            "porAtendeSus: indicador de atendimento ambulatorial SUS do CNES; NAO_INFORMADO quando a fonte não traz.",
            "porAcessibilidade: estado registrado; NAO_INFORMADO significa que a fonte não publica, não que a unidade seja inacessível.",
            "porServico: unidades com o indicador igual a 1 no CNES ou vinculadas manualmente. Ausência não significa que o serviço não existe.",
            "regioesComMaisUnidades: as 10 regioes (bairros do CNES) com mais unidades cadastradas.",
            "dataReferencia: menor e maior data de atualizacao informadas pela fonte nos registros.");

    private final UnidadeSaudeRepository unidadeRepository;

    public GestaoService(UnidadeSaudeRepository unidadeRepository) {
        this.unidadeRepository = unidadeRepository;
    }

    @Transactional(readOnly = true)
    public ResumoGestaoResponse resumo() {
        return new ResumoGestaoResponse(
                unidadeRepository.count(),
                contagens(unidadeRepository.contarPorTipo()),
                contagens(unidadeRepository.contarPorAtendeSus()),
                contagens(unidadeRepository.contarPorAcessibilidade()),
                contagens(unidadeRepository.contarPorServico()),
                contagens(unidadeRepository.contarPorRegiao(PageRequest.of(0, 10))),
                unidadeRepository.contarSemCoordenadas(),
                unidadeRepository.contarSemRegiao(),
                unidadeRepository.menorDataReferencia(),
                unidadeRepository.maiorDataReferencia(),
                DEFINICOES,
                LocalDateTime.now());
    }

    private static List<ContagemResponse> contagens(List<Object[]> linhas) {
        return linhas.stream().map(l -> new ContagemResponse(String.valueOf(l[0]), ((Number) l[1]).longValue())).toList();
    }
}
