package br.com.vias.service;

import br.com.vias.dto.PercursoRequest;
import br.com.vias.dto.PercursoResponse;
import br.com.vias.dto.PercursoResponse.AoVivo;
import br.com.vias.dto.PercursoResponse.Opcao;
import br.com.vias.dto.PercursoResponse.Trecho;
import br.com.vias.exception.RegraNegocioException;
import br.com.vias.exception.ServicoExternoException;
import br.com.vias.integracao.google.ClienteGoogleRoutes;
import br.com.vias.integracao.google.RotaTransporte;
import br.com.vias.integracao.olhovivo.ClienteOlhoVivo;
import br.com.vias.integracao.olhovivo.ClienteOlhoVivo.Linha;
import br.com.vias.integracao.olhovivo.ClienteOlhoVivo.Parada;
import br.com.vias.integracao.olhovivo.ClienteOlhoVivo.PrevisaoLinha;
import br.com.vias.integracao.olhovivo.ClienteOlhoVivo.Veiculo;
import br.com.vias.model.UnidadeSaude;
import br.com.vias.repository.UnidadeSaudeRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.InputStream;
import java.math.BigDecimal;
import java.time.Clock;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyDouble;
import static org.mockito.Mockito.*;

/**
 * Regras do percurso com clientes simulados. Os dados vem da fixture ficticia
 * src/test/resources/fixtures/google-routes-transit.json e de veiculos inventados aqui,
 * todos marcados como teste: nada disto e dado real.
 */
class PercursoServiceTest {

    /** 19/11/2026 13:00 em Sao Paulo (16:00 UTC). Na fixture, o onibus sai as 13:30. */
    private static final Instant AGORA = Instant.parse("2026-11-19T16:00:00Z");

    private UnidadeSaudeRepository unidades;
    private ClienteGoogleRoutes google;
    private ClienteOlhoVivo olhoVivo;
    private List<RotaTransporte> rotasFixture;

    @BeforeEach
    void setUp() throws Exception {
        unidades = mock(UnidadeSaudeRepository.class);
        google = mock(ClienteGoogleRoutes.class);
        olhoVivo = mock(ClienteOlhoVivo.class);
        try (InputStream in = getClass().getResourceAsStream("/fixtures/google-routes-transit.json")) {
            rotasFixture = ClienteGoogleRoutes.interpretar(new ObjectMapper().readTree(in));
        }
        UnidadeSaude unidade = new UnidadeSaude();
        unidade.setId(7L);
        unidade.setNome("UNIDADE TESTE");
        unidade.setLatitude(new BigDecimal("-23.56"));
        unidade.setLongitude(new BigDecimal("-46.66"));
        when(unidades.findById(7L)).thenReturn(Optional.of(unidade));
        when(google.configurado()).thenReturn(true);
        when(google.calcular(anyDouble(), anyDouble(), anyDouble(), anyDouble(), any(), any())).thenReturn(rotasFixture);
    }

    private PercursoService service(Instant agora) {
        return new PercursoService(unidades, google, olhoVivo, Clock.fixed(agora, PercursoService.FUSO));
    }

    private static PercursoRequest pedido(LocalDateTime atendimento, Integer folga) {
        return new PercursoRequest(7L, new PercursoRequest.Origem(-23.49, -46.59), atendimento, folga);
    }

    private static Opcao comOnibus(PercursoResponse r) {
        return r.opcoes().stream().filter(o -> o.trechos().stream().anyMatch(t -> "ONIBUS".equals(t.tipo())))
                .findFirst().orElseThrow();
    }

    private static Trecho onibusDa(Opcao opcao) {
        return opcao.trechos().stream().filter(t -> "ONIBUS".equals(t.tipo())).findFirst().orElseThrow();
    }

    // ---------------------------------------------------------------- horarios e recomendacao

