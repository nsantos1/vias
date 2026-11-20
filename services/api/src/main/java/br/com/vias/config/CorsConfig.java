package br.com.vias.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/** Libera somente as origens conhecidas do front-end (Next.js) para chamar a API. */
@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Value("${vias.cors.origens:http://localhost:3000}")
    private String origens;

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins(java.util.Arrays.stream(origens.split(",")).map(String::trim).toArray(String[]::new))
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS");
    }
}
