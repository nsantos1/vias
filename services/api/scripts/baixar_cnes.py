"""
Baixa um recorte REAL do CNES (API de Dados Abertos do Ministerio da Saude - DEMAS)
e salva o JSON bruto com a data/hora da consulta, para rastrear a proveniencia.

Uso:  python scripts/baixar_cnes.py
Saida: scripts/dados/cnes_sao_paulo_<data>.json

Recorte: municipio de Sao Paulo (codigo 355030) e os tipos de unidade
  2  = Centro de saude / Unidade basica (UBS)
  4  = Policlinica
  5  = Hospital geral
  73 = Pronto atendimento (UPA / AMA 24h / PA)
"""
import json
import time
import urllib.request
from datetime import datetime, timezone
from pathlib import Path

BASE = "https://apidadosabertos.saude.gov.br/cnes"
MUNICIPIO = 355030
TIPOS = [2, 4, 5, 73]
PAGINA = 20


def get(url: str):
    for tentativa in range(4):
        try:
            with urllib.request.urlopen(url, timeout=60) as r:
                return json.load(r)
        except Exception as e:  # rede instavel: tenta de novo
            if tentativa == 3:
                raise
            time.sleep(2 * (tentativa + 1))


def main():
    consultado_em = datetime.now(timezone.utc).isoformat(timespec="seconds")
    tipos = {t["codigo_tipo_unidade"]: t["descricao_tipo_unidade"]
             for t in get(f"{BASE}/tipounidades")["tipos_unidade"]}

    estabelecimentos = []
    for tipo in TIPOS:
        offset = 0
        while True:
            url = (f"{BASE}/estabelecimentos?codigo_municipio={MUNICIPIO}"
                   f"&codigo_tipo_unidade={tipo}&limit={PAGINA}&offset={offset}")
            lote = get(url)["estabelecimentos"]
            if not lote:
                break
            for e in lote:
                e.pop("endereco_email_estabelecimento", None)  # contato nao usado pelo VIAS: nao guardar
            estabelecimentos.extend(lote)
            offset += 1  # na API DEMAS, offset e o numero da pagina
        print(f"tipo {tipo}: {sum(1 for e in estabelecimentos if e['codigo_tipo_unidade'] == tipo)} registros")

    saida = Path(__file__).parent / "dados" / f"cnes_sao_paulo_{consultado_em[:10]}.json"
    saida.parent.mkdir(exist_ok=True)
    saida.write_text(json.dumps({
        "fonte": "API de Dados Abertos do Ministerio da Saude (DEMAS) - CNES Estabelecimentos",
        "url": f"{BASE}/estabelecimentos",
        "filtros": {"codigo_municipio": MUNICIPIO, "codigo_tipo_unidade": TIPOS},
        "consultado_em": consultado_em,
        "tipos_unidade": tipos,
        "estabelecimentos": estabelecimentos,
    }, ensure_ascii=False, indent=1), encoding="utf-8")
    print(f"{len(estabelecimentos)} estabelecimentos salvos em {saida}")


if __name__ == "__main__":
    main()
