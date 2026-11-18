package br.com.vias.integracao.google;

import br.com.vias.exception.ServicoExternoException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

/**
 * Cliente do Google Routes API (v2, computeRoutes) em modo transporte publico.
 * Documentacao: https://developers.google.com/maps/documentation/routes/transit-route
 *
 * <p>A chave fica so no servidor (variavel GOOGLE_ROUTES_CHAVE) e nunca vai para o navegador.
 * As coordenadas da pessoa sao enviadas ao Google apenas para este calculo e nao sao gravadas
 * nem registradas em log pela API.
 */
@Component
public class ClienteGoogleRoutes {

    private static final Logger log = LoggerFactory.getLogger(ClienteGoogleRoutes.class);

    static final String URL = "https://routes.googleapis.com/directions/v2:computeRoutes";

    /** So os campos usados pelo VIAS (o Google cobra e responde mais rapido com menos campos). */
    static final String CAMPOS = String.join(",",
            "routes.duration",
            "routes.distanceMeters",
            "routes.legs.steps.travelMode",
            "routes.legs.steps.staticDuration",
            "routes.legs.steps.distanceMeters",
            "routes.legs.steps.polyline.encodedPolyline",
            "routes.legs.steps.transitDetails");

    private final HttpClient http;
    private final ObjectMapper json;
    private final String chave;

