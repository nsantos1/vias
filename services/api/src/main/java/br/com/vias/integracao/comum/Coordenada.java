package br.com.vias.integracao.comum;

/** Ponto no mapa em graus (WGS 84), o mesmo sistema do GTFS, do OSM e do SRID 4326 do Oracle. */
public record Coordenada(double latitude, double longitude) {

    public Coordenada {
        if (latitude < -90 || latitude > 90) {
            throw new IllegalArgumentException("Latitude fora do intervalo: " + latitude);
        }
        if (longitude < -180 || longitude > 180) {
            throw new IllegalArgumentException("Longitude fora do intervalo: " + longitude);
        }
    }
}
