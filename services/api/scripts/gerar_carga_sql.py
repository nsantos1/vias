"""
Gera a migracao Flyway com a carga REAL do CNES a partir do JSON baixado por baixar_cnes.py.

Uso:  python scripts/gerar_carga_sql.py scripts/dados/cnes_sao_paulo_AAAA-MM-DD.json
Saida: src/main/resources/db/migration/V2__carga_cnes_sao_paulo.sql

Regras (documento de contexto do back-end v3):
- So entram estabelecimentos ATIVOS (sem motivo de desabilitacao no CNES).
- Nada e inventado: campo ausente na origem vira NULL ou NAO_INFORMADO.
- Acessibilidade fica NAO_INFORMADO: o CNES nao publica acessibilidade fisica neste recurso.
- Servicos = indicadores publicados pelo CNES por estabelecimento. Indicador 0 ou vazio
  NAO gera vinculo e NAO e lido como "nao oferece": so nao ha registro.
- Regiao = bairro informado no cadastro CNES (granularidade provisoria).
"""
import json
import sys
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent
SAIDA = RAIZ / "src/main/resources/db/migration/V2__carga_cnes_sao_paulo.sql"
LOTE = 100

SERVICOS = [
    ("ATENDIMENTO_AMBULATORIAL", "Atendimento ambulatorial",
     "Indicador de atendimento ambulatorial publicado no cadastro CNES.",
     "estabelecimento_possui_atendimento_ambulatorial"),
    ("ATENDIMENTO_HOSPITALAR", "Atendimento hospitalar (internacao)",
     "Indicador de atendimento hospitalar publicado no cadastro CNES.",
     "estabelecimento_possui_atendimento_hospitalar"),
    ("CENTRO_CIRURGICO", "Centro cirurgico",
     "Indicador de centro cirurgico publicado no cadastro CNES.",
     "estabelecimento_possui_centro_cirurgico"),
    ("CENTRO_OBSTETRICO", "Centro obstetrico (parto)",
     "Indicador de centro obstetrico publicado no cadastro CNES.",
     "estabelecimento_possui_centro_obstetrico"),
    ("CENTRO_NEONATAL", "Unidade neonatal",
     "Indicador de centro neonatal publicado no cadastro CNES.",
     "estabelecimento_possui_centro_neonatal"),
    ("SERVICO_APOIO", "Servico de apoio",
     "Indicador 'possui servico de apoio' publicado no cadastro CNES. Nao indica exames disponiveis.",
     "estabelecimento_possui_servico_apoio"),
]


def q(v):
    """Literal SQL: NULL ou texto com aspas escapadas."""
    if v is None:
        return "NULL"
    s = str(v).strip()
    return "NULL" if s == "" else "'" + s.replace("'", "''") + "'"


def num(v):
    return "NULL" if v is None else repr(float(v))


def data(v):
    return "NULL" if not v else f"DATE '{v[:10]}'"


def sus(v):
    return {"SIM": "'SIM'", "NAO": "'NAO'"}.get((v or "").strip().upper(), "'NAO_INFORMADO'")


def lotes(itens):
    for i in range(0, len(itens), LOTE):
        yield itens[i:i + LOTE]


