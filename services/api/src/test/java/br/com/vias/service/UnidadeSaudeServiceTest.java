package br.com.vias.service;

import br.com.vias.dto.AcessibilidadeDto;
import br.com.vias.dto.UnidadeDetalheResponse;
import br.com.vias.dto.UnidadeRequest;
import br.com.vias.exception.ConflitoException;
import br.com.vias.exception.RegraNegocioException;
import br.com.vias.model.FonteDado;
import br.com.vias.model.UnidadeSaude;
import br.com.vias.model.enums.RespostaCadastro;
import br.com.vias.model.enums.StatusAcessibilidade;
import br.com.vias.repository.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class UnidadeSaudeServiceTest {

    private UnidadeSaudeRepository unidadeRepository;
    private FonteDadoRepository fonteRepository;
    private UnidadeSaudeService service;

    @BeforeEach
    void setUp() {
        unidadeRepository = mock(UnidadeSaudeRepository.class);
        fonteRepository = mock(FonteDadoRepository.class);
        service = new UnidadeSaudeService(unidadeRepository, mock(UnidadeServicoRepository.class),
                mock(ServicoSaudeRepository.class), mock(RegiaoRepository.class), fonteRepository);
    }

    // ---------------------------------------------------------------- acessibilidade

    @Test
    void acessivelSemFonteOuDataERecusado() {
        assertThatThrownBy(() -> UnidadeSaudeService.validarAcessibilidade(
                new AcessibilidadeDto(StatusAcessibilidade.ACESSIVEL, null, LocalDate.now())))
                .isInstanceOf(RegraNegocioException.class);
        assertThatThrownBy(() -> UnidadeSaudeService.validarAcessibilidade(
                new AcessibilidadeDto(StatusAcessibilidade.NAO_ACESSIVEL, "Vistoria", null)))
                .isInstanceOf(RegraNegocioException.class);
    }

    @Test
    void estadosDesconhecidosNaoExigemComprovacao() {
        UnidadeSaudeService.validarAcessibilidade(new AcessibilidadeDto(StatusAcessibilidade.NAO_INFORMADO, null, null));
        UnidadeSaudeService.validarAcessibilidade(new AcessibilidadeDto(StatusAcessibilidade.NAO_VERIFICADO, null, null));
        UnidadeSaudeService.validarAcessibilidade(
                new AcessibilidadeDto(StatusAcessibilidade.ACESSIVEL, "Vistoria", LocalDate.now().minusDays(1)));
    }

    @Test
    void dataDeVerificacaoNoFuturoERecusada() {
        assertThatThrownBy(() -> UnidadeSaudeService.validarAcessibilidade(
                new AcessibilidadeDto(StatusAcessibilidade.ACESSIVEL, "Vistoria", LocalDate.now().plusDays(3))))
                .isInstanceOf(RegraNegocioException.class);
    }

    @Test
    void coordenadasPrecisamVirJuntas() {
        assertThatThrownBy(() -> UnidadeSaudeService.validarCoordenadas(new BigDecimal("-23.5"), null))
                .isInstanceOf(RegraNegocioException.class);
        UnidadeSaudeService.validarCoordenadas(null, null);
    }

    // ---------------------------------------------------------------- protecao de dados oficiais

    @Test
    void detectaCampoCadastralAlteradoEmUnidadeOficial() {
        UnidadeSaude u = unidadeCnes();
        UnidadeRequest mesmoCadastro = requisicao(u, u.getNome(), u.getTelefone());
        UnidadeRequest outroNome = requisicao(u, "NOME NOVO", "(11) 0000-0000");

        assertThat(UnidadeSaudeService.camposCadastraisAlterados(u, mesmoCadastro)).isEmpty();
        assertThat(UnidadeSaudeService.camposCadastraisAlterados(u, outroNome)).containsExactly("nome", "telefone");
    }

    @Test
    void unidadeOficialNaoPodeSerExcluida() {
        when(unidadeRepository.findComDetalhesById(1L)).thenReturn(Optional.of(unidadeCnes()));
        assertThatThrownBy(() -> service.excluir(1L)).isInstanceOf(RegraNegocioException.class);
        verify(unidadeRepository, never()).delete(any());
    }

    @Test
    void unidadeManualPodeSerExcluida() {
        UnidadeSaude u = unidadeCnes();
        u.setFonte(fonte(FonteDado.MANUAL, false));
        when(unidadeRepository.findComDetalhesById(2L)).thenReturn(Optional.of(u));
        service.excluir(2L);
        verify(unidadeRepository).delete(u);
    }

    @Test
    void cnesRepetidoGeraConflito() {
        when(unidadeRepository.existsByCodigoCnes("2027461")).thenReturn(true);
        UnidadeRequest req = requisicao(unidadeCnes(), "Outra", null);
        assertThatThrownBy(() -> service.criar(req)).isInstanceOf(ConflitoException.class);
    }

    // ---------------------------------------------------------------- estados desconhecidos

    @Test
    void detalheAvisaQuandoAcessibilidadeNaoEInformada() {
        UnidadeDetalheResponse d = UnidadeSaudeService.detalhe(unidadeCnes());
        assertThat(d.acessibilidade().status()).isEqualTo(StatusAcessibilidade.NAO_INFORMADO);
        assertThat(d.camposCadastraisProtegidos()).isTrue();
        assertThat(d.avisos()).anyMatch(a -> a.contains("não informa a acessibilidade"));
        assertThat(d.avisos()).anyMatch(a -> a.contains("Horário de funcionamento"));
    }

    // ---------------------------------------------------------------- apoio

    private static FonteDado fonte(String sigla, boolean oficial) {
        FonteDado f = new FonteDado();
        f.setSigla(sigla);
        f.setNome(sigla);
        f.setOficial(oficial);
        return f;
    }

    private static UnidadeSaude unidadeCnes() {
        UnidadeSaude u = new UnidadeSaude();
        u.setId(1L);
        u.setCodigoCnes("2027461");
        u.setNome("UBS PARQUE DA LAPA");
        u.setCodigoTipoUnidade(2);
        u.setTipoUnidade("CENTRO DE SAUDE/UNIDADE BASICA");
        u.setBairro("PARQUE DA LAPA");
        u.setTelefone("1136411000");
        u.setLatitude(new BigDecimal("-23.5161000"));
        u.setLongitude(new BigDecimal("-46.7380000"));
        u.setHorarioFuncionamento("ATENDIMENTOS NOS TURNOS DA MANHA E A TARDE");
        u.setAtendeSus(RespostaCadastro.SIM);
        u.setFonte(fonte(FonteDado.CNES, true));
        return u;
    }

    private static UnidadeRequest requisicao(UnidadeSaude u, String nome, String telefone) {
        return new UnidadeRequest(u.getCodigoCnes(), nome, u.getRazaoSocial(), u.getCodigoTipoUnidade(), u.getTipoUnidade(),
                u.getLogradouro(), u.getNumero(), u.getBairro(), u.getCep(), u.getCodigoMunicipio(), u.getUf(), telefone,
                new BigDecimal("-23.5161"), new BigDecimal("-46.738"), u.getHorarioFuncionamento(), u.getAtendeSus(),
                null, null, null);
    }
}
