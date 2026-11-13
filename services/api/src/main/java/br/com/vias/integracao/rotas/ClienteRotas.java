package br.com.vias.integracao.rotas;

import java.util.List;

/** Rotas de transporte público, a pé e de bicicleta, calculadas pelo OpenTripPlanner. */
public interface ClienteRotas {

    /**
     * Devolve os itinerários que chegam ao destino até o horário pedido, do melhor para o pior.
     * Lista vazia quando não há rota (por exemplo, nenhuma rota acessível).
     */
    List<Itinerario> planejar(PedidoRota pedido);
}
