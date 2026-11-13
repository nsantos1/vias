package br.com.vias.integracao.rotas;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

public record Itinerario(LocalDateTime partida, LocalDateTime chegada, List<Trecho> trechos) {

    public Itinerario {
        trechos = List.copyOf(trechos);
    }

    public Duration duracao() {
        return Duration.between(partida, chegada);
    }
}
