package br.com.vias.service;

import br.com.vias.dto.PercursoRequest;
import br.com.vias.dto.PercursoResponse;
import br.com.vias.dto.PercursoResponse.AoVivo;
import br.com.vias.dto.PercursoResponse.Onibus;
import br.com.vias.dto.PercursoResponse.Opcao;
import br.com.vias.dto.PercursoResponse.Trecho;
import br.com.vias.exception.RecursoNaoEncontradoException;
import br.com.vias.exception.RegraNegocioException;
import br.com.vias.exception.ServicoExternoException;
import br.com.vias.integracao.google.ClienteGoogleRoutes;
import br.com.vias.integracao.google.RotaTransporte;
import br.com.vias.integracao.google.RotaTransporte.Passo;
import br.com.vias.integracao.google.RotaTransporte.Transporte;
import br.com.vias.integracao.olhovivo.ClienteOlhoVivo;
import br.com.vias.model.UnidadeSaude;
import br.com.vias.repository.UnidadeSaudeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.Normalizer;
import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Monta o percurso de transporte publico ate uma unidade: trajeto e horarios do Google Routes,
 * horario sugerido de saida e, nos trechos de onibus da SPTrans, a previsao ao vivo da Olho Vivo
 * com a indicacao de quais onibus sao acessiveis.
 *
 * <p>A origem (localizacao da pessoa) so e usada para o calculo: nao e gravada nem vai para o log.
 */
@Service
public class PercursoService {

    private static final Logger log = LoggerFactory.getLogger(PercursoService.class);

    static final ZoneId FUSO = ZoneId.of("America/Sao_Paulo");
    static final int FOLGA_PADRAO = 15;
    /** A Olho Vivo so preve onibus que ja estao rodando: fora desta janela a previsao nao serve. */
    static final Duration JANELA_AO_VIVO = Duration.ofMinutes(60);
    /** Posicao de veiculo mais antiga que isto nao e mostrada. */
    static final Duration POSICAO_VELHA = Duration.ofMinutes(10);
    /** Distancia maxima entre a parada do Google e a da SPTrans para considerar o mesmo ponto. */
    static final double RAIO_PARADA_METROS = 250;
    static final int MAXIMO_ONIBUS = 5;
    /** Tipos de veiculo do Google para a consulta so com metro e trem. */
    static final List<String> MODOS_TRILHOS = List.of("SUBWAY", "TRAIN", "LIGHT_RAIL", "RAIL");

    /** Letreiro da SPTrans: numero da linha e sufixo, como "8000-10" ou "N205-11". */
    private static final Pattern LETREIRO = Pattern.compile("^([0-9A-Z]{3,5})-(\\d{1,2})$");
    private static final Set<String> PALAVRAS_GENERICAS = Set.of(
            "TERMINAL", "TERM", "PCA", "PRACA", "ESTACAO", "EST", "METRO", "SHOPPING", "JARDIM", "JD",
            "VILA", "VL", "PARQUE", "PQ", "CENTRO", "AVENIDA", "AV", "RUA");

    private final UnidadeSaudeRepository unidades;
    private final ClienteGoogleRoutes google;
    private final ClienteOlhoVivo olhoVivo;
    private final Clock relogio;

    @Autowired
    public PercursoService(UnidadeSaudeRepository unidades, ClienteGoogleRoutes google, ClienteOlhoVivo olhoVivo) {
        this(unidades, google, olhoVivo, Clock.system(FUSO));
    }

    PercursoService(UnidadeSaudeRepository unidades, ClienteGoogleRoutes google, ClienteOlhoVivo olhoVivo,
                    Clock relogio) {
        this.unidades = unidades;
        this.google = google;
        this.olhoVivo = olhoVivo;
        this.relogio = relogio;
    }

