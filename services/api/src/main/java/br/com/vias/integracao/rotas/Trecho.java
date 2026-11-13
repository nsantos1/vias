package br.com.vias.integracao.rotas;

import br.com.vias.integracao.comum.Coordenada;
import java.time.LocalDateTime;

/**
 * Um pedaço do itinerário, como "pegue o 8000-10 sentido Lapa no ponto X".
 *
 * @param linha letreiro da linha (por exemplo "8000-10"); vazio nos trechos a pé
 * @param sentido destino mostrado no letreiro; vazio nos trechos a pé
 * @param de nome da parada ou do lugar de partida do trecho
 * @param para nome da parada ou do lugar de chegada do trecho
 * @param embarque ponto onde o trecho começa (para desenhar no mapa)
 */
public record Trecho(
        ModoTrecho modo,
        String linha,
        String sentido,
        String de,
        String para,
        LocalDateTime partida,
        LocalDateTime chegada,
        Coordenada embarque) {
}
