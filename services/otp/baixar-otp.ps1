# Baixa o jar do OpenTripPlanner para esta pasta.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$versao = if ($env:OTP_VERSAO) { $env:OTP_VERSAO } else { "2.8.1" }
$arquivo = "otp-shaded-$versao-shaded.jar"
$url = "https://repo1.maven.org/maven2/org/opentripplanner/otp-shaded/$versao/$arquivo"

if (Test-Path $arquivo) {
    Write-Host "$arquivo já existe, nada a fazer."
    exit 0
}

Write-Host "Baixando $url"
Invoke-WebRequest -Uri $url -OutFile $arquivo
Write-Host "Pronto: $arquivo"
