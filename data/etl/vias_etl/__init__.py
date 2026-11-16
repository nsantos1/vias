"""Carga de dados do VIAS: CNES, GTFS, IBGE e acessibilidade para o Oracle."""

import sys

if sys.version_info < (3, 10):
    raise RuntimeError(
        f"O ETL do VIAS precisa do Python 3.10 ou mais recente, mas este é o "
        f"{sys.version.split()[0]}. Recrie o ambiente: rm -rf .venv && "
        f"python3.12 -m venv .venv (veja data/etl/README.md)."
    )
