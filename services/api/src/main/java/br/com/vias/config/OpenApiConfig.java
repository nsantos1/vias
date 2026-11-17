package br.com.vias.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI viasOpenApi() {
        return new OpenAPI().info(new Info()
                .title("VIAS API")
                .version("1.0.0")
                .description("""
                        API do VIAS - Via Inteligente de Acesso a Saude (Global Solution FIAP 2026).
                        Pesquisa unidades de saude por servico, regiao, bairro e acessibilidade, usando dados
                        reais do CNES/DATASUS com proveniencia. Ausencia de informacao e devolvida como
                        NAO_INFORMADO, nunca como resposta negativa.""")
                .contact(new Contact().name("Equipe VIAS - FIAP Paulista")));
    }
}
