package br.com.vias.service;

import br.com.vias.dto.*;
import br.com.vias.exception.ConflitoException;
import br.com.vias.exception.RecursoNaoEncontradoException;
import br.com.vias.exception.RegraNegocioException;
import br.com.vias.model.FonteDado;
import br.com.vias.model.Regiao;
import br.com.vias.model.ServicoSaude;
import br.com.vias.model.UnidadeSaude;
import br.com.vias.model.UnidadeServico;
import br.com.vias.model.enums.RespostaCadastro;
import br.com.vias.model.enums.StatusAcessibilidade;
import br.com.vias.repository.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Camada BO: regras de negocio das unidades de saude.
 * - Campos cadastrais de fonte oficial (CNES) nao sao alterados nem excluidos pela API.
 * - Acessibilidade ACESSIVEL/NAO_ACESSIVEL exige fonte e data de verificacao.
 * - Ausencia de dado continua ausencia (NULL / NAO_INFORMADO), nunca um valor negativo.
 */
@Service
public class UnidadeSaudeService {

    private final UnidadeSaudeRepository unidadeRepository;
    private final UnidadeServicoRepository unidadeServicoRepository;
    private final ServicoSaudeRepository servicoRepository;
    private final RegiaoRepository regiaoRepository;
    private final FonteDadoRepository fonteRepository;

    public UnidadeSaudeService(UnidadeSaudeRepository unidadeRepository, UnidadeServicoRepository unidadeServicoRepository,
                               ServicoSaudeRepository servicoRepository, RegiaoRepository regiaoRepository,
                               FonteDadoRepository fonteRepository) {
        this.unidadeRepository = unidadeRepository;
        this.unidadeServicoRepository = unidadeServicoRepository;
        this.servicoRepository = servicoRepository;
        this.regiaoRepository = regiaoRepository;
        this.fonteRepository = fonteRepository;
    }

    // ------------------------------------------------------------------ consultas

    @Transactional(readOnly = true)
    public PaginaResponse<UnidadeResumoResponse> pesquisar(Long servicoId, Long regiaoId, String bairro, String nome,
                                                           StatusAcessibilidade acessibilidade, RespostaCadastro atendeSus,
                                                           Integer tipoUnidade, int pagina, int tamanho) {
        if (servicoId != null && !servicoRepository.existsById(servicoId)) {
            throw new RecursoNaoEncontradoException("Servico", servicoId);
        }
        if (regiaoId != null && !regiaoRepository.existsById(regiaoId)) {
            throw new RecursoNaoEncontradoException("Regiao", regiaoId);
        }
        Page<UnidadeSaude> page = unidadeRepository.pesquisar(servicoId, regiaoId, texto(bairro), texto(nome),
                acessibilidade, atendeSus, tipoUnidade, PageRequest.of(pagina, tamanho, Sort.by("nome", "id")));

        List<Long> ids = page.getContent().stream().map(UnidadeSaude::getId).toList();
        Map<Long, List<String>> servicosPorUnidade = ids.isEmpty() ? Map.of()
                : unidadeServicoRepository.buscarPorUnidades(ids).stream().collect(Collectors.groupingBy(
                        us -> us.getUnidade().getId(), Collectors.mapping(us -> us.getServico().getNome(), Collectors.toList())));

        List<UnidadeResumoResponse> itens = page.getContent().stream().map(u -> new UnidadeResumoResponse(
                u.getId(), u.getCodigoCnes(), u.getNome(), u.getTipoUnidade(), u.getBairro(), RegiaoResumo.de(u.getRegiao()),
                u.getAtendeSus(), u.getStatusAcessibilidade(), u.getLatitude(), u.getLongitude(),
                servicosPorUnidade.getOrDefault(u.getId(), List.of()), u.getFonte().getSigla(), u.getDataReferenciaFonte()))
                .toList();
        return PaginaResponse.de(page, itens);
    }

    @Transactional(readOnly = true)
    public UnidadeDetalheResponse buscar(Long id) {
        return detalhe(carregar(id));
    }