    public PercursoResponse calcular(PercursoRequest req) {
        if (!google.configurado()) {
            throw new ServicoExternoException(
                    "O cálculo de percurso não está configurado neste servidor (falta a chave do Google Routes).");
        }
        UnidadeSaude unidade = unidades.findById(req.unidadeId())
                .orElseThrow(() -> new RecursoNaoEncontradoException("Unidade", req.unidadeId()));
        if (unidade.getLatitude() == null || unidade.getLongitude() == null) {
            throw new RegraNegocioException(
                    "Esta unidade não tem coordenadas no cadastro, por isso não é possível calcular o percurso.");
        }

        LocalDateTime agora = LocalDateTime.now(relogio).truncatedTo(ChronoUnit.SECONDS);
        LocalDateTime atendimento = req.horarioAtendimento();
        int folga = atendimento == null ? 0 : Objects.requireNonNullElse(req.folgaMinutos(), FOLGA_PADRAO);
        LocalDateTime alvo = atendimento == null ? null : atendimento.minusMinutes(folga);
        if (alvo != null && alvo.isBefore(agora.plusMinutes(5))) {
            throw new RegraNegocioException("O horário de chegada (já com a folga) passou ou está muito perto. "
                    + "Escolha um horário mais tarde ou peça o percurso saindo agora.");
        }
        if (alvo != null && alvo.isAfter(agora.plusDays(7))) {
            throw new RegraNegocioException("Escolha um horário dentro dos próximos 7 dias.");
        }

        double oLat = req.origem().latitude();
        double oLon = req.origem().longitude();
        double dLat = unidade.getLatitude().doubleValue();
        double dLon = unidade.getLongitude().doubleValue();
        Instant chegarAte = alvo == null ? null : alvo.atZone(FUSO).toInstant();
        Instant sairEm = alvo == null ? agora.atZone(FUSO).toInstant() : null;

        // O Google devolve so as melhores rotas, quase sempre de onibus. Uma segunda consulta, so com
        // metro e trem, garante que as opcoes sobre trilhos tambem aparecam. Se ela falhar, segue sem.
        CompletableFuture<List<RotaTransporte>> sobreTrilhos = CompletableFuture
                .supplyAsync(() -> google.calcular(oLat, oLon, dLat, dLon, chegarAte, sairEm, MODOS_TRILHOS))
                .exceptionally(erro -> {
                    log.warn("Consulta de metrô e trem falhou: {}", erro.getMessage());
                    return List.of();
                });
        List<RotaTransporte> rotas = new ArrayList<>(google.calcular(oLat, oLon, dLat, dLon, chegarAte, sairEm, null));
        rotas.addAll(sobreTrilhos.join());

        List<Opcao> opcoes = semRepetidas(
                rotas.stream().map(r -> montarOpcao(r, unidade.getNome(), alvo, agora)).toList());
        List<Opcao> possiveis = opcoes.stream().filter(o -> !o.saida().isBefore(agora.minusMinutes(1))).toList();

        List<String> avisos = new ArrayList<>();
        if (possiveis.isEmpty()) {
            avisos.add(opcoes.isEmpty()
                    ? "Não encontramos percurso de transporte público até esta unidade para este horário."
                    : "Não dá mais tempo de chegar no horário por transporte público. "
                    + "Tente um horário mais tarde ou peça o percurso saindo agora.");
        }

        Map<String, AoVivo> consultas = new HashMap<>();
        Instant instante = relogio.instant();
        List<Opcao> finais = ordenar(possiveis, alvo).stream()
                .map(o -> comPrevisao(o, agora, instante, consultas))
                .toList();

        avisos.add("Os horários de embarque são previstos pelo Google a partir da programação das operadoras "
                + "e podem variar com o trânsito.");
        avisos.add("As fontes usadas não informam a acessibilidade das estações de metrô e trem.");
        if (!olhoVivo.configurado()) {
            avisos.add("A previsão ao vivo da SPTrans não está configurada neste servidor.");
        }

        return new PercursoResponse(
                new PercursoResponse.Destino(unidade.getId(), unidade.getNome(),
                        unidade.getLatitude(), unidade.getLongitude()),
                atendimento, folga, alvo, agora, finais,
                new PercursoResponse.Fontes("Google Routes API", olhoVivo.configurado() ? "SPTrans Olho Vivo" : null),
                avisos);
    }

    // ------------------------------------------------------------------ opcoes e trechos

