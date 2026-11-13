# Scripts de deploy (fase 4)

Responsável: Nicolas (3). Preparam a máquina gratuita da Oracle Cloud que vai rodar a API Java, o OpenTripPlanner e o FastAPI.

| Arquivo | Para quê | Situação |
|---|---|---|
| `setup-servidor.sh` | Instala Java 21, Python e Caddy e deixa os três serviços ligando sozinhos | Rascunho, implementar na fase 4 |
| `Caddyfile` | Coloca o HTTPS na frente da API | Modelo, falta o domínio |

## Como fica a máquina

| Serviço | Porta interna | Acesso de fora |
|---|---|---|
| API Java | 8080 | Pelo Caddy, em HTTPS (porta 443) |
| OpenTripPlanner | 8081 | Nenhum: só a API chama |
| FastAPI (IA) | 8000 | Nenhum: só a API chama |

## Cuidados com a conta da Oracle Cloud

- O cartão é usado só para uma pré-autorização temporária na verificação.
- Não fazer upgrade para Pay As You Go.
- Criar apenas recursos marcados como **Always Free** (máquina Ampere A1 com até 2 núcleos e 12 GB no total).
- A Oracle pode desligar a máquina se processador, rede e memória ficarem abaixo de 20% por 7 dias.

## O que conferir no dia do deploy

- A máquina alcança o Oracle da FIAP.
- A API libera no CORS o endereço do painel na Vercel.
- O APK do app aponta para o endereço HTTPS da API.

Plano B, se a Oracle Cloud não liberar a máquina: Azure for Students (US$ 100 por um ano, sem cartão, com o e-mail da FIAP).
