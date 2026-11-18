"""Confere se a API do CNES responde e resume as UBS da cidade piloto.

Uso, a partir de data/etl:
    python -m vias_etl.verificar_demas

Lê todas as páginas das UBS (tipo 2) do município, o que leva cerca de meio minuto.
"""

import sys

import requests

from .cnes.demas import ClienteDemas, ErroDemas, atende_sus, tem_coordenadas
from .config import ler

TIPO_UBS = 2


def main() -> None:
    municipio = ler("VIAS_MUNICIPIO_IBGE", "355030")
    cliente = ClienteDemas()
    try:
        tipos = cliente.tipos_unidade()
        print(f"API do CNES respondeu: {len(tipos)} tipos de unidade cadastrados.")

        print(f"\nLendo as UBS do município {municipio}...")
        ubs = list(cliente.estabelecimentos(municipio, codigo_tipo_unidade=TIPO_UBS))
    except (ErroDemas, requests.RequestException) as erro:
        sys.exit(f"Falha ao falar com a API do CNES: {erro}")

    if not ubs:
        sys.exit("Nenhuma UBS encontrada. Confira o VIAS_MUNICIPIO_IBGE no .env (São Paulo: 355030).")

    com_sus = sum(atende_sus(u) for u in ubs)
    com_coordenadas = sum(tem_coordenadas(u) for u in ubs)
    print(f"UBS ativas: {len(ubs)}")
    print(f"  Atendem SUS: {com_sus}")
    print(f"  Com latitude e longitude: {com_coordenadas}")
    print("\nPrimeiras três:")
    for unidade in ubs[:3]:
        print(f"  {unidade.get('codigo_cnes')} - {unidade.get('nome_fantasia')}")


if __name__ == "__main__":
    main()
