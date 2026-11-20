package br.com.vias.integracao.olhovivo;

import br.com.vias.exception.ServicoExternoException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.CookieManager;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Cliente da API Olho Vivo da SPTrans (v2.1): previsao de chegada dos onibus municipais de
 * Sao Paulo, com o campo "a" que diz se cada veiculo e acessivel.
 * Documentacao: https://www.sptrans.com.br/desenvolvedores/api-do-olho-vivo-guia-de-referencia/documentacao-api/
 *
 * <p>A autenticacao e um POST em /Login/Autenticar?token=..., e a sessao fica num cookie.
 * O token fica so no servidor (variavel OLHOVIVO_TOKEN).
 */
@Component
public class ClienteOlhoVivo {

    /** Endereco da documentacao oficial e o padrao; OLHOVIVO_URL permite trocar (por exemplo, para https). */
    static final String URL_PADRAO = "http://api.olhovivo.sptrans.com.br/v2.1";

    private final String urlBase;

    private final HttpClient http;
    private final ObjectMapper json;
    private final String token;
    private volatile boolean autenticado;

    /** As linhas mudam pouco: guarda a busca por letreiro enquanto a API estiver no ar. */
    private final Map<String, List<Linha>> linhasPorLetreiro = new ConcurrentHashMap<>();

