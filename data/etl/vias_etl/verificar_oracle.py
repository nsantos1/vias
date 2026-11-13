"""Confere se o .env está certo e se o Oracle da FIAP responde com Spatial.

Uso, a partir de data/etl:
    python -m vias_etl.verificar_oracle
"""

import sys

import oracledb

from .config import ConfiguracaoAusente
from .db import conectar

# Distância em metros entre a Praça da Sé e um ponto próximo, em São Paulo
CONSULTA_SPATIAL = """
SELECT SDO_GEOM.SDO_DISTANCE(
  SDO_GEOMETRY(2001, 4326, SDO_POINT_TYPE(-46.6333, -23.5505, NULL), NULL, NULL),
  SDO_GEOMETRY(2001, 4326, SDO_POINT_TYPE(-46.6250, -23.5600, NULL), NULL, NULL),
  0.005, 'unit=M')
FROM dual
"""


def main() -> None:
    try:
        with conectar() as conexao:
            print(f"Conectado ao Oracle {conexao.version} como {conexao.username}.")
            with conexao.cursor() as cursor:
                cursor.execute(CONSULTA_SPATIAL)
                (distancia,) = cursor.fetchone()
    except ConfiguracaoAusente as erro:
        sys.exit(str(erro))
    except oracledb.Error as erro:
        sys.exit(f"O Oracle recusou a conexão ou a consulta: {erro}")
    print(f"Oracle Spatial respondeu: {distancia:.0f} metros entre os dois pontos de teste.")


if __name__ == "__main__":
    main()