    public ClienteGoogleRoutes(ObjectMapper json, @Value("${vias.google.routes-chave:}") String chave) {
        this.json = json;
        this.chave = chave == null ? "" : chave.trim();
        this.http = HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(10)).build();
    }

    public boolean configurado() {
        return !chave.isEmpty();
    }

    /**
     * Calcula rotas de transporte publico. Informe {@code chegarAte} ou {@code sairEm} (nunca os dois).
     *
     * @return rotas na ordem do Google; lista vazia quando nao ha rota de transporte publico
     */
    public List<RotaTransporte> calcular(double origemLat, double origemLon, double destinoLat, double destinoLon,
                                         Instant chegarAte, Instant sairEm) {
        if (!configurado()) {
            throw new ServicoExternoException(
                    "O cálculo de percurso não está configurado neste servidor (falta a chave do Google Routes).");
        }
        ObjectNode corpo = json.createObjectNode();
        corpo.set("origin", ponto(origemLat, origemLon));
        corpo.set("destination", ponto(destinoLat, destinoLon));
        corpo.put("travelMode", "TRANSIT");
        if (chegarAte != null) {
            corpo.put("arrivalTime", chegarAte.toString());
        } else if (sairEm != null) {
            corpo.put("departureTime", sairEm.toString());
        }
        corpo.put("computeAlternativeRoutes", true);
        corpo.put("languageCode", "pt-BR");
        corpo.put("regionCode", "BR");
        corpo.put("units", "METRIC");

        HttpResponse<String> resposta;
        try {
            HttpRequest pedido = HttpRequest.newBuilder(URI.create(URL))
                    .timeout(Duration.ofSeconds(20))
                    .header("Content-Type", "application/json")
                    .header("X-Goog-Api-Key", chave)
                    .header("X-Goog-FieldMask", CAMPOS)
                    .POST(HttpRequest.BodyPublishers.ofString(json.writeValueAsString(corpo)))
                    .build();
            resposta = http.send(pedido, HttpResponse.BodyHandlers.ofString());
        } catch (IOException e) {
            log.warn("Google Routes não respondeu: {}", e.getMessage());
            throw new ServicoExternoException("O serviço de rotas não respondeu. Tente de novo em instantes.", e);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new ServicoExternoException("O cálculo do percurso foi interrompido.", e);
        }

        if (resposta.statusCode() != 200) {
            // A mensagem de erro do Google nao contem as coordenadas do pedido.
            log.warn("Google Routes respondeu HTTP {}: {}", resposta.statusCode(), mensagemDeErro(resposta.body()));
            throw new ServicoExternoException("O serviço de rotas recusou o pedido agora. Tente de novo em instantes.");
        }
        try {
            return interpretar(json.readTree(resposta.body()));
        } catch (IOException e) {
            throw new ServicoExternoException("O serviço de rotas respondeu num formato inesperado.", e);
        }
    }

    private ObjectNode ponto(double latitude, double longitude) {
        ObjectNode latLng = json.createObjectNode();
        latLng.put("latitude", latitude);
        latLng.put("longitude", longitude);
        ObjectNode local = json.createObjectNode();
        local.set("latLng", latLng);
        ObjectNode ponto = json.createObjectNode();
        ponto.set("location", local);
        return ponto;
    }

    private String mensagemDeErro(String corpo) {
        try {
            return json.readTree(corpo).path("error").path("message").asText("(sem mensagem)");
        } catch (IOException e) {
            return "(corpo ilegível)";
        }
    }

    // ------------------------------------------------------------------ leitura da resposta

    /** Converte o JSON do computeRoutes. Publico para os testes usarem fixtures. */
    public static List<RotaTransporte> interpretar(JsonNode raiz) {
        List<RotaTransporte> rotas = new ArrayList<>();
        for (JsonNode rota : raiz.path("routes")) {
            List<RotaTransporte.Passo> passos = new ArrayList<>();
            for (JsonNode trecho : rota.path("legs")) {
                for (JsonNode passo : trecho.path("steps")) {
                    passos.add(passo(passo));
                }
            }
            rotas.add(new RotaTransporte(duracao(rota.path("duration")), inteiro(rota.path("distanceMeters")), passos));
        }
        return rotas;
    }

    private static RotaTransporte.Passo passo(JsonNode passo) {
        RotaTransporte.Transporte transporte = null;
        if ("TRANSIT".equals(passo.path("travelMode").asText()) && passo.has("transitDetails")) {
            JsonNode d = passo.path("transitDetails");
            JsonNode linha = d.path("transitLine");
            JsonNode paradas = d.path("stopDetails");
            JsonNode agencias = linha.path("agencies");
            transporte = new RotaTransporte.Transporte(
                    texto(linha.path("vehicle").path("type")),
                    texto(linha.path("vehicle").path("name").path("text")),
                    texto(linha.path("nameShort")),
                    texto(linha.path("name")),
                    texto(linha.path("color")),
                    texto(linha.path("textColor")),
                    agencias.isArray() && !agencias.isEmpty() ? texto(agencias.get(0).path("name")) : null,
                    texto(d.path("headsign")),
                    parada(paradas.path("departureStop"), paradas.path("departureTime")),
                    parada(paradas.path("arrivalStop"), paradas.path("arrivalTime")),
                    inteiro(d.path("stopCount")),
                    duracao(d.path("headway")));
        }
        return new RotaTransporte.Passo(
                duracao(passo.path("staticDuration")),
                inteiro(passo.path("distanceMeters")),
                texto(passo.path("polyline").path("encodedPolyline")),
                transporte);
    }

    private static RotaTransporte.Parada parada(JsonNode parada, JsonNode horario) {
        JsonNode latLng = parada.path("location").path("latLng");
        return new RotaTransporte.Parada(
                texto(parada.path("name")),
                latLng.has("latitude") ? latLng.path("latitude").asDouble() : null,
                latLng.has("longitude") ? latLng.path("longitude").asDouble() : null,
                horario.isTextual() ? Instant.parse(horario.asText()) : null);
    }

    /** O Google manda duracoes como texto em segundos, por exemplo "754s". */
    static Duration duracao(JsonNode no) {
        if (!no.isTextual() || !no.asText().endsWith("s")) {
            return null;
        }
        String valor = no.asText();
        return Duration.ofSeconds(Math.round(Double.parseDouble(valor.substring(0, valor.length() - 1))));
    }

    private static Integer inteiro(JsonNode no) {
        return no.isNumber() ? no.asInt() : null;
    }

    private static String texto(JsonNode no) {
        return no.isTextual() && !no.asText().isBlank() ? no.asText() : null;
    }
}