    public ClienteOlhoVivo(ObjectMapper json, @Value("${vias.olhovivo.token:}") String token,
                           @Value("${vias.olhovivo.url:" + URL_PADRAO + "}") String urlBase) {
        this.urlBase = urlBase == null || urlBase.isBlank() ? URL_PADRAO : urlBase.trim().replaceAll("/+$", "");
        this.json = json;
        this.token = token == null ? "" : token.trim();
        this.http = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(8))
                .cookieHandler(new CookieManager())
                // Em HTTP/2 o servidor da SPTrans recusa o POST de login sem corpo (HTTP 411,
                // testado em 18/11/2026); em HTTP/1.1 o Java manda Content-Length: 0 e funciona.
                .version(HttpClient.Version.HTTP_1_1)
                .build();
    }

    public boolean configurado() {
        return !token.isEmpty();
    }

    /** Linhas com o letreiro informado (por exemplo "8000"), nos dois sentidos. */
    public List<Linha> buscarLinhas(String letreiro) {
        return linhasPorLetreiro.computeIfAbsent(letreiro, termo -> {
            List<Linha> linhas = new ArrayList<>();
            for (JsonNode l : get("/Linha/Buscar?termosBusca=" + URLEncoder.encode(termo, StandardCharsets.UTF_8))) {
                linhas.add(new Linha(l.path("cl").asInt(), l.path("lt").asText(), l.path("tl").asInt(),
                        l.path("sl").asInt(), l.path("tp").asText(), l.path("ts").asText()));
            }
            return List.copyOf(linhas);
        });
    }

    /** Previsao de chegada de todos os veiculos da linha em todas as paradas dela. */
    public PrevisaoLinha previsaoDaLinha(int codigoLinha) {
        return interpretarPrevisao(get("/Previsao/Linha?codigoLinha=" + codigoLinha));
    }

    static PrevisaoLinha interpretarPrevisao(JsonNode raiz) {
        List<Parada> paradas = new ArrayList<>();
        for (JsonNode p : raiz.path("ps")) {
            List<Veiculo> veiculos = new ArrayList<>();
            for (JsonNode v : p.path("vs")) {
                Instant ultimaPosicao = null;
                if (v.path("ta").isTextual()) {
                    try {
                        ultimaPosicao = Instant.parse(v.path("ta").asText());
                    } catch (RuntimeException ignorado) {
                        // horario em formato inesperado: o veiculo fica sem data da ultima posicao
                    }
                }
                veiculos.add(new Veiculo(v.path("p").asText(), v.path("t").asText(null),
                        v.path("a").isBoolean() ? v.path("a").asBoolean() : null, ultimaPosicao));
            }
            paradas.add(new Parada(p.path("cp").asLong(), p.path("np").asText(),
                    p.path("py").asDouble(), p.path("px").asDouble(), List.copyOf(veiculos)));
        }
        return new PrevisaoLinha(raiz.path("hr").asText(null), List.copyOf(paradas));
    }

    // ------------------------------------------------------------------ HTTP

    private JsonNode get(String caminho) {
        if (!configurado()) {
            throw new ServicoExternoException("A previsão da SPTrans não está configurada neste servidor.");
        }
        if (!autenticado) {
            autenticar();
        }
        HttpResponse<String> resposta = enviar(HttpRequest.newBuilder(URI.create(urlBase + caminho)).GET());
        if (resposta.statusCode() == 401) {
            // A sessao expirou: autentica de novo e repete uma vez.
            autenticado = false;
            autenticar();
            resposta = enviar(HttpRequest.newBuilder(URI.create(urlBase + caminho)).GET());
        }
        if (resposta.statusCode() != 200) {
            throw new ServicoExternoException("A Olho Vivo respondeu HTTP " + resposta.statusCode() + ".");
        }
        try {
            return json.readTree(resposta.body());
        } catch (IOException e) {
            throw new ServicoExternoException("A Olho Vivo respondeu num formato inesperado.", e);
        }
    }

    private synchronized void autenticar() {
        if (autenticado) {
            return;
        }
        HttpResponse<String> resposta = enviar(HttpRequest.newBuilder(URI.create(
                        urlBase + "/Login/Autenticar?token=" + URLEncoder.encode(token, StandardCharsets.UTF_8)))
                .POST(HttpRequest.BodyPublishers.noBody()));
        if (resposta.statusCode() != 200) {
            throw new ServicoExternoException("O login na Olho Vivo respondeu HTTP " + resposta.statusCode() + ".");
        }
        if (!"true".equalsIgnoreCase(resposta.body().trim())) {
            throw new ServicoExternoException("A Olho Vivo recusou o token configurado.");
        }
        autenticado = true;
    }

    private HttpResponse<String> enviar(HttpRequest.Builder pedido) {
        try {
            return http.send(pedido.timeout(Duration.ofSeconds(10)).build(), HttpResponse.BodyHandlers.ofString());
        } catch (IOException e) {
            throw new ServicoExternoException("A Olho Vivo não respondeu.", e);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new ServicoExternoException("A consulta à Olho Vivo foi interrompida.", e);
        }
    }

    // ------------------------------------------------------------------ tipos

    /**
     * @param codigo codigo interno da linha (cl), usado na previsao
     * @param letreiro primeira parte do letreiro (lt), por exemplo "8000"
     * @param sufixo segunda parte do letreiro (tl), por exemplo 10
     * @param sentido 1 = do terminal principal para o secundario; 2 = o contrario (sl)
     */
    public record Linha(int codigo, String letreiro, int sufixo, int sentido,
                        String terminalPrincipal, String terminalSecundario) {

        /** Terminal para onde o onibus vai neste sentido (o que aparece no letreiro). */
        public String destino() {
            return sentido == 2 ? terminalPrincipal : terminalSecundario;
        }
    }

    /** @param horaConsulta hora da resposta da SPTrans (hr), no formato HH:mm */
    public record PrevisaoLinha(String horaConsulta, List<Parada> paradas) {
    }

    public record Parada(long codigo, String nome, double latitude, double longitude, List<Veiculo> veiculos) {
    }

    /**
     * @param previsto horario previsto de chegada na parada (t), no formato HH:mm
     * @param acessivel veiculo acessivel (a); nulo quando a SPTrans nao informa
     * @param ultimaPosicao hora da ultima posicao recebida do veiculo (ta)
     */
    public record Veiculo(String prefixo, String previsto, Boolean acessivel, Instant ultimaPosicao) {
    }
}
