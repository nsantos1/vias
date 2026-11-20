# ETL – carga de dados do VIAS

Responsável: Nicolas (3). Python que busca os dados abertos e grava no Oracle da FIAP. O app e a API nunca chamam essas fontes direto: só leem o banco.

## Preparar o ambiente

Python 3.10 ou mais recente (recomendado 3.12). No macOS, o Python 3.9 que vem no sistema não serve. A partir desta pasta (`data/etl`):

```bash
python3.12 -m venv .venv
# macOS/Linux
source .venv/bin/activate
# Windows (PowerShell)
.venv\Scripts\Activate.ps1

pip install -r requirements.txt
```

Preencha o `.env` na raiz do repositório (copie de `.env.example`).

## Comandos

| Comando | O que faz |
|---|---|
| `python -m vias_etl.verificar_oracle` | Confere a conexão com o Oracle da FIAP e se o Spatial responde |
| `python -m vias_etl.verificar_olhovivo` | Confere o token da Olho Vivo e mostra quantos ônibus acessíveis circulam agora |
| `python -m vias_etl.verificar_tabelas` | Confere o seu acesso às tabelas do Raphael (precisa de `ORACLE_ESQUEMA_TABELAS` no `.env`) e mostra as colunas reais |
| `python -m vias_etl.verificar_demas` | Confere a API do CNES e resume as UBS da cidade (quantas, quantas atendem SUS, quantas têm localização) |
| `python -m vias_etl.gtfs.acessibilidade <gtfs.zip>` | Mostra quanto do GTFS tem os campos de acessibilidade preenchidos (portão 1) |
| `python -m vias_etl.cnes.baixar_estabelecimentos [--tipo N]` | Baixa para `data/raw` os estabelecimentos ativos da cidade dos tipos que interessam ao VIAS e mostra um resumo por tipo |
| `pytest` | Roda os testes |

## Organização

| Pasta | Conteúdo | Situação |
|---|---|---|
| `vias_etl/cnes` | Cliente da API DEMAS, download e carga no Oracle | Cliente e download prontos; carga aguarda o contrato de tabelas |
| `vias_etl/gtfs` | Leitura do GTFS da SPTrans | Checagem de acessibilidade pronta; intervalos e paradas a fazer |
| `vias_etl/ibge` | Setores censitários do Censo 2022 | A fazer, depende de quem calcula os desertos |
| `vias_etl/acessibilidade` | Preenchimento dos campos de acessibilidade do GTFS | Só se a checagem mostrar campos vazios |

## Fontes do CNES

- **Estabelecimentos:** API de dados abertos da Saúde (`/cnes/estabelecimentos`), filtrada por município e tipo de unidade. É pública, sem cadastro, e devolve no máximo 20 itens por página.
- **Estabelecimentos (alternativa):** JSON único do Portal de Dados Abertos do SUS, atualizado todo dia.
- **Equipamentos e serviços especializados:** arquivos EQ e SR do DATASUS para São Paulo, do mês mais recente. A API não traz esses dados.

Conferido direto na API em 17/11/2026: o `offset` é o número da página, começando em 0; o município usa o código do IBGE com 6 dígitos (São Paulo: 355030); e a resposta vem em `{"estabelecimentos": [...]}`. A lista completa de campos usados está no início de `vias_etl/cnes/demas.py`.

## Pendências que dependem do grupo

- Tabelas onde o ETL grava: contrato com o Raphael (as tabelas são criadas por ele pelo Flyway).
- Cálculo dos desertos de acesso: ainda em "A combinar" no plano.