    // ------------------------------------------------------------------ escrita

    /** Cadastro manual: a unidade fica com a fonte CADASTRO_MANUAL (nao oficial). */
    @Transactional
    public UnidadeDetalheResponse criar(UnidadeRequest req) {
        if (req.codigoCnes() != null && unidadeRepository.existsByCodigoCnes(req.codigoCnes())) {
            throw new ConflitoException("Ja existe unidade com o codigo CNES " + req.codigoCnes() + ".");
        }
        FonteDado manual = fonte(FonteDado.MANUAL);
        UnidadeSaude u = new UnidadeSaude();
        u.setFonte(manual);
        preencherCadastro(u, req);
        aplicarAcessibilidade(u, req.acessibilidade());
        u.setRegiao(regiao(req.regiaoId()));
        if (req.servicoIds() != null) substituirServicos(u, req.servicoIds(), manual);
        return detalhe(unidadeRepository.save(u));
    }

    /**
     * Atualizacao completa. Em unidade de fonte oficial, so acessibilidade e regiao podem mudar:
     * qualquer campo cadastral diferente do gravado e recusado (sem sobrescrita silenciosa).
     */
    @Transactional
    public UnidadeDetalheResponse atualizar(Long id, UnidadeRequest req) {
        UnidadeSaude u = carregar(id);
        if (u.isOrigemOficial()) {
            List<String> alterados = camposCadastraisAlterados(u, req);
            if (!alterados.isEmpty()) {
                throw new RegraNegocioException("Unidade de fonte oficial (" + u.getFonte().getSigla()
                        + "): os campos " + alterados + " sao geridos pela fonte e nao podem ser alterados pela API. "
                        + "Altere apenas acessibilidade e regiaoId.");
            }
        } else {
            if (req.codigoCnes() != null && unidadeRepository.existsByCodigoCnesAndIdNot(req.codigoCnes(), id)) {
                throw new ConflitoException("Ja existe unidade com o codigo CNES " + req.codigoCnes() + ".");
            }
            preencherCadastro(u, req);
            if (req.servicoIds() != null) substituirServicos(u, req.servicoIds(), u.getFonte());
        }
        aplicarAcessibilidade(u, req.acessibilidade());
        u.setRegiao(regiao(req.regiaoId()));
        u.setDataAtualizacao(LocalDateTime.now());
        return detalhe(unidadeRepository.save(u));
    }

    /** Atualiza so a acessibilidade (permitido para qualquer unidade, inclusive do CNES). */
    @Transactional
    public UnidadeDetalheResponse atualizarAcessibilidade(Long id, AcessibilidadeDto acessibilidade) {
        UnidadeSaude u = carregar(id);
        aplicarAcessibilidade(u, acessibilidade);
        u.setDataAtualizacao(LocalDateTime.now());
        return detalhe(unidadeRepository.save(u));
    }

    /** Exclui so cadastros manuais; registros oficiais saem pela rotina de carga da fonte. */
    @Transactional
    public void excluir(Long id) {
        UnidadeSaude u = carregar(id);
        if (u.isOrigemOficial()) {
            throw new RegraNegocioException("Unidade de fonte oficial (" + u.getFonte().getSigla()
                    + ") nao pode ser excluida pela API; a remocao acontece pela rotina de carga da fonte.");
        }
        unidadeRepository.delete(u);
    }

    // ------------------------------------------------------------------ regras internas

    static void validarAcessibilidade(AcessibilidadeDto a) {
        if (a == null) return;
        if (a.status().exigeComprovacao() && (a.fonte() == null || a.fonte().isBlank() || a.dataVerificacao() == null)) {
            throw new RegraNegocioException("Acessibilidade " + a.status()
                    + " exige a fonte e a data da verificacao. Sem comprovacao, use NAO_VERIFICADO ou NAO_INFORMADO.");
        }
        if (a.dataVerificacao() != null && a.dataVerificacao().isAfter(LocalDate.now())) {
            throw new RegraNegocioException("A data de verificacao da acessibilidade nao pode estar no futuro.");
        }
    }

