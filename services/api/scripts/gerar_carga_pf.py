"""
Gera a migracao Flyway V6 com ESPECIALIDADES a partir dos PROFISSIONAIS do CNES.

Uso (Python 3.10+, com `pip install pyreaddbc dbfread`):
    python scripts/gerar_carga_pf.py <PFSP2610.dbc> <CBO.dbf>

Arquivos oficiais (ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/):
- Dados/PF/PFSP2610.dbc   profissionais por estabelecimento, SP, competencia 10/2026
- Auxiliar/TAB_CNES.zip   -> DBF/CBO.dbf (nomes das ocupacoes/especialidades)

Saida: src/main/resources/db/migration/V6__especialidades_dos_profissionais.sql

PRIVACIDADE: o arquivo PF tem dados pessoais (nome, CPF, CNS dos profissionais).
Este script le SOMENTE tres colunas: CNES, CBO e HORA_AMB. Nenhum dado pessoal
e impresso, gravado ou levado para o banco.

Regras:
- So entram as 1.092 unidades que ja estao no banco (CNES lidos da V2).
- A unidade recebe a especialidade se houver profissional com aquela CBO e carga
  horaria AMBULATORIAL (HORA_AMB > 0), ou seja, que atende em consulta.
- Profissional vinculado NAO garante consulta, vaga ou agenda: vai na descricao.
- Especialidades que ja existem na V5 (vindas do arquivo SR) nao sao duplicadas:
  ganham os vinculos novos e a descricao passa a citar as duas origens.
"""
import re
import sys
from collections import defaultdict
from pathlib import Path

from dbfread import DBF
from pyreaddbc import dbc2dbf

RAIZ = Path(__file__).resolve().parent.parent
V2 = RAIZ / "src/main/resources/db/migration/V2__carga_cnes_sao_paulo.sql"
SAIDA = RAIZ / "src/main/resources/db/migration/V6__especialidades_dos_profissionais.sql"
COMPETENCIA = "2026-10-01"
LOTE = 100
AVISO = "Não garante consulta, vaga ou agenda."

# Itens NOVOS: codigo, nome exibido, CBOs
NOVAS = [
    ("ESP_CLINICA_MEDICA", "Clínica médica (clínico geral)", ["225125", "225170"]),
    ("ESP_MEDICINA_FAMILIA", "Medicina de família", ["225142", "225130"]),
    ("ESP_PEDIATRIA", "Pediatria", ["225124"]),
    ("ESP_GINECOLOGIA", "Ginecologia e obstetrícia", ["225250"]),
    ("ESP_PSIQUIATRIA", "Psiquiatria", ["225133"]),
    ("ESP_DERMATOLOGIA", "Dermatologia", ["225135"]),
    ("ESP_OTORRINO", "Otorrinolaringologia", ["225275"]),
    ("ESP_GASTRO", "Gastroenterologia", ["225165"]),
    ("ESP_INFECTOLOGIA", "Infectologia", ["225103"]),
    ("ESP_GERIATRIA", "Geriatria", ["225180"]),
    ("ESP_REUMATOLOGIA", "Reumatologia", ["225136"]),
    ("ESP_HEMATOLOGIA", "Hematologia", ["225185"]),
    ("ESP_MASTOLOGIA", "Mastologia", ["225255"]),
    ("ESP_COLOPROCTOLOGIA", "Coloproctologia", ["225280"]),
    ("ESP_ANGIOLOGIA", "Angiologia", ["225115"]),
    ("ESP_ALERGIA", "Alergia e imunologia", ["225110"]),
    ("ESP_CIRURGIA_GERAL", "Cirurgia geral", ["225225"]),
    ("ESP_CIRURGIA_PLASTICA", "Cirurgia plástica", ["225235"]),
    ("ESP_NEUROCIRURGIA", "Neurocirurgia", ["225260"]),
    ("ESP_CIRURGIA_PEDIATRICA", "Cirurgia pediátrica", ["225230"]),
    ("ESP_CABECA_PESCOCO", "Cirurgia de cabeça e pescoço", ["225215"]),
    ("ESP_APARELHO_DIGESTIVO", "Cirurgia do aparelho digestivo", ["225220"]),
    ("ESP_CIRURGIA_CARDIO", "Cirurgia cardiovascular", ["225210"]),
    ("ESP_FISIATRIA", "Fisiatria", ["225160"]),
    ("ESP_ACUPUNTURA", "Acupuntura", ["225105"]),
    ("ESP_HOMEOPATIA", "Homeopatia", ["225195"]),
    ("ESP_NUTROLOGIA", "Nutrologia", ["225118"]),
    ("ESP_GENETICA", "Genética médica", ["225175"]),
    ("ESP_MEDICINA_TRABALHO", "Medicina do trabalho", ["225140"]),
    ("ESP_PSICOLOGIA", "Psicologia", ["251510"]),
    ("ESP_NUTRICAO", "Nutrição", ["223710"]),
    ("ESP_FONOAUDIOLOGIA", "Fonoaudiologia", ["223810"]),
    ("ESP_TERAPIA_OCUPACIONAL", "Terapia ocupacional", ["223905"]),
]

