"""Leitura das variáveis do arquivo .env na raiz do repositório."""

import os
from pathlib import Path

from dotenv import load_dotenv

# data/etl/vias_etl/config.py -> a raiz do repositório fica três pastas acima
RAIZ_REPOSITORIO = Path(__file__).resolve().parents[3]
PASTA_RAW = RAIZ_REPOSITORIO / "data" / "raw"
PASTA_PROCESSED = RAIZ_REPOSITORIO / "data" / "processed"

load_dotenv(RAIZ_REPOSITORIO / ".env")


class ConfiguracaoAusente(RuntimeError):
    """Uma variável obrigatória não está no .env."""


def exigir(nome: str) -> str:
    """Devolve o valor da variável ou explica qual falta no .env."""
    valor = os.getenv(nome, "").strip()
    if not valor:
        raise ConfiguracaoAusente(
            f"A variável {nome} está vazia. Preencha no arquivo .env na raiz do "
            f"repositório (veja o .env.example)."
        )
    return valor


def ler(nome: str, padrao: str = "") -> str:
    """Devolve o valor da variável, ou o padrão se ela não existir."""
    return os.getenv(nome, padrao).strip()
