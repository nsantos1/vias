"""Confere se o GTFS traz os campos de acessibilidade preenchidos.

É a checagem do portão 1: se a maior parte vier sem informação, o OpenTripPlanner não
consegue montar a rota acessível e o enriquecimento em vias_etl/acessibilidade passa a ser
necessário.

Uso, a partir de data/etl:
    python -m vias_etl.gtfs.acessibilidade ../../services/otp/grafo/sptrans-gtfs.zip

No GTFS, os dois campos usam os mesmos valores:
    0 ou vazio = sem informação, 1 = acessível, 2 = não acessível
"""

import sys
import zipfile
from dataclasses import dataclass
from pathlib import Path

import pandas as pd


@dataclass(frozen=True)
class ResumoCampo:
    arquivo: str
    campo: str
    total: int
    acessiveis: int
    nao_acessiveis: int
    campo_existe: bool

    @property
    def sem_informacao(self) -> int:
        return self.total - self.acessiveis - self.nao_acessiveis

    @property
    def percentual_preenchido(self) -> float:
        if self.total == 0:
            return 0.0
        return 100.0 * (self.acessiveis + self.nao_acessiveis) / self.total


def resumir_campo(arquivo_zip: zipfile.ZipFile, arquivo: str, campo: str) -> ResumoCampo:
    with arquivo_zip.open(arquivo) as conteudo:
        tabela = pd.read_csv(
            conteudo,
            dtype=str,
            keep_default_na=False,
            encoding="utf-8-sig",
            encoding_errors="replace",
        )
    total = len(tabela)
    if campo not in tabela.columns:
        return ResumoCampo(arquivo, campo, total, 0, 0, campo_existe=False)
    valores = tabela[campo].str.strip()
    return ResumoCampo(
        arquivo,
        campo,
        total,
        acessiveis=int((valores == "1").sum()),
        nao_acessiveis=int((valores == "2").sum()),
        campo_existe=True,
    )


def resumir(caminho_gtfs: Path) -> list[ResumoCampo]:
    with zipfile.ZipFile(caminho_gtfs) as arquivo_zip:
        return [
            resumir_campo(arquivo_zip, "stops.txt", "wheelchair_boarding"),
            resumir_campo(arquivo_zip, "trips.txt", "wheelchair_accessible"),
        ]


def main() -> None:
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(1)
    for resumo in resumir(Path(sys.argv[1])):
        print(f"\n{resumo.arquivo} ({resumo.campo})")
        if not resumo.campo_existe:
            print(f"  O campo não existe no arquivo ({resumo.total} linhas).")
            continue
        print(f"  Linhas: {resumo.total}")
        print(f"  Acessíveis: {resumo.acessiveis}")
        print(f"  Não acessíveis: {resumo.nao_acessiveis}")
        print(f"  Sem informação: {resumo.sem_informacao}")
        print(f"  Preenchido: {resumo.percentual_preenchido:.1f}%")


if __name__ == "__main__":
    main()
