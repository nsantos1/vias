# API principal (Java + Spring Boot)

Responsável: Raphael (2), exceto a pasta `integracao`, que é do Nicolas (3).

A API é a única coisa que o app e o painel chamam. Ela lê o Oracle da FIAP, chama o OpenTripPlanner, o serviço de IA, a Olho Vivo e o Google, guarda as chaves e faz cache das respostas.

## Criar o projeto

O projeto Spring Boot ainda não foi gerado. Gere pelo [start.spring.io](https://start.spring.io) **dentro desta pasta**, mantendo a pasta `src/main/java/br/com/vias/integracao` que já existe:

- **Project:** Maven · **Language:** Java · **Java:** 21
- **Group:** `br.com.vias` · **Artifact:** `api` · **Package name:** `br.com.vias`
- **Dependencies:** Spring Web, Spring Data JPA, Oracle Driver, Flyway Migration, Validation, Spring Cache Abstraction, Spring Security
- Acrescentar no `pom.xml` depois: `com.github.ben-manes.caffeine:caffeine` (cache em memória) e `springdoc-openapi` (Swagger), na versão compatível com o Spring Boot escolhido.

**Decisão para o Raphael:** o plano fala em Spring Boot 3, mas o suporte gratuito do 3.5 terminou em 30 de junho de 2026. Hoje as versões com suporte gratuito são a 4.0 (até 31/12/2026) e a 4.1. Ambas funcionam com Java 21.

## Configuração

As credenciais vêm do `.env` na raiz (veja `.env.example`). No `application.yml`, use as mesmas variáveis:

```yaml
spring:
  datasource:
    url: jdbc:oracle:thin:@${ORACLE_DSN}
    username: ${ORACLE_USER}
    password: ${ORACLE_PASSWORD}
server:
  port: 8080
```

Os scripts do banco ficam só em `src/main/resources/db/migration` (Flyway). As tabelas ficam no usuário da FIAP do Raphael, que libera leitura e gravação aos outros com `GRANT`.

## Pasta `integracao` (Nicolas)

Já tem uma **proposta** de interfaces para combinar com o Raphael:

| Interface | Implementação prevista | Usada por |
|---|---|---|
| `rotas.ClienteRotas` | OpenTripPlanner (porta 8081) | `rota`, `agendamento` |
| `olhovivo.ClienteOlhoVivo` | API Olho Vivo da SPTrans | `rota`, `agendamento` |
| `google.ClienteRotasCarro` | Google Routes API, trânsito pessimista | `agendamento` |
| `ia.ClienteIa` | Serviço de IA em FastAPI (porta 8000) | busca |

Enquanto as implementações não existem, os serviços da API podem simular as respostas com Mockito a partir dessas interfaces. Mudanças no contrato vão por pull request, com revisão dos dois.