    static Opcao montarOpcao(RotaTransporte rota, String nomeUnidade, LocalDateTime alvo, LocalDateTime agora) {
        List<Passo> passos = rota.passos();
        int primeiro = -1;
        int ultimo = -1;
        for (int i = 0; i < passos.size(); i++) {
            Transporte t = passos.get(i).transporte();
            if (t != null && t.embarque().horario() != null && t.desembarque().horario() != null) {
                if (primeiro < 0) {
                    primeiro = i;
                }
                ultimo = i;
            }
        }

        LocalDateTime saida;
        LocalDateTime chegada;
        if (primeiro >= 0) {
            saida = local(passos.get(primeiro).transporte().embarque().horario())
                    .minus(soma(passos.subList(0, primeiro)));
            chegada = local(passos.get(ultimo).transporte().desembarque().horario())
                    .plus(soma(passos.subList(ultimo + 1, passos.size())));
        } else {
            // So caminhada: o Google nao manda horarios, entao conta a partir do alvo ou de agora.
            Duration total = rota.duracao() != null ? rota.duracao() : soma(passos);
            chegada = alvo != null ? alvo : agora.plus(total);
            saida = chegada.minus(total);
        }
        saida = saida.truncatedTo(ChronoUnit.MINUTES);

        List<Trecho> trechos = new ArrayList<>();
        Duration caminhada = Duration.ZERO;
        int metros = 0;
        List<String> geometriaCaminhada = new ArrayList<>();
        String ultimoLugar = "Sua localização";
        for (Passo passo : passos) {
            if (passo.aPe()) {
                caminhada = caminhada.plus(Objects.requireNonNullElse(passo.duracao(), Duration.ZERO));
                metros += Objects.requireNonNullElse(passo.distanciaMetros(), 0);
                if (passo.geometria() != null) {
                    geometriaCaminhada.add(passo.geometria());
                }
                continue;
            }
            Transporte t = passo.transporte();
            adicionarCaminhada(trechos, caminhada, metros, ultimoLugar, t.embarque().nome(), geometriaCaminhada);
            caminhada = Duration.ZERO;
            metros = 0;
            geometriaCaminhada = new ArrayList<>();
            trechos.add(new Trecho(
                    tipo(t.tipoVeiculo()), t.nomeVeiculo(), minutos(passo.duracao()), passo.distanciaMetros(),
                    t.embarque().nome(), t.desembarque().nome(),
                    new PercursoResponse.Linha(t.linhaCurta(), t.linhaNome(), t.cor(), t.corTexto(), t.operadora()),
                    t.sentido(), parada(t.embarque()), parada(t.desembarque()), t.paradas(),
                    minutos(t.intervalo()), null,
                    passo.geometria() == null ? List.of() : List.of(passo.geometria())));
            ultimoLugar = t.desembarque().nome();
        }
        adicionarCaminhada(trechos, caminhada, metros, ultimoLugar, nomeUnidade, geometriaCaminhada);

        return new Opcao(false, saida, chegada, Duration.between(saida, chegada).toMinutes(),
                rota.distanciaMetros(), alvo == null ? null : !chegada.isAfter(alvo), trechos);
    }

    private static void adicionarCaminhada(List<Trecho> trechos, Duration duracao, int metros, String de, String para,
                                           List<String> geometria) {
        if (duracao.isZero() && metros == 0) {
            return;
        }
        trechos.add(new Trecho("A_PE", null, minutos(duracao), metros, de, para,
                null, null, null, null, null, null, null, List.copyOf(geometria)));
    }

    /** As duas consultas ao Google podem trazer a mesma rota: fica a primeira de cada (saida + linhas). */
    static List<Opcao> semRepetidas(List<Opcao> opcoes) {
        Map<String, Opcao> unicas = new LinkedHashMap<>();
        for (Opcao o : opcoes) {
            StringBuilder chave = new StringBuilder(String.valueOf(o.saida()));
            for (Trecho t : o.trechos()) {
                if (!"A_PE".equals(t.tipo())) {
                    chave.append('|').append(t.tipo()).append(':').append(t.linha() == null ? "" : t.linha().codigo());
                }
            }
            unicas.putIfAbsent(chave.toString(), o);
        }
        return List.copyOf(unicas.values());
    }

    /**
     * Recomenda, com horario marcado, a opcao que chega a tempo saindo mais tarde; sem horario,
     * a que chega primeiro. A recomendada vem primeiro e as outras seguem pela hora de saida.
     */
    static List<Opcao> ordenar(List<Opcao> opcoes, LocalDateTime alvo) {
        if (opcoes.isEmpty()) {
            return opcoes;
        }
        Opcao recomendada = (alvo == null ? opcoes.stream() : opcoes.stream().filter(o -> Boolean.TRUE.equals(o.chegaATempo())))
                .max(alvo == null
                        ? Comparator.comparing(Opcao::chegada).reversed()
                        : Comparator.comparing(Opcao::saida))
                .orElseGet(() -> opcoes.stream().min(Comparator.comparing(Opcao::chegada)).orElseThrow());
        List<Opcao> resultado = new ArrayList<>();
        resultado.add(marcar(recomendada, true));
        opcoes.stream().filter(o -> o != recomendada)
                .sorted(Comparator.comparing(Opcao::saida))
                .forEach(resultado::add);
        return resultado;
    }