    static void validarCoordenadas(BigDecimal lat, BigDecimal lon) {
        if ((lat == null) != (lon == null)) {
            throw new RegraNegocioException("Informe latitude e longitude juntas, ou nenhuma das duas.");
        }
    }

    /** Lista os campos cadastrais que o pedido tenta mudar numa unidade de fonte oficial. */
    static List<String> camposCadastraisAlterados(UnidadeSaude u, UnidadeRequest r) {
        List<String> alterados = new ArrayList<>();
        comparar(alterados, "codigoCnes", u.getCodigoCnes(), r.codigoCnes());
        comparar(alterados, "nome", u.getNome(), r.nome());
        comparar(alterados, "razaoSocial", u.getRazaoSocial(), r.razaoSocial());
        comparar(alterados, "codigoTipoUnidade", u.getCodigoTipoUnidade(), r.codigoTipoUnidade());
        comparar(alterados, "tipoUnidade", u.getTipoUnidade(), r.tipoUnidade());
        comparar(alterados, "logradouro", u.getLogradouro(), r.logradouro());
        comparar(alterados, "numero", u.getNumero(), r.numero());
        comparar(alterados, "bairro", u.getBairro(), r.bairro());
        comparar(alterados, "cep", u.getCep(), r.cep());
        comparar(alterados, "codigoMunicipio", u.getCodigoMunicipio(), r.codigoMunicipio());
        comparar(alterados, "uf", u.getUf(), r.uf());
        comparar(alterados, "telefone", u.getTelefone(), r.telefone());
        compararNumero(alterados, "latitude", u.getLatitude(), r.latitude());
        compararNumero(alterados, "longitude", u.getLongitude(), r.longitude());
        comparar(alterados, "horarioFuncionamento", u.getHorarioFuncionamento(), r.horarioFuncionamento());
        comparar(alterados, "atendeSus", u.getAtendeSus(), r.atendeSus() == null ? RespostaCadastro.NAO_INFORMADO : r.atendeSus());
        if (r.servicoIds() != null) {
            Set<Long> atuais = u.getServicos().stream().map(us -> us.getServico().getId()).collect(Collectors.toSet());
            if (!atuais.equals(r.servicoIds())) alterados.add("servicoIds");
        }
        return alterados;
    }

    private static void comparar(List<String> alterados, String campo, Object atual, Object novo) {
        if (!Objects.equals(normalizar(atual), normalizar(novo))) alterados.add(campo);
    }

    private static Object normalizar(Object v) {
        if (v instanceof String s) return s.isBlank() ? null : s.trim();
        return v;
    }

    private static void compararNumero(List<String> alterados, String campo, BigDecimal atual, BigDecimal novo) {
        if (atual == null && novo == null) return;
        if (atual == null || novo == null || atual.compareTo(novo) != 0) alterados.add(campo);
    }

    private void preencherCadastro(UnidadeSaude u, UnidadeRequest r) {
        validarCoordenadas(r.latitude(), r.longitude());
        u.setCodigoCnes(texto(r.codigoCnes()));
        u.setNome(r.nome().trim());
        u.setRazaoSocial(texto(r.razaoSocial()));
        u.setCodigoTipoUnidade(r.codigoTipoUnidade());
        u.setTipoUnidade(texto(r.tipoUnidade()));
        u.setLogradouro(texto(r.logradouro()));
        u.setNumero(texto(r.numero()));
        u.setBairro(texto(r.bairro()));
        u.setCep(texto(r.cep()));
        u.setCodigoMunicipio(texto(r.codigoMunicipio()));
        u.setUf(texto(r.uf()));
        u.setTelefone(texto(r.telefone()));
        u.setLatitude(r.latitude());
        u.setLongitude(r.longitude());
        u.setHorarioFuncionamento(texto(r.horarioFuncionamento()));
        u.setAtendeSus(r.atendeSus() == null ? RespostaCadastro.NAO_INFORMADO : r.atendeSus());
    }

