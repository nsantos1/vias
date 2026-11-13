# Monta o grafo a partir do GTFS e do mapa em grafo\ e salva grafo\graph.obj.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$versao = if ($env:OTP_VERSAO) { $env:OTP_VERSAO } else { "2.8.1" }
$memoria = if ($env:OTP_MEMORIA) { $env:OTP_MEMORIA } else { "4G" }
$jar = "otp-shaded-$versao-shaded.jar"

if (-not (Test-Path $jar)) { Write-Host "Falta o $jar. Rode .\baixar-otp.ps1 antes."; exit 1 }
if (-not (Get-ChildItem grafo -Filter "*gtfs*.zip" -ErrorAction SilentlyContinue)) {
    Write-Host "Falta o GTFS em grafo\ (nome com 'gtfs' e terminado em .zip)."; exit 1
}
if (-not (Get-ChildItem grafo -Filter "*.osm.pbf" -ErrorAction SilentlyContinue)) {
    Write-Host "Falta o mapa .osm.pbf em grafo\. Veja o passo 2 do README."; exit 1
}

java "-Xmx$memoria" -jar $jar --build --save grafo
