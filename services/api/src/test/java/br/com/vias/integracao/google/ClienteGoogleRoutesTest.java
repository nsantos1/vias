package br.com.vias.integracao.google;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;

import java.io.InputStream;
import java.time.Duration;
import java.time.Instant;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

/** Leitura da resposta do Google Routes a partir de uma fixture ficticia (src/test/resources/fixtures). */
class ClienteGoogleRoutesTest {

    private List<RotaTransporte> lerFixture() throws Exception {
        try (InputStream in = getClass().getResourceAsStream("/fixtures/google-routes-transit.json")) {
            return ClienteGoogleRoutes.interpretar(new ObjectMapper().readTree(in));
        }
    }

    @Test
    void leRotasPassosEDetalhesDoTransporte() throws Exception {
        List<RotaTransporte> rotas = lerFixture();

        assertThat(rotas).hasSize(2);
        RotaTransporte rota = rotas.get(0);
        assertThat(rota.duracao()).isEqualTo(Duration.ofMinutes(40));
        assertThat(rota.passos()).hasSize(5);
        assertThat(rota.passos().get(0).aPe()).isTrue();
        assertThat(rota.passos().get(0).geometria()).isEqualTo("abc");

        RotaTransporte.Transporte onibus = rota.passos().get(2).transporte();
        assertThat(onibus.tipoVeiculo()).isEqualTo("BUS");
        assertThat(onibus.linhaCurta()).isEqualTo("9999-10");
        assertThat(onibus.operadora()).isEqualTo("Operadora Teste");
        assertThat(onibus.sentido()).isEqualTo("Terminal Teste");
        assertThat(onibus.intervalo()).isEqualTo(Duration.ofMinutes(10));
        assertThat(onibus.paradas()).isEqualTo(12);
        assertThat(onibus.embarque().nome()).isEqualTo("Parada Teste A");
        assertThat(onibus.embarque().horario()).isEqualTo(Instant.parse("2026-11-19T16:30:00Z"));
        assertThat(onibus.embarque().latitude()).isEqualTo(-23.5);
    }

    @Test
    void campoAusenteFicaNuloEmVezDeInventado() throws Exception {
        RotaTransporte.Transporte metro = lerFixture().get(0).passos().get(3).transporte();
        assertThat(metro.operadora()).isNull();
        assertThat(metro.intervalo()).isNull();
        assertThat(metro.cor()).isNull();
    }

    @Test
    void respostaSemRotasViraListaVazia() throws Exception {
        assertThat(ClienteGoogleRoutes.interpretar(new ObjectMapper().readTree("{}"))).isEmpty();
    }
}
