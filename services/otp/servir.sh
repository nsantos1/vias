#!/usr/bin/env bash
# Carrega grafo/graph.obj e sobe o OpenTripPlanner na porta 8081.
set -euo pipefail
cd "$(dirname "$0")"

OTP_VERSAO="${OTP_VERSAO:-2.8.1}"
OTP_MEMORIA="${OTP_MEMORIA:-4G}"
OTP_PORTA="${OTP_PORTA:-8081}"
JAR="otp-shaded-${OTP_VERSAO}-shaded.jar"

[ -f "$JAR" ] || { echo "Falta o $JAR. Rode ./baixar-otp.sh antes."; exit 1; }
[ -f grafo/graph.obj ] || { echo "Falta grafo/graph.obj. Rode ./montar-grafo.sh antes."; exit 1; }

java -Xmx"$OTP_MEMORIA" -jar "$JAR" --load --serve --port "$OTP_PORTA" grafo
