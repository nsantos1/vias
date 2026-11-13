# VIAS – Via Inteligente de Acesso à Saúde

Projeto da Global Solution FIAP 2026 (Citizen Tech). O VIAS leva a pessoa ao atendimento de saúde certo, pelo caminho que ela consegue fazer: cruza os dados abertos do CNES com o transporte público (GTFS e Olho Vivo) e o mapa do OpenStreetMap, com rota acessível para cadeira de rodas.

As decisões do projeto (stack, deploy, divisão do trabalho, fases) estão no documento **Proposta refinada / Plano de desenvolvimento** do grupo. Este README só explica como o repositório está organizado e como rodar cada parte.

## Estrutura e responsáveis

| Pasta | O que é | Responsável |
|---|---|---|
| `apps/mobile` | App do cidadão (React Native + Expo, TypeScript) | Victor (1) |
| `apps/painel-gestor` | Painel do gestor (React + Vite, TypeScript) | Felipe (4) |
| `services/api` | API principal (Java 21 + Spring Boot) e migrações Flyway | Raphael (2) |
| `services/api/.../integracao` | Clientes Java do OpenTripPlanner, Olho Vivo, Google e IA | Nicolas (3) |
| `services/ia` | Serviço de IA (Python + FastAPI) | Felipe (4) |
| `services/otp` | OpenTripPlanner: scripts para montar e servir o grafo | Nicolas (3) |
| `data/etl` | Carga de dados em Python (CNES, GTFS, IBGE, acessibilidade) | Nicolas (3) |
| `data/raw`, `data/processed` | Arquivos baixados e cargas prontas (fora do Git) | Nicolas (3) |
| `database` | Modelo de dados (DER) e dicionário de dados | Raphael (2) |
| `scripts` | Preparação da máquina da Oracle Cloud e HTTPS (fase 4) | Nicolas (3) |
| `docs` | Arquitetura, decisões e roteiro do pitch | Felipe (4) |

Ser responsável por uma pasta significa aprovar os pull requests que mexem nela. Qualquer integrante pode alterar outra pasta, desde que por pull request separado e marcando o responsável. Ninguém faz merge sem a revisão de outro integrante.

## Portas usadas em desenvolvimento

| Serviço | Porta |
|---|---|
| API Java | 8080 |
| OpenTripPlanner | 8081 |
| Serviço de IA (FastAPI) | 8000 |

O OpenTripPlanner usa 8080 por padrão; aqui ele roda na 8081 para não disputar a porta com a API.

## Primeiros passos

1. Copie o arquivo de variáveis e preencha com as suas credenciais (o `.env` nunca vai para o Git):

   ```bash
   cp .env.example .env
   ```

2. Banco: todos usam o mesmo Oracle da FIAP. As tabelas ficam no usuário do Raphael, que libera acesso aos outros com `GRANT`. Ninguém compartilha senha de aluno.

3. Rode a parte em que vai trabalhar seguindo o README da pasta:
   - ETL e verificação do banco: [`data/etl/README.md`](data/etl/README.md)
   - OpenTripPlanner: [`services/otp/README.md`](services/otp/README.md)
   - API Java: [`services/api/README.md`](services/api/README.md)
   - Serviço de IA: [`services/ia/README.md`](services/ia/README.md)
   - App: [`apps/mobile/README.md`](apps/mobile/README.md)
   - Painel: [`apps/painel-gestor/README.md`](apps/painel-gestor/README.md)

## Deploy (fase 4)

O projeto não usa Docker. Todo o deploy usa serviços gratuitos:

- **Painel do gestor:** Vercel.
- **API Java, OpenTripPlanner e FastAPI:** uma máquina Oracle Cloud Always Free, com o Caddy na frente da API para o HTTPS.
- **Banco:** Oracle da FIAP.
- **App:** APK Android gerado pelo EAS Build do Expo, com link e QR code para a banca.

Os detalhes ficam em [`scripts/README.md`](scripts/README.md) e na seção "Deploy e distribuição" do plano.

## Testes e CI

Cada parte tem os seus testes (JUnit, pytest, Jest). O GitHub Actions roda os testes de uma parte quando um pull request mexe nela. Hoje só o ETL tem workflow (`.github/workflows/ci-etl.yml`); cada responsável acrescenta o da sua parte quando o projeto dela existir.
