package br.com.vias.integracao.rotas;

import br.com.vias.integracao.comum.Coordenada;
import java.time.LocalDateTime;

/**
 * @param chegarAte horário em que a pessoa precisa chegar (já descontada a folga de recepção)
 * @param acessivel quando verdadeiro, só usa paradas, veículos e caminhos para cadeira de rodas
 */
public record PedidoRota(
        Coordenada origem,
        Coordenada destino,
        LocalDateTime chegarAte,
        ModoTransporte modo,
        boolean acessivel) {
}