    private static Opcao marcar(Opcao o, boolean recomendada) {
        return new Opcao(recomendada, o.saida(), o.chegada(), o.duracaoMinutos(), o.distanciaMetros(),
                o.chegaATempo(), o.trechos());
    }

    // ------------------------------------------------------------------ previsao ao vivo (SPTrans)

    private Opcao comPrevisao(Opcao o, LocalDateTime agora, Instant instante, Map<String, AoVivo> consultas) {
        List<Trecho> trechos = o.trechos().stream()
                .map(t -> "ONIBUS".equals(t.tipo()) ? comAoVivo(t, aoVivo(t, agora, instante, consultas)) : t)
                .toList();
        return new Opcao(o.recomendada(), o.saida(), o.chegada(), o.duracaoMinutos(), o.distanciaMetros(),
                o.chegaATempo(), trechos);
    }

    private static Trecho comAoVivo(Trecho t, AoVivo aoVivo) {
        return new Trecho(t.tipo(), t.veiculo(), t.duracaoMinutos(), t.distanciaMetros(), t.de(), t.para(), t.linha(),
                t.sentido(), t.embarque(), t.desembarque(), t.paradas(), t.intervaloMinutos(), aoVivo, t.geometria());
    }

    AoVivo aoVivo(Trecho t, LocalDateTime agora, Instant instante, Map<String, AoVivo> consultas) {
        if (!olhoVivo.configurado()) {
            return semPrevisao("NAO_CONFIGURADO", "A previsão ao vivo da SPTrans não está configurada neste servidor.");
        }
        LocalDateTime embarque = t.embarque() == null ? null : t.embarque().horario();
        if (embarque != null && embarque.isAfter(agora.plus(JANELA_AO_VIVO))) {
            return semPrevisao("FORA_DA_JANELA",
                    "A previsão ao vivo e a acessibilidade de cada ônibus aparecem quando faltar menos de 1 hora para o embarque.");
        }
        String chave = (t.linha() == null ? "" : t.linha().codigo()) + "|" + t.de() + "|" + t.sentido();
        return consultas.computeIfAbsent(chave, k -> consultarOlhoVivo(t, agora, instante));
    }

    private AoVivo consultarOlhoVivo(Trecho t, LocalDateTime agora, Instant instante) {
        String codigo = t.linha() == null || t.linha().codigo() == null ? "" : t.linha().codigo().trim().toUpperCase();
        Matcher m = LETREIRO.matcher(codigo);
        if (!m.matches()) {
            return semPrevisao("LINHA_NAO_ENCONTRADA",
                    "Sem previsão ao vivo para esta linha: a Olho Vivo cobre só os ônibus municipais da SPTrans.");
        }
        if (t.embarque() == null || t.embarque().latitude() == null || t.embarque().longitude() == null) {
            return semPrevisao("PARADA_NAO_ENCONTRADA", "O ponto de embarque veio sem localização.");
        }
        try {
            int sufixo = Integer.parseInt(m.group(2));
            List<ClienteOlhoVivo.Linha> linhas = olhoVivo.buscarLinhas(m.group(1)).stream()
                    .filter(l -> l.letreiro().equalsIgnoreCase(m.group(1)) && l.sufixo() == sufixo)
                    .toList();
            if (linhas.isEmpty()) {
                return semPrevisao("LINHA_NAO_ENCONTRADA", "A linha " + codigo + " não foi encontrada na Olho Vivo.");
            }

            ClienteOlhoVivo.Parada melhor = null;
            String horaConsulta = null;
            double melhorPontuacao = Double.MAX_VALUE;
            double melhorDistancia = Double.MAX_VALUE;
            for (ClienteOlhoVivo.Linha linha : linhas) {
                ClienteOlhoVivo.PrevisaoLinha previsao = olhoVivo.previsaoDaLinha(linha.codigo());
                // Empate entre os dois sentidos: favorece o que vai para o destino do letreiro do Google.
                double bonus = mesmoDestino(linha.destino(), t.sentido()) ? 40 : 0;
                for (ClienteOlhoVivo.Parada p : previsao.paradas()) {
                    double d = distanciaMetros(t.embarque().latitude(), t.embarque().longitude(), p.latitude(), p.longitude());
                    if (d - bonus < melhorPontuacao) {
                        melhorPontuacao = d - bonus;
                        melhorDistancia = d;
                        melhor = p;
                        horaConsulta = previsao.horaConsulta();
                    }
                }
            }
            if (melhor == null || melhorDistancia > RAIO_PARADA_METROS) {
                return semPrevisao("PARADA_NAO_ENCONTRADA",
                        "Este ponto de embarque não aparece agora na previsão da SPTrans.");
            }

            Instant limite = instante.minus(POSICAO_VELHA);
            List<Onibus> onibus = melhor.veiculos().stream()
                    .filter(v -> v.ultimaPosicao() == null || !v.ultimaPosicao().isBefore(limite))
                    .map(v -> new Onibus(v.prefixo(), horarioPrevisto(v.previsto(), agora), v.acessivel()))
                    .filter(o -> o.previsto() != null)
                    .sorted(Comparator.comparing(Onibus::previsto))
                    .toList();
            if (onibus.isEmpty()) {
                return new AoVivo("SEM_PREVISAO", "Nenhum ônibus desta linha tem previsão para este ponto agora.",
                        melhor.nome(), horaConsulta, List.of(), null);
            }
            Onibus acessivel = onibus.stream().filter(o -> Boolean.TRUE.equals(o.acessivel())).findFirst().orElse(null);
            return new AoVivo("DISPONIVEL", null, melhor.nome(), horaConsulta,
                    onibus.subList(0, Math.min(MAXIMO_ONIBUS, onibus.size())), acessivel);
        } catch (ServicoExternoException e) {
            log.warn("Olho Vivo indisponível: {}", e.getMessage());
            return semPrevisao("INDISPONIVEL", "A previsão da SPTrans não respondeu agora.");
        }
    }