    @Test
    void calculaSaidaEChegadaSomandoAsCaminhadas() {
        Opcao opcao = PercursoService.montarOpcao(rotasFixture.get(0), "UNIDADE TESTE",
                LocalDateTime.of(2026, 11, 19, 14, 15), LocalDateTime.of(2026, 11, 19, 13, 0));

        // 5 min a pe antes do onibus das 13:30; 4 min a pe depois do metro que chega as 14:00.
        assertThat(opcao.saida()).isEqualTo(LocalDateTime.of(2026, 11, 19, 13, 25));
        assertThat(opcao.chegada()).isEqualTo(LocalDateTime.of(2026, 11, 19, 14, 4));
        assertThat(opcao.chegaATempo()).isTrue();
        assertThat(opcao.trechos()).extracting(Trecho::tipo).containsExactly("A_PE", "ONIBUS", "METRO", "A_PE");

        Trecho primeiraCaminhada = opcao.trechos().get(0);
        assertThat(primeiraCaminhada.duracaoMinutos()).isEqualTo(5);
        assertThat(primeiraCaminhada.distanciaMetros()).isEqualTo(350);
        assertThat(primeiraCaminhada.de()).isEqualTo("Sua localização");
        assertThat(primeiraCaminhada.para()).isEqualTo("Parada Teste A");
        assertThat(opcao.trechos().get(3).para()).isEqualTo("UNIDADE TESTE");
        assertThat(onibusDa(opcao).intervaloMinutos()).isEqualTo(10);
    }

    @Test
    void comHorarioRecomendaQuemChegaATempoSaindoMaisTarde() {
        PercursoResponse r = service(AGORA).calcular(pedido(LocalDateTime.of(2026, 11, 19, 14, 30), 15));

        assertThat(r.chegarAte()).isEqualTo(LocalDateTime.of(2026, 11, 19, 14, 15));
        assertThat(r.opcoes()).hasSize(2);
        Opcao recomendada = r.opcoes().get(0);
        assertThat(recomendada.recomendada()).isTrue();
        // A caminhada de 25 min chegando as 14:15 sai as 13:50, depois da opcao de onibus (13:25).
        assertThat(recomendada.saida()).isEqualTo(LocalDateTime.of(2026, 11, 19, 13, 50));
        assertThat(r.opcoes().get(1).recomendada()).isFalse();
    }

    @Test
    void semHorarioMandaSairAgoraERecomendaQuemChegaPrimeiro() {
        PercursoResponse r = service(AGORA).calcular(pedido(null, null));

        assertThat(r.folgaMinutos()).isZero();
        assertThat(r.chegarAte()).isNull();
        assertThat(r.opcoes().get(0).chegada()).isEqualTo(LocalDateTime.of(2026, 11, 19, 13, 25));
        assertThat(r.opcoes().get(0).chegaATempo()).isNull();
        verify(google).calcular(anyDouble(), anyDouble(), anyDouble(), anyDouble(), isNull(), eq(AGORA));
    }

    @Test
    void horarioQueJaPassouERecusado() {
        assertThatThrownBy(() -> service(AGORA).calcular(pedido(LocalDateTime.of(2026, 11, 19, 13, 10), 15)))
                .isInstanceOf(RegraNegocioException.class);
    }

    @Test
    void semChaveDoGoogleResponde503() {
        when(google.configurado()).thenReturn(false);
        assertThatThrownBy(() -> service(AGORA).calcular(pedido(null, null)))
                .isInstanceOf(ServicoExternoException.class);
    }

    @Test
    void unidadeSemCoordenadaERecusada() {
        UnidadeSaude semCoordenada = new UnidadeSaude();
        semCoordenada.setId(8L);
        when(unidades.findById(8L)).thenReturn(Optional.of(semCoordenada));
        assertThatThrownBy(() -> service(AGORA).calcular(
                new PercursoRequest(8L, new PercursoRequest.Origem(-23.49, -46.59), null, null)))
                .isInstanceOf(RegraNegocioException.class);
    }

    // ---------------------------------------------------------------- previsao ao vivo

