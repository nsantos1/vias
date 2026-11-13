package br.com.vias.integracao.olhovivo;

import java.time.LocalTime;

/**
 * @param letreiro linha no formato do GTFS (por exemplo "8000-10"), montado a partir dos campos
 *     lt e tl da Olho Vivo, para ligar com o route_id do GTFS
 * @param horarioPrevisto horário previsto de chegada na parada (campo t)
 * @param acessivel veículo acessível (campo a); é o que filtra o "próximo ônibus acessível"
 * @param ultimaPosicao hora da última posição recebida (campo ta); posição antiga não deve ser
 *     mostrada, e o app volta para o horário do GTFS
 */
public record PrevisaoChegada(
        String letreiro,
        String prefixoVeiculo,
        LocalTime horarioPrevisto,
        boolean acessivel,
        LocalTime ultimaPosicao) {
}