    private static AoVivo semPrevisao(String status, String mensagem) {
        return new AoVivo(status, mensagem, null, null, List.of(), null);
    }

    /** A Olho Vivo manda so "HH:mm"; escolhe o dia mais proximo de agora (vale na virada da meia-noite). */
    static LocalDateTime horarioPrevisto(String hhmm, LocalDateTime agora) {
        if (hhmm == null) {
            return null;
        }
        try {
            LocalDateTime data = agora.toLocalDate().atTime(LocalTime.parse(hhmm));
            if (data.isBefore(agora.minusHours(12))) {
                return data.plusDays(1);
            }
            if (data.isAfter(agora.plusHours(12))) {
                return data.minusDays(1);
            }
            return data;
        } catch (RuntimeException e) {
            return null;
        }
    }

    /** Compara o terminal da SPTrans com o letreiro do Google ignorando acentos e palavras comuns. */
    static boolean mesmoDestino(String terminal, String letreiro) {
        if (terminal == null || letreiro == null) {
            return false;
        }
        Set<String> palavrasLetreiro = Set.of(normalizar(letreiro).split(" "));
        for (String palavra : normalizar(terminal).split(" ")) {
            if (palavra.length() >= 3 && !PALAVRAS_GENERICAS.contains(palavra) && palavrasLetreiro.contains(palavra)) {
                return true;
            }
        }
        return false;
    }

    private static String normalizar(String texto) {
        return Normalizer.normalize(texto, Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .toUpperCase()
                .replaceAll("[^A-Z0-9]+", " ")
                .trim();
    }

    static double distanciaMetros(double lat1, double lon1, double lat2, double lon2) {
        double r = 6_371_000;
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        return 2 * r * Math.asin(Math.sqrt(a));
    }

    // ------------------------------------------------------------------ conversoes

    static String tipo(String tipoGoogle) {
        if (tipoGoogle == null) {
            return "OUTRO";
        }
        return switch (tipoGoogle) {
            case "BUS", "INTERCITY_BUS", "TROLLEYBUS" -> "ONIBUS";
            case "SUBWAY", "METRO_RAIL", "MONORAIL" -> "METRO";
            case "HEAVY_RAIL", "COMMUTER_TRAIN", "RAIL", "HIGH_SPEED_TRAIN", "LONG_DISTANCE_TRAIN" -> "TREM";
            default -> "OUTRO";
        };
    }

    private static PercursoResponse.Parada parada(RotaTransporte.Parada p) {
        return new PercursoResponse.Parada(p.nome(), p.latitude(), p.longitude(),
                p.horario() == null ? null : local(p.horario()));
    }

    private static LocalDateTime local(Instant instante) {
        return LocalDateTime.ofInstant(instante, FUSO);
    }

    private static Duration soma(List<Passo> passos) {
        return passos.stream().map(Passo::duracao).filter(Objects::nonNull).reduce(Duration.ZERO, Duration::plus);
    }

    private static Integer minutos(Duration d) {
        return d == null ? null : (int) Math.ceil(d.toSeconds() / 60.0);
    }
}
