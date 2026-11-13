package br.com.vias.integracao.google;

import br.com.vias.integracao.comum.Coordenada;
import java.time.Duration;
import java.time.Instant;

/** Tempo de carro e moto pela Google Routes API, com o modelo de trânsito pessimista. */
public interface ClienteRotasCarro {

    /**
     * Tempo de viagem no pior cenário provável saindo no instante informado. O cálculo do
     * horário de saída (pasta agendamento) testa algumas partidas até achar a que chega a tempo.
     */
    Duration tempoPessimista(Coordenada origem, Coordenada destino, Instant partida, Veiculo veiculo);
}
