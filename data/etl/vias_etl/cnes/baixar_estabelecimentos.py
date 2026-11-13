"""Baixa os estabelecimentos ativos da cidade piloto e salva em data/raw como JSON.

Uso, a partir de data/etl:
    python -m vias_etl.cnes.baixar_estabelecimentos
    python -m vias_etl.cnes.baixar_estabelecimentos --tipo 2

Gravar no Oracle é outro passo (carga.py), que depende do contrato de tabelas com o Raphael.
"""

import argparse
import json

from ..config import PASTA_RAW, exigir, ler
from .demas import ClienteDemas


def main() -> None:
    argumentos = argparse.ArgumentParser(description=__doc__)
    argumentos.add_argument("--tipo", type=int, help="codigo_tipo_unidade (sem filtro se omitido)")
    argumentos.add_argument("--primeira-pagina", type=int, default=0)
    opcoes = argumentos.parse_args()

    municipio = ler("VIAS_MUNICIPIO_IBGE", "355030")
    cliente = ClienteDemas(
        exigir("DEMAS_LOGIN"),
        exigir("DEMAS_SENHA"),
        primeira_pagina=opcoes.primeira_pagina,
    )
    cliente.autenticar()

    registros = []
    for registro in cliente.estabelecimentos(municipio, codigo_tipo_unidade=opcoes.tipo):
        registros.append(registro)
        if len(registros) % 200 == 0:
            print(f"{len(registros)} estabelecimentos lidos...")

    sufixo = f"_tipo{opcoes.tipo}" if opcoes.tipo is not None else ""
    destino = PASTA_RAW / f"cnes_estabelecimentos_{municipio}{sufixo}.json"
    destino.write_text(json.dumps(registros, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"{len(registros)} estabelecimentos salvos em {destino}")


if __name__ == "__main__":
    main()
