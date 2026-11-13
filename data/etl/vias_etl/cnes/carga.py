"""Grava no Oracle os estabelecimentos, equipamentos e serviços do CNES.

Pendente: depende do contrato de tabelas com o Raphael (item "Tabelas do ETL" em
"A combinar" no plano). As tabelas são criadas por ele pelo Flyway; este módulo só grava.
"""

from collections.abc import Iterable
from typing import Any


def carregar_estabelecimentos(conexao: Any, registros: Iterable[dict[str, Any]]) -> int:
    raise NotImplementedError(
        "Aguardando o contrato de tabelas com o integrante 2 (Raphael)."
    )
