#!/usr/bin/env bash
# Monta o grafo a partir do GTFS e do mapa em grafo/ e salva grafo/graph.obj.
set -euo pipefail
cd "$(dirname "$0")"

OTP_VERSAO="${OTP_VERSAO:-2.8.1}"
OTP_MEMORIA="${OTP_MEMORIA:-4G}"
JAR="otp-shaded-${OTP_VERSAO}-shaded.jar"

[ -f "$JAR" ] || { echo "Falta o $JAR. Rode ./baixar-otp.sh antes."; exit 1; }
ls grafo/*gtfs*.zip >/dev/null 2>&1 || { echo "Falta o GTFS em grafo/ (nome com 'gtfs' e terminado em .zip)."; exit 1; }
ls grafo/*.osm.pbf >/dev/null 2>&1 || { echo "Falta o mapa .osm.pbf em grafo/. Veja o passo 2 do README."; exit 1; }

java -Xmx"$OTP_MEMORIA" -jar "$JAR" --build --save grafo
