# ETL – carga de dados do VIAS

Responsável: Nicolas (3). Python que busca os dados abertos e grava no Oracle da FIAP. O app e a API nunca chamam essas fontes direto: só leem o banco.

## Preparar o ambiente

Python 3.12 ou mais recente. A partir desta pasta (`data/etl`):

```bash
python -m venv .venv
# Linux/macOS
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
| `python -m vias_etl.gtfs.acessibilidade <gtfs.zip>` | Mostra quanto do GTFS tem os campos de acessibilidade preenchidos (portão 1) |
| `python -m vias_etl.cnes.baixar_estabelecimentos [--tipo N]` | Baixa os estabelecimentos ativos da cidade pela API DEMAS para `data/raw` |
| `pytest` | Roda os testes |

## Organização

| Pasta | Conteúdo | Situação |
|---|---|---|
| `vias_etl/cnes` | Cliente da API DEMAS, download e carga no Oracle | Cliente e download prontos; carga aguarda o contrato de tabelas |
| `vias_etl/gtfs` | Leitura do GTFS da SPTrans | Checagem de acessibilidade pronta; intervalos e paradas a fazer |
| `vias_etl/ibge` | Setores censitários do Censo 2022 | A fazer, depende de quem calcula os desertos |
| `vias_etl/acessibilidade` | Preenchimento dos campos de acessibilidade do GTFS | Só se a checagem mostrar campos vazios |

## Fontes do CNES

- **Estabelecimentos:** API DEMAS (`/cnes/estabelecimentos`), filtrada por município e tipo de unidade. Exige login e devolve no máximo 20 itens por página.
- **Estabelecimentos (alternativa):** JSON único do Portal de Dados Abertos do SUS, atualizado todo dia.
- **Equipamentos e serviços especializados:** arquivos EQ e SR do DATASUS para São Paulo, do mês mais recente. A API DEMAS não traz esses dados.

O cliente da API (`vias_etl/cnes/demas.py`) tem alguns pontos marcados com `CONFIRMAR`: o formato do login, o formato da resposta e se a primeira página é 0 ou 1. Eles só podem ser conferidos no Swagger da API depois do cadastro e estão isolados para serem ajustados sem mexer no resto.

## Pendências que dependem do grupo

- Tabelas onde o ETL grava: contrato com o Raphael (as tabelas são criadas por ele pelo Flyway).
- Cálculo dos desertos de acesso: ainda em "A combinar" no plano.
