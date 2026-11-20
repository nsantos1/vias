"""Confere se o token da Olho Vivo funciona e mostra quantos ônibus acessíveis circulam agora.

Uso, a partir de data/etl:
    python -m vias_etl.verificar_olhovivo
"""

import sys

import requests

from . import olhovivo
from .config import ConfiguracaoAusente, exigir


def main() -> None:
    try:
        token = exigir("OLHOVIVO_TOKEN")
    except ConfiguracaoAusente as erro:
        sys.exit(str(erro))

    sessao = requests.Session()
    try:
        olhovivo.autenticar(sessao, token)
        print("Token aceito pela Olho Vivo.")

        linhas = olhovivo.buscar_linhas(sessao, "8000")
        print(f"\nBusca pela linha 8000: {len(linhas)} resultado(s)")
        for linha in linhas[:4]:
            print(f"  {linha.get('lt')}-{linha.get('tl')}: {linha.get('tp')} / {linha.get('ts')}")

        total, acessiveis = olhovivo.resumir_frota(olhovivo.posicoes(sessao))
    except olhovivo.ErroOlhoVivo as erro:
        sys.exit(str(erro))
    except requests.RequestException as erro:
        sys.exit(f"Falha ao falar com a Olho Vivo: {erro}")

    print(f"\nÔnibus em circulação agora: {total}")
    if total:
        print(f"Acessíveis: {acessiveis} ({100 * acessiveis / total:.1f}%)")


if __name__ == "__main__":
    main()