# Itens que JA EXISTEM na V5 (vindos do SR): codigo, CBOs a somar, SERV_ESP de origem
EXISTENTES = [
    ("ESP_CARDIOLOGIA", ["225120"], "116"),
    ("ESP_OFTALMOLOGIA", ["225265"], "131"),
    ("ESP_ONCOLOGIA", ["225121", "225290"], "132"),
    ("ESP_PNEUMOLOGIA", ["225127"], "133"),
    ("ESP_ENDOCRINOLOGIA", ["225155"], "124"),
    ("ESP_UROLOGIA", ["225285"], "169"),
    ("ESP_NEUROLOGIA", ["225112"], "105"),
    ("ESP_ORTOPEDIA", ["225270"], "155"),
    ("ESP_NEFROLOGIA", ["225109"], "130"),
    ("ESP_FISIOTERAPIA", ["223605"], "126"),
    ("ESP_SAUDE_BUCAL", ["223208", "223293"], "114"),
    ("ESP_CIRURGIA_VASCULAR", ["225203"], "150"),
    ("ESP_CIRURGIA_TORACICA", ["225240"], "118"),
]


def q(texto):
    return "'" + str(texto).replace("'", "''") + "'"


def bytes_ok(texto, limite):
    assert len(texto.encode("utf-8")) <= limite, (texto, limite)
    return texto