def main(arquivo):
    bruto = json.loads(Path(arquivo).read_text(encoding="utf-8"))
    tipos = {int(k): v for k, v in bruto["tipos_unidade"].items()}
    ativos = [e for e in bruto["estabelecimentos"] if not e["codigo_motivo_desabilitacao_estabelecimento"]]
    ativos.sort(key=lambda e: e["codigo_cnes"])
    consultado = bruto["consultado_em"]

    sql = [f"""-- =====================================================================
-- VIAS - carga REAL do CNES (gerada por scripts/gerar_carga_sql.py, nao editar a mao)
-- Fonte: {bruto['fonte']}
-- Recurso: {bruto['url']}
-- Filtros: municipio {bruto['filtros']['codigo_municipio']}, tipos de unidade {bruto['filtros']['codigo_tipo_unidade']}
-- Consultado em: {consultado} (UTC)
-- Estabelecimentos ativos carregados: {len(ativos)}
-- Acessibilidade = NAO_INFORMADO (a fonte nao publica acessibilidade fisica).
-- =====================================================================

INSERT INTO FONTE_DADO (sigla, nome, url, oficial)
VALUES ('CNES_DEMAS', 'CNES - API de Dados Abertos do Ministerio da Saude (DEMAS)', '{bruto['url']}', 'S');
INSERT INTO FONTE_DADO (sigla, nome, url, oficial)
VALUES ('CADASTRO_MANUAL', 'Cadastro manual pela API VIAS', NULL, 'N');
"""]

    # Catalogo de servicos
    for codigo, nome, desc, campo in SERVICOS:
        sql.append(f"INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, id_fonte) "
                   f"SELECT {q(codigo)}, {q(nome)}, {q(desc)}, {q(campo)}, id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_DEMAS';")

    # Regioes (bairros do cadastro)
    bairros = sorted({e["bairro_estabelecimento"].strip() for e in ativos if (e["bairro_estabelecimento"] or "").strip()})
    sql.append(f"\n-- Regioes: {len(bairros)} bairros informados no CNES")
    for lote in lotes(bairros):
        sql.append("INSERT INTO REGIAO (nome, tipo_regiao, codigo_municipio, uf, id_fonte)\n"
                   "SELECT b.nome, 'BAIRRO', '355030', 'SP', f.id_fonte\n"
                   f"FROM (SELECT {q(lote[0])} AS nome FROM dual\n"
                   + "".join(f"UNION ALL SELECT {q(x)} FROM dual\n" for x in lote[1:])
                   + ") b CROSS JOIN FONTE_DADO f WHERE f.sigla = 'CNES_DEMAS';")

    # Unidades
    sql.append(f"\n-- Unidades de saude: {len(ativos)} estabelecimentos ativos")
    for lote in lotes(ativos):
        selects = []
        for e in lote:
            selects.append(
                "SELECT "
                f"{q(str(e['codigo_cnes']).zfill(7))} cnes, {q(e['nome_fantasia'])} nome, {q(e['nome_razao_social'])} razao, "
                f"{e['codigo_tipo_unidade']} cod_tipo, {q(tipos.get(e['codigo_tipo_unidade']))} tipo, "
                f"{q(e['endereco_estabelecimento'])} logradouro, {q(e['numero_estabelecimento'])} numero, "
                f"{q(e['bairro_estabelecimento'])} bairro, {q(e['codigo_cep_estabelecimento'])} cep, "
                f"{q(e['codigo_municipio'])} municipio, 'SP' uf, {q(e['numero_telefone_estabelecimento'])} telefone, "
                f"{num(e['latitude_estabelecimento_decimo_grau'])} lat, {num(e['longitude_estabelecimento_decimo_grau'])} lon, "
                f"{q(e['descricao_turno_atendimento'])} horario, {sus(e['estabelecimento_faz_atendimento_ambulatorial_sus'])} sus, "
                f"{data(e['data_atualizacao'])} data_ref FROM dual")
        sql.append(
            "INSERT INTO UNIDADE_SAUDE (codigo_cnes, nome, razao_social, codigo_tipo_unidade, tipo_unidade, logradouro, numero,\n"
            "  bairro, cep, codigo_municipio, uf, telefone, latitude, longitude, horario_funcionamento, atende_sus,\n"
            "  status_acessibilidade, id_fonte, data_referencia_fonte)\n"
            "SELECT x.cnes, x.nome, x.razao, x.cod_tipo, x.tipo, x.logradouro, x.numero, x.bairro, x.cep, x.municipio, x.uf,\n"
            "  x.telefone, x.lat, x.lon, x.horario, x.sus, 'NAO_INFORMADO', f.id_fonte, x.data_ref\n"
            "FROM (\n  " + "\n  UNION ALL ".join(selects) + "\n) x CROSS JOIN FONTE_DADO f WHERE f.sigla = 'CNES_DEMAS';")

    sql.append("\n-- Regiao de cada unidade = bairro do cadastro CNES\n"
               "UPDATE UNIDADE_SAUDE u SET id_regiao = (SELECT r.id_regiao FROM REGIAO r\n"
               "  WHERE r.nome = u.bairro AND r.tipo_regiao = 'BAIRRO' AND r.codigo_municipio = u.codigo_municipio);")

    # Vinculos unidade x servico (somente indicador = 1)
    vinculos = [(str(e["codigo_cnes"]).zfill(7), codigo)
                for e in ativos for codigo, _, _, campo in SERVICOS if e.get(campo) == 1]
    sql.append(f"\n-- Vinculos unidade x servico: {len(vinculos)} (somente indicadores = 1 no CNES)")
    for lote in lotes(vinculos):
        linhas = "\n  UNION ALL ".join(f"SELECT '{c}' cnes, '{s}' cod FROM dual" for c, s in lote)
        sql.append(
            "INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)\n"
            "SELECT u.id_unidade, s.id_servico, u.id_fonte, u.data_referencia_fonte\n"
            "FROM (\n  " + linhas + "\n) x\n"
            "JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes\n"
            "JOIN SERVICO_SAUDE s ON s.codigo = x.cod;")

    SAIDA.write_text("\n".join(sql) + "\n", encoding="utf-8", newline="\n")
    print(f"{SAIDA.name}: {len(ativos)} unidades, {len(bairros)} regioes, {len(vinculos)} vinculos")


if __name__ == "__main__":
    main(sys.argv[1])
