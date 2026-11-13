# Carrega grafo\graph.obj e sobe o OpenTripPlanner na porta 8081.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$versao = if ($env:OTP_VERSAO) { $env:OTP_VERSAO } else { "2.8.1" }
$memoria = if ($env:OTP_MEMORIA) { $env:OTP_MEMORIA } else { "4G" }
$porta = if ($env:OTP_PORTA) { $env:OTP_PORTA } else { "8081" }
$jar = "otp-shaded-$versao-shaded.jar"

if (-not (Test-Path $jar)) { Write-Host "Falta o $jar. Rode .\baixar-otp.ps1 antes."; exit 1 }
if (-not (Test-Path "grafo\graph.obj")) { Write-Host "Falta grafo\graph.obj. Rode .\montar-grafo.ps1 antes."; exit 1 }

java "-Xmx$memoria" -jar $jar --load --serve --port $porta grafo