def main(pf_dbc, cbo_dbf):
    cnes_banco = set(re.findall(r"SELECT '(\d{7})'", V2.read_text(encoding="utf-8")))
    assert len(cnes_banco) == 1092, f"esperava 1092 CNES na V2, li {len(cnes_banco)}"
    nomes_cbo = {str(r["CBO"]).strip(): str(r["DS_CBO"]).strip() for r in DBF(str(cbo_dbf), encoding="iso-8859-1")}

    pf_dbf = Path(pf_dbc).with_suffix(".dbf")
    if not pf_dbf.exists():
        dbc2dbf(str(pf_dbc), str(pf_dbf))
    cbo_por_unidade = defaultdict(set)
    # Le so CNES, CBO e HORA_AMB (dados pessoais do arquivo sao ignorados)
    for r in DBF(str(pf_dbf), encoding="iso-8859-1"):
        if r["CNES"] in cnes_banco and (r["HORA_AMB"] or 0) > 0:
            cbo_por_unidade[r["CNES"]].add(str(r["CBO"]).strip())

    def unidades_com(cbos):
        return sorted(c for c, tem in cbo_por_unidade.items() if tem & set(cbos))

    novos, atualizados, vinculos = [], [], []
    for codigo, nome, cbos in NOVAS:
        unidades = unidades_com(cbos)
        if not unidades:
            continue
        oficiais = "; ".join(nomes_cbo[c] for c in cbos)
        descricao = bytes_ok(f"Profissional com esta especialidade vinculado à unidade no CNES ({oficiais}). {AVISO}", 300)
        novos.append((codigo, bytes_ok(nome, 100), descricao, bytes_ok("CNES PF CBO " + ",".join(cbos), 80)))
        vinculos += [(c, codigo) for c in unidades]
    for codigo, cbos, serv in EXISTENTES:
        unidades = unidades_com(cbos)
        oficiais = "; ".join(nomes_cbo[c] for c in cbos)
        descricao = bytes_ok(
            "Serviço especializado registrado no CNES ou profissional com esta especialidade "
            f"vinculado à unidade ({oficiais}). {AVISO}", 300)
        atualizados.append((codigo, descricao, bytes_ok(f"CNES SR {serv}; PF CBO " + ",".join(cbos), 80)))
        vinculos += [(c, codigo) for c in unidades]
    vinculos = sorted(set(vinculos))

    sql = [
        "-- =====================================================================",
        "-- VIAS - V6: especialidades a partir dos profissionais do CNES (DATASUS)",
        "-- Gerada por scripts/gerar_carga_pf.py (nao editar a mao).",
        "-- Fonte: PFSP2610.dbc, ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/PF,",
        "--   competencia 10/2026. Lidas so as colunas CNES, CBO e HORA_AMB: nenhum dado pessoal.",
        "-- Regra: profissional com a CBO e carga horaria ambulatorial (HORA_AMB > 0).",
        f"-- Itens novos: {len(novos)} | itens da V5 ampliados: {len(atualizados)} | vinculos: {len(vinculos)}",
        "-- Nao destrutiva: INSERT, UPDATE de descricao e vinculos so onde ainda nao existem.",
        "-- =====================================================================",
        "",
        "INSERT INTO FONTE_DADO (sigla, nome, url, oficial)",
        "VALUES ('CNES_PF', 'CNES - Profissionais por estabelecimento (DATASUS, competência 10/2026)',",
        "  'ftp://ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/PF/', 'S');",
        "",
    ]
    for codigo, nome, descricao, origem in novos:
        sql.append(
            "INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) "
            f"SELECT {q(codigo)}, {q(nome)}, {q(descricao)}, {q(origem)}, 'ESPECIALIDADE', id_fonte "
            "FROM FONTE_DADO WHERE sigla = 'CNES_PF';"
        )
    sql.append("")
    for codigo, descricao, origem in atualizados:
        sql.append(f"UPDATE SERVICO_SAUDE SET descricao = {q(descricao)}, campo_origem = {q(origem)} WHERE codigo = {q(codigo)};")
    sql.append(f"\n-- Vinculos unidade x especialidade: {len(vinculos)} (pula o que a V5 ja criou)")
    for i in range(0, len(vinculos), LOTE):
        linhas = "\n  UNION ALL ".join(f"SELECT '{c}' cnes, '{s}' cod FROM dual" for c, s in vinculos[i:i + LOTE])
        sql.append(
            "INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)\n"
            f"SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '{COMPETENCIA}'\n"
            "FROM (\n  " + linhas + "\n) x\n"
            "JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes\n"
            "JOIN SERVICO_SAUDE s ON s.codigo = x.cod\n"
            "CROSS JOIN FONTE_DADO f\n"
            "WHERE f.sigla = 'CNES_PF'\n"
            "  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e\n"
            "                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);"
        )

    SAIDA.write_text("\n".join(sql) + "\n", encoding="utf-8", newline="\n")
    print(f"{SAIDA.name}: {len(novos)} novos, {len(atualizados)} ampliados, {len(vinculos)} vinculos")
    contagem = defaultdict(int)
    for _, codigo in vinculos:
        contagem[codigo] += 1
    for codigo, nome, _, _ in novos:
        print(f"  novo      {nome:40s} {contagem[codigo]:4d} unidades")
    for codigo, _, _ in atualizados:
        print(f"  ampliado  {codigo:40s} +{contagem[codigo]:3d} vinculos (antes de tirar repetidos)")


if __name__ == "__main__":
    main(*sys.argv[1:3])