    private void aplicarAcessibilidade(UnidadeSaude u, AcessibilidadeDto a) {
        if (a == null) return; // nada informado: mantem o estado atual (padrao NAO_INFORMADO)
        validarAcessibilidade(a);
        u.setStatusAcessibilidade(a.status());
        u.setFonteAcessibilidade(texto(a.fonte()));
        u.setDataVerificacaoAcessibilidade(a.dataVerificacao());
    }

    private void substituirServicos(UnidadeSaude u, Set<Long> servicoIds, FonteDado fonte) {
        Set<Long> desejados = new HashSet<>(servicoIds);
        u.getServicos().removeIf(us -> !desejados.contains(us.getServico().getId()));
        Set<Long> existentes = u.getServicos().stream().map(us -> us.getServico().getId()).collect(Collectors.toSet());
        for (Long servicoId : desejados) {
            if (existentes.contains(servicoId)) continue;
            ServicoSaude s = servicoRepository.findById(servicoId)
                    .orElseThrow(() -> new RecursoNaoEncontradoException("Servico", servicoId));
            u.getServicos().add(new UnidadeServico(u, s, fonte, null));
        }
    }

    private Regiao regiao(Long regiaoId) {
        if (regiaoId == null) return null;
        return regiaoRepository.findById(regiaoId).orElseThrow(() -> new RecursoNaoEncontradoException("Regiao", regiaoId));
    }

    private FonteDado fonte(String sigla) {
        return fonteRepository.findBySigla(sigla)
                .orElseThrow(() -> new IllegalStateException("Fonte de dados " + sigla + " nao cadastrada no banco."));
    }

    private UnidadeSaude carregar(Long id) {
        return unidadeRepository.findComDetalhesById(id)
                .orElseThrow(() -> new RecursoNaoEncontradoException("Unidade de saude", id));
    }

    private static String texto(String s) {
        return s == null || s.isBlank() ? null : s.trim();
    }

    static UnidadeDetalheResponse detalhe(UnidadeSaude u) {
        List<String> avisos = new ArrayList<>();
        if (u.getHorarioFuncionamento() != null) {
            avisos.add("Horario de funcionamento e o informado no cadastro da fonte; confirme com a unidade antes de ir.");
        }
        if (u.getStatusAcessibilidade() == StatusAcessibilidade.NAO_INFORMADO) {
            avisos.add("A fonte nao informa a acessibilidade desta unidade.");
        } else if (u.getStatusAcessibilidade() == StatusAcessibilidade.NAO_VERIFICADO) {
            avisos.add("A acessibilidade desta unidade ainda nao foi verificada.");
        }
        if (!u.getServicos().isEmpty()) {
            avisos.add("Servicos listados sao vinculos cadastrais; nao garantem vaga, agenda ou atendimento hoje.");
        }
        if (u.getLatitude() == null) {
            avisos.add("A fonte nao informa as coordenadas desta unidade.");
        }
        return new UnidadeDetalheResponse(
                u.getId(), u.getCodigoCnes(), u.getNome(), u.getRazaoSocial(), u.getCodigoTipoUnidade(), u.getTipoUnidade(),
                new EnderecoResponse(u.getLogradouro(), u.getNumero(), u.getBairro(), u.getCep(), u.getCodigoMunicipio(), u.getUf()),
                u.getTelefone(), u.getLatitude(), u.getLongitude(), u.getHorarioFuncionamento(), u.getAtendeSus(),
                new AcessibilidadeDto(u.getStatusAcessibilidade(), u.getFonteAcessibilidade(), u.getDataVerificacaoAcessibilidade()),
                RegiaoResumo.de(u.getRegiao()),
                u.getServicos().stream().map(ServicoVinculoResponse::de)
                        .sorted(Comparator.comparing(ServicoVinculoResponse::nome)).toList(),
                ProvenienciaResponse.de(u), u.isOrigemOficial(), avisos);
    }
}
