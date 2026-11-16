#!/usr/bin/env bash
# Baixa o jar do OpenTripPlanner para esta pasta.
# A documentação do OTP mostra dois nomes de arquivo diferentes para o mesmo jar,
# então o script testa os endereços conhecidos e usa o primeiro que existir.
set -euo pipefail
cd "$(dirname "$0")"

OTP_VERSAO="${OTP_VERSAO:-2.8.1}"
DESTINO="otp-shaded-${OTP_VERSAO}-shaded.jar"   # nome que montar-grafo.sh e servir.sh esperam
MAVEN="https://repo1.maven.org/maven2/org/opentripplanner"
CANDIDATOS=(
  "${MAVEN}/otp-shaded/${OTP_VERSAO}/otp-shaded-${OTP_VERSAO}.jar"
  "${MAVEN}/otp-shaded/${OTP_VERSAO}/otp-shaded-${OTP_VERSAO}-shaded.jar"
  "${MAVEN}/otp/${OTP_VERSAO}/otp-${OTP_VERSAO}-shaded.jar"
)

if [ -f "$DESTINO" ]; then
  echo "$DESTINO já existe, nada a fazer."
  exit 0
fi

for url in "${CANDIDATOS[@]}"; do
  echo "Tentando $url"
  if curl -fL -o "$DESTINO.parcial" "$url"; then
    mv "$DESTINO.parcial" "$DESTINO"
    echo "Pronto: $DESTINO"
    exit 0
  fi
  rm -f "$DESTINO.parcial"
done

echo "Nenhum endereço funcionou para a versão $OTP_VERSAO. Confira em https://docs.opentripplanner.org/en/latest/Getting-OTP/"
exit 1
