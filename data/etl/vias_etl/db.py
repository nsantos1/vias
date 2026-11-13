"""Conexão com o Oracle da FIAP.

Usa o python-oracledb no modo "thin", que não precisa do Oracle Client instalado.
"""

import oracledb

from .config import exigir


def conectar() -> oracledb.Connection:
    return oracledb.connect(
        user=exigir("ORACLE_USER"),
        password=exigir("ORACLE_PASSWORD"),
        dsn=exigir("ORACLE_DSN"),
    )
