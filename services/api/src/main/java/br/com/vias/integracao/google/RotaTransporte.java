package br.com.vias.integracao.google;

import java.time.Duration;
import java.time.Instant;
import java.util.List;

/**
 * Uma rota de transporte publico devolvida pelo Google Routes, ja convertida para tipos Java.
 * Nenhum campo e inventado: o que o Google nao manda fica nulo.
 */
public record RotaTransporte(Duration duracao, Integer distanciaMetros, List<Passo> passos) {

    public RotaTransporte {
        passos = List.copyOf(passos);
    }

    /**
     * Um passo da rota. Nos passos a pe, {@code transporte} e nulo.
     *
     * @param geometria polilinha codificada do Google (formato "encoded polyline"), quando enviada
     */
    public record Passo(Duration duracao, Integer distanciaMetros, String geometria, Transporte transporte) {

        public boolean aPe() {
            return transporte == null;
        }
    }

    /**
     * Trecho em onibus, metro ou trem.
     *
     * @param tipoVeiculo tipo do Google (BUS, SUBWAY, HEAVY_RAIL...)
     * @param nomeVeiculo nome do veiculo no idioma pedido (por exemplo "Onibus")
     * @param linhaCurta nome curto da linha (para a SPTrans, o letreiro, como "8000-10")
     * @param sentido destino mostrado no letreiro (headsign)
     * @param intervalo tempo esperado entre partidas (headway), quando informado
     */
    public record Transporte(
            String tipoVeiculo,
            String nomeVeiculo,
            String linhaCurta,
            String linhaNome,
            String cor,
            String corTexto,
            String operadora,
            String sentido,
            Parada embarque,
            Parada desembarque,
            Integer paradas,
            Duration intervalo) {
    }

    public record Parada(String nome, Double latitude, Double longitude, Instant horario) {
    }
}
