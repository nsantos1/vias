#!/usr/bin/env bash
# Prepara a máquina da Oracle Cloud para rodar a API Java, o OpenTripPlanner e o FastAPI.
#
# RASCUNHO DA FASE 4: ainda não implementado. Passos previstos:
#   1. Instalar Java 21, Python 3.12 e Caddy.
#   2. Liberar as portas 80 e 443 no firewall da máquina.
#   3. Copiar o jar da API, o grafo do OpenTripPlanner e o serviço de IA.
#   4. Criar um serviço do systemd para cada um (api, otp, ia), com reinício automático.
#   5. Instalar o Caddyfile com o domínio da API e iniciar o Caddy.
set -euo pipefail

echo "setup-servidor.sh ainda não foi implementado (fase 4). Veja scripts/README.md."
exit 1
