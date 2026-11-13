#!/usr/bin/env bash
# Baixa o jar do OpenTripPlanner para esta pasta.
set -euo pipefail
cd "$(dirname "$0")"

OTP_VERSAO="${OTP_VERSAO:-2.8.1}"
ARQUIVO="otp-shaded-${OTP_VERSAO}-shaded.jar"
URL="https://repo1.maven.org/maven2/org/opentripplanner/otp-shaded/${OTP_VERSAO}/${ARQUIVO}"

if [ -f "$ARQUIVO" ]; then
  echo "$ARQUIVO já existe, nada a fazer."
  exit 0
fi

echo "Baixando $URL"
curl -fL -o "$ARQUIVO" "$URL"
echo "Pronto: $ARQUIVO"
