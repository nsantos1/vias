package br.com.vias.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Percurso de transporte publico ate uma unidade. Horarios no fuso de Sao Paulo.
 *
 * @param chegarAte horario-alvo de chegada (atendimento menos a folga); nulo no modo "sair agora"
 * @param opcoes a primeira e a recomendada; lista vazia quando nao ha percurso
 */
public record PercursoResponse(
        Destino unidade,
        LocalDateTime horarioAtendimento,
        int folgaMinutos,
        LocalDateTime chegarAte,
        LocalDateTime calculadoEm,
        List<Opcao> opcoes,
        Fontes fontes,
        List<String> avisos) {

    public record Destino(Long id, String nome, BigDecimal latitude, BigDecimal longitude) {
    }

    /**
     * @param saida horario sugerido para sair da origem
     * @param chegaATempo nulo no modo "sair agora"
     */
    public record Opcao(
            boolean recomendada,
            LocalDateTime saida,
            LocalDateTime chegada,
            long duracaoMinutos,
            Integer distanciaMetros,
            Boolean chegaATempo,
            List<Trecho> trechos) {
    }

    /**
     * @param tipo A_PE, ONIBUS, METRO, TREM ou OUTRO
     * @param veiculo nome do veiculo dado pelo Google (por exemplo "Ônibus", "Metrô")
     * @param intervaloMinutos tempo entre partidas da linha, quando o Google informa
     * @param aoVivo previsao da SPTrans (so em trechos de onibus)
     * @param geometria polilinha codificada do Google (para desenhar no mapa)
     */
    public record Trecho(
            String tipo,
            String veiculo,
            Integer duracaoMinutos,
            Integer distanciaMetros,
            String de,
            String para,
            Linha linha,
            String sentido,
            Parada embarque,
            Parada desembarque,
            Integer paradas,
            Integer intervaloMinutos,
            AoVivo aoVivo,
            String geometria) {
    }

    public record Linha(String codigo, String nome, String cor, String corTexto, String operadora) {
    }

    public record Parada(String nome, Double latitude, Double longitude, LocalDateTime horario) {
    }

    /**
     * @param status DISPONIVEL, SEM_PREVISAO, FORA_DA_JANELA, LINHA_NAO_ENCONTRADA,
     *     PARADA_NAO_ENCONTRADA, NAO_CONFIGURADO ou INDISPONIVEL
     * @param onibus proximos onibus previstos no ponto de embarque (ate 5)
     * @param proximoAcessivel primeiro onibus acessivel previsto; nulo se nenhum
     */
    public record AoVivo(
            String status,
            String mensagem,
            String parada,
            String consultadoAs,
            List<Onibus> onibus,
            Onibus proximoAcessivel) {
    }

    /** @param acessivel nulo quando a SPTrans nao informa */
    public record Onibus(String prefixo, LocalDateTime previsto, Boolean acessivel) {
    }

    public record Fontes(String rotas, String aoVivo) {
    }
}
