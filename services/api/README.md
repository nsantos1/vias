# VIAS API – Via Inteligente de Acesso à Saúde (Java 21 + Spring Boot 3 + Oracle)

API principal do **VIAS**, a CitizenTech do grupo na Global Solution FIAP 2026 (2º semestre).
Pesquisa unidades de saúde por serviço, região, bairro, tipo, atendimento SUS e acessibilidade,
usando **dados reais do CNES/DATASUS** com proveniência. Informação ausente na fonte é devolvida
como `null` ou `NAO_INFORMADO`, nunca como resposta negativa.

Entrega da disciplina **Domain Driven Design – Java**. A documentação completa (capa, diagramas,
DER, protótipos, endpoints, instruções e limitações) está em
[docs/VIAS-DDD-Java-Documentacao.pdf](docs/VIAS-DDD-Java-Documentacao.pdf).

| | |
|---|---|
| Deploy | `https://vias-api.onrender.com` *(preencher após o deploy)* |
| Swagger | `/swagger-ui.html` |
| Health check | `/actuator/health` |

## Equipe

| Integrante | Frente |
|---|---|
| Victor | Front-end Next.js |
| Raphael | Back-end Java (esta API) |
| Nicolas | Banco Oracle |
| Felipe | Algoritmo Python (rotas) |

## Camadas

```
br.com.vias
├── model/        entidades JPA: UnidadeSaude, ServicoSaude, UnidadeServico, Regiao, FonteDado + enums
├── repository/   camada DAO (Spring Data JPA)
├── service/      camada BO (regras de negócio)
├── dto/          records de entrada (validados) e saída
├── controller/   REST: GET, POST, PUT, DELETE
├── exception/    exceções de domínio + GlobalExceptionHandler
└── config/       Swagger e CORS
src/main/resources/db/migration   V1 (tabelas) e V2 (carga real do CNES), aplicadas pelo Flyway
scripts/                          baixar_cnes.py e gerar_carga_sql.py (carga reproduzível)
```

## Endpoints

| Método | Rota | Descrição |
|---|---|---|
| GET | `/api/unidades` | Pesquisa paginada (`servicoId`, `regiaoId`, `bairro`, `nome`, `acessibilidade`, `atendeSus`, `tipoUnidade`, `pagina`, `tamanho`) |
| GET | `/api/unidades/{id}` | Detalhe com serviços, região, proveniência e avisos |
| POST | `/api/unidades` | Cadastro manual (fonte `CADASTRO_MANUAL`) |
| PUT | `/api/unidades/{id}` | Atualização (em unidade do CNES, só acessibilidade e região) |
| PUT | `/api/unidades/{id}/acessibilidade` | Registra acessibilidade verificada (exige fonte e data) |
| DELETE | `/api/unidades/{id}` | Exclui cadastro manual (unidades do CNES são protegidas) |
| GET | `/api/servicos`, `/api/servicos/{id}` | Catálogo de serviços |
| GET | `/api/regioes`, `/api/regioes/{id}` | Regiões (bairros do CNES) |
| GET | `/api/gestao/resumo` | Indicadores agregados do cadastro |

## Executar

**IntelliJ / Maven com o Oracle da FIAP**

1. Abra `services/api` no IntelliJ com JDK 21.
2. Defina as variáveis `DB_USER` (seu RM, ex.: `rm555555`) e `DB_PASS`.
   `DB_URL` já aponta para `jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL`.
3. Rode `ViasApiApplication` (ou `mvn spring-boot:run`). Na primeira subida, o Flyway cria as tabelas
   e carrega as 1.092 unidades do CNES. Se o schema já foi criado pela frente Oracle, use `FLYWAY_ENABLED=false`.
4. Acesse `http://localhost:8080/swagger-ui.html`.

**Tudo local com Docker (Oracle Free + API):** `docker compose up --build`

**Testes:** `mvn test`

**Atualizar a carga do CNES:**

```bash
python scripts/baixar_cnes.py
python scripts/gerar_carga_sql.py scripts/dados/cnes_sao_paulo_AAAA-MM-DD.json
```

## Deploy no Render

O `render.yaml` na raiz do repositório cria o serviço (runtime Docker, `rootDir: services/api`).
No painel do Render, informe `DB_USER`, `DB_PASS` e `CORS_ORIGENS` (URL do site Next.js).

## Variáveis de ambiente

| Variável | Padrão |
|---|---|
| `DB_URL` | `jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL` |
| `DB_USER`, `DB_PASS` | obrigatórias |
| `CORS_ORIGENS` | `http://localhost:3000` |
| `FLYWAY_ENABLED` | `true` |
| `DB_POOL_SIZE` | `3` |
| `PORT` | `8080` (o Render define) |

## Dados

Fonte: CNES – API de Dados Abertos do Ministério da Saúde (DEMAS), `/cnes/estabelecimentos`,
município de São Paulo (355030), tipos 2, 4, 5 e 73, consultado em 16/11/2026, somente estabelecimentos ativos.
O CNES não publica acessibilidade física neste recurso: todas as unidades começam como `NAO_INFORMADO`.
Nenhum dado pessoal de cidadãos é armazenado.
