# Baixa o jar do OpenTripPlanner para esta pasta.
# A documentação do OTP mostra dois nomes de arquivo diferentes para o mesmo jar,
# então o script testa os endereços conhecidos e usa o primeiro que existir.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$versao = if ($env:OTP_VERSAO) { $env:OTP_VERSAO } else { "2.8.1" }
$destino = "otp-shaded-$versao-shaded.jar"   # nome que montar-grafo.ps1 e servir.ps1 esperam
$maven = "https://repo1.maven.org/maven2/org/opentripplanner"
$candidatos = @(
    "$maven/otp-shaded/$versao/otp-shaded-$versao.jar",
    "$maven/otp-shaded/$versao/otp-shaded-$versao-shaded.jar",
    "$maven/otp/$versao/otp-$versao-shaded.jar"
)

if (Test-Path $destino) {
    Write-Host "$destino já existe, nada a fazer."
    exit 0
}

foreach ($url in $candidatos) {
    Write-Host "Tentando $url"
    try {
        Invoke-WebRequest -Uri $url -OutFile "$destino.parcial"
        Move-Item "$destino.parcial" $destino
        Write-Host "Pronto: $destino"
        exit 0
    } catch {
        Remove-Item "$destino.parcial" -ErrorAction SilentlyContinue
    }
}

Write-Host "Nenhum endereço funcionou para a versão $versao. Confira em https://docs.opentripplanner.org/en/latest/Getting-OTP/"
exit 1
