package br.com.vias;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.Locale;
import java.util.TimeZone;

/**
 * VIAS - encontra a unidade de saude certa e diz a que horas sair de casa.
 */
@SpringBootApplication
public class ViasApiApplication {

    public static void main(String[] args) {
        Locale.setDefault(Locale.of("pt", "BR"));
        TimeZone.setDefault(TimeZone.getTimeZone("America/Sao_Paulo"));
        SpringApplication.run(ViasApiApplication.class, args);
    }
}
