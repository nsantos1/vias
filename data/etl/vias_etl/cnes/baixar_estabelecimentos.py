"""Baixa os estabelecimentos ativos da cidade piloto, salva em data/raw e mostra um resumo.

Uso, a partir de data/etl:
    python -m vias_etl.cnes.baixar_estabelecimentos             # os tipos que interessam ao VIAS
    python -m vias_etl.cnes.baixar_estabelecimentos --tipo 2    # só um tipo (pode repetir --tipo)

Gera em data/raw:
    cnes_tipos_unidade.json                 tipos de unidade (para a tabela tipo_unidade)
    cnes_estabelecimentos_<municipio>.json  estabelecimentos dos tipos baixados

Gravar no Oracle é outro passo (carga.py), que depende do contrato de tabelas com o Raphael.
"""

import argparse
import json
from collections import Counter
from collections.abc import Iterable
from typing import Any

from ..config import PASTA_RAW, ler
from .demas import ClienteDemas, atende_sus, tem_coordenadas

# Tipos de unidade do CNES que o VIAS mostra (códigos de /cnes/tipounidades)
TIPOS_VIAS = [1, 2, 4, 5, 7, 15, 20, 21, 36, 39, 73]

# Primeiro dígito da natureza jurídica (tabela do IBGE/CONCLA)
GRUPOS_NATUREZA = {
    "1": "publica",
    "2": "empresa",
    "3": "sem_fins_lucrativos",
    "4": "pessoa_fisica",
}


def grupo_natureza(estabelecimento: dict[str, Any]) -> str:
    codigo = str(estabelecimento.get("descricao_natureza_juridica_estabelecimento") or "").strip()
    return GRUPOS_NATUREZA.get(codigo[:1], "outra")


def resumir(registros: Iterable[dict[str, Any]]) -> dict[int, Counter]:
    """Conta, por tipo de unidade: total, atende SUS, com coordenadas e grupo de natureza jurídica."""
    resumo: dict[int, Counter] = {}
    for registro in registros:
        contagem = resumo.setdefault(int(registro.get("codigo_tipo_unidade") or 0), Counter())
        contagem["total"] += 1
        contagem["sus"] += atende_sus(registro)
        contagem["coordenadas"] += tem_coordenadas(registro)
        contagem[grupo_natureza(registro)] += 1
    return resumo


def imprimir_resumo(resumo: dict[int, Counter], descricoes: dict[int, str]) -> None:
    colunas = ["total", "sus", "coordenadas", "publica", "empresa", "sem_fins_lucrativos", "pessoa_fisica", "outra"]
    titulos = ["Total", "SUS", "Coord.", "Pública", "Empresa", "S/ fins lucr.", "P. física", "Outra"]
    print(f"\n{'Tipo':<46}" + "".join(f"{t:>14}" for t in titulos))
    for tipo in sorted(resumo):
        nome = f"{tipo} - {descricoes.get(tipo, '?')}"[:45]
        print(f"{nome:<46}" + "".join(f"{resumo[tipo][c]:>14}" for c in colunas))
    total = sum((c for c in resumo.values()), Counter())
    print(f"{'TOTAL':<46}" + "".join(f"{total[c]:>14}" for c in colunas))


def main() -> None:
    argumentos = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    argumentos.add_argument("--tipo", type=int, action="append", help="codigo_tipo_unidade (pode repetir)")
    opcoes = argumentos.parse_args()

    municipio = ler("VIAS_MUNICIPIO_IBGE", "355030")
    tipos = opcoes.tipo or TIPOS_VIAS
    cliente = ClienteDemas()

    tipos_unidade = cliente.tipos_unidade()
    (PASTA_RAW / "cnes_tipos_unidade.json").write_text(
        json.dumps(tipos_unidade, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    descricoes = {
        int(t["codigo_tipo_unidade"]): str(t.get("descricao_tipo_unidade", "")).title()
        for t in tipos_unidade
    }

    registros: list[dict[str, Any]] = []
    for tipo in tipos:
        antes = len(registros)
        registros.extend(cliente.estabelecimentos(municipio, codigo_tipo_unidade=tipo))
        print(f"Tipo {tipo} ({descricoes.get(tipo, '?')}): {len(registros) - antes} estabelecimentos")

    destino = PASTA_RAW / f"cnes_estabelecimentos_{municipio}.json"
    destino.write_text(json.dumps(registros, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"\n{len(registros)} estabelecimentos salvos em {destino}")

    imprimir_resumo(resumir(registros), descricoes)


if __name__ == "__main__":
    main()