    @Test
    void previsaoAoVivoMostraOnibusEOProximoAcessivel() {
        when(olhoVivo.configurado()).thenReturn(true);
        when(olhoVivo.buscarLinhas("9999")).thenReturn(List.of(
                new Linha(1, "9999", 10, 1, "PCA ORIGEM", "TERMINAL TESTE"),
                new Linha(2, "9999", 10, 2, "PCA ORIGEM", "TERMINAL TESTE")));
        Instant recente = AGORA.minusSeconds(60);
        when(olhoVivo.previsaoDaLinha(1)).thenReturn(new PrevisaoLinha("13:00", List.of(
                new Parada(100, "PONTO TESTE A", -23.5001, -46.6001, List.of(
                        new Veiculo("A", "13:20", false, recente),
                        new Veiculo("B", "13:28", true, recente),
                        new Veiculo("VELHO", "13:05", true, AGORA.minusSeconds(1800)))))));
        when(olhoVivo.previsaoDaLinha(2)).thenReturn(new PrevisaoLinha("13:00", List.of(
                new Parada(200, "PONTO LONGE", -23.6, -46.7, List.of()))));

        PercursoResponse r = service(AGORA).calcular(pedido(null, null));
        AoVivo aoVivo = onibusDa(comOnibus(r)).aoVivo();

        assertThat(aoVivo.status()).isEqualTo("DISPONIVEL");
        assertThat(aoVivo.parada()).isEqualTo("PONTO TESTE A");
        assertThat(aoVivo.onibus()).extracting(PercursoResponse.Onibus::prefixo).containsExactly("A", "B");
        assertThat(aoVivo.proximoAcessivel().prefixo()).isEqualTo("B");
        assertThat(aoVivo.proximoAcessivel().previsto()).isEqualTo(LocalDateTime.of(2026, 11, 19, 13, 28));
    }

    @Test
    void embarqueDistanteNaoConsultaAOlhoVivo() {
        when(olhoVivo.configurado()).thenReturn(true);
        // Agora 11:00: o onibus das 13:30 esta a mais de 1 hora.
        PercursoResponse r = service(Instant.parse("2026-11-19T14:00:00Z"))
                .calcular(pedido(LocalDateTime.of(2026, 11, 19, 14, 30), 15));

        assertThat(onibusDa(comOnibus(r)).aoVivo().status()).isEqualTo("FORA_DA_JANELA");
        verify(olhoVivo, never()).previsaoDaLinha(anyInt());
    }

    @Test
    void semTokenDaOlhoVivoAvisaENaoInventaAcessibilidade() {
        when(olhoVivo.configurado()).thenReturn(false);
        PercursoResponse r = service(AGORA).calcular(pedido(null, null));

        AoVivo aoVivo = onibusDa(comOnibus(r)).aoVivo();
        assertThat(aoVivo.status()).isEqualTo("NAO_CONFIGURADO");
        assertThat(aoVivo.proximoAcessivel()).isNull();
        assertThat(r.fontes().aoVivo()).isNull();
        // Trechos de metro nao recebem previsao da SPTrans.
        Trecho metro = comOnibus(r).trechos().stream().filter(t -> "METRO".equals(t.tipo())).findFirst().orElseThrow();
        assertThat(metro.aoVivo()).isNull();
    }

    // ---------------------------------------------------------------- funcoes auxiliares

    @Test
    void comparaDestinoIgnorandoAcentoEPalavrasComuns() {
        assertThat(PercursoService.mesmoDestino("TERMINAL LAPA", "Term. Lapa")).isTrue();
        assertThat(PercursoService.mesmoDestino("TERMINAL LAPA", "Terminal Pinheiros")).isFalse();
        assertThat(PercursoService.mesmoDestino("PCA. RAMOS DE AZEVEDO", "Praça Ramos de Azevedo")).isTrue();
    }

    @Test
    void horarioDaOlhoVivoNaViradaDaMeiaNoite() {
        LocalDateTime agora = LocalDateTime.of(2026, 11, 19, 23, 50);
        assertThat(PercursoService.horarioPrevisto("00:05", agora)).isEqualTo(LocalDateTime.of(2026, 11, 20, 0, 5));
        assertThat(PercursoService.horarioPrevisto("23:55", agora)).isEqualTo(LocalDateTime.of(2026, 11, 19, 23, 55));
        assertThat(PercursoService.horarioPrevisto("xx", agora)).isNull();
    }
}
