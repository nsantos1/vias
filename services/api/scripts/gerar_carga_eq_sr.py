"""
Gera a migracao Flyway V5 com EXAMES e SERVICOS ESPECIALIZADOS do CNES (DATASUS).

Uso (Python 3.10+, com `pip install pyreaddbc dbfread`):
    python scripts/gerar_carga_eq_sr.py <EQSP2610.dbc> <SRSP2610.dbc> <equipam2508.cnv> <S_CLASSEN.dbf>

Arquivos oficiais (ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/):
- Dados/EQ/EQSP2610.dbc    equipamentos por estabelecimento, SP, competencia 10/2026
- Dados/SR/SRSP2610.dbc    servicos especializados por estabelecimento, SP, competencia 10/2026
- Auxiliar/TAB_CNES.zip    -> CNV/equipam2508.cnv (nomes dos equipamentos)
                           -> DBF/S_CLASSEN.dbf   (nomes dos servicos especializados)

Saida: src/main/resources/db/migration/V5__exames_e_servicos_especializados.sql

Regras (documentos de contexto v3/v2):
- So entram as 1.092 unidades que ja estao no banco (CNES lidos da V2).
- Exame = unidade com o EQUIPAMENTO correspondente EM USO (QT_USO > 0). Equipamento
  cadastrado NAO garante exame disponivel, vaga ou agenda: isso vai na descricao.
- Servico especializado = registro no arquivo SR. Nada e inventado: unidade sem
  registro simplesmente nao recebe o vinculo (nao significa "nao oferece").
- Nomes amigaveis sao so rotulos; o nome oficial do CNES fica na descricao e os
  codigos na coluna campo_origem, para auditoria.
"""
import re
import sys
from collections import defaultdict
from pathlib import Path

from dbfread import DBF
from pyreaddbc import dbc2dbf

RAIZ = Path(__file__).resolve().parent.parent
V2 = RAIZ / "src/main/resources/db/migration/V2__carga_cnes_sao_paulo.sql"
SAIDA = RAIZ / "src/main/resources/db/migration/V5__exames_e_servicos_especializados.sql"
COMPETENCIA = "2026-10-01"  # competencia 10/2026 dos arquivos EQ e SR
LOTE = 100
AVISO = "Não garante exame disponível, vaga ou agenda."

# codigo, nome exibido, termos de busca (vao na descricao), codigos de equipamento (TIPEQUIP+CODEQUIP)
EXAMES_EQ = [
    ("EXAME_MAMOGRAFIA", "Mamografia", "mamógrafo", ["0102", "0103", "0117", "0119"]),
    ("EXAME_RAIO_X", "Raio-X (radiografia)", "raio x, radiografia",
     ["0104", "0105", "0106", "0108", "0120", "0121", "0122"]),
    ("EXAME_DENSITOMETRIA", "Densitometria óssea", "raio x para densitometria", ["0109"]),
    ("EXAME_TOMOGRAFIA", "Tomografia computadorizada", "tomógrafo",
     ["0111", "0126", "0127", "0128", "0129", "0130"]),
    ("EXAME_RESSONANCIA", "Ressonância magnética", "ressonância",
     ["0112", "0132", "0133", "0134", "0135"]),
    ("EXAME_ULTRASSONOGRAFIA", "Ultrassonografia", "ultrassom, ecografia, doppler",
     ["0113", "0114", "0115"]),
    ("EXAME_PET_CT", "PET-CT", "PET/CT", ["0118"]),
    ("EXAME_CINTILOGRAFIA", "Cintilografia (medicina nuclear)", "gama câmara", ["0101"]),
    ("EXAME_ENDOSCOPIA", "Endoscopia digestiva", "endoscópio digestivo", ["0333"]),
    ("EXAME_ELETROCARDIOGRAMA", "Eletrocardiograma (ECG)", "eletrocardiógrafo", ["0441"]),
    ("EXAME_ELETROENCEFALOGRAMA", "Eletroencefalograma (EEG)", "eletroencefalógrafo", ["0442"]),
]

# codigo, nome exibido, categoria, codigos SERV_ESP do arquivo SR
SERVICOS_SR = [
    ("EXAME_LABORATORIO", "Exames de laboratório (coleta)", "EXAME", ["144", "145"]),
    ("EXAME_TESTE_PEZINHO", "Teste do pezinho (triagem neonatal)", "EXAME", ["139"]),
    ("ESP_CARDIOLOGIA", "Cardiologia (atenção cardiovascular)", "ESPECIALIDADE", ["116"]),
    ("ESP_OFTALMOLOGIA", "Oftalmologia", "ESPECIALIDADE", ["131"]),
    ("ESP_ONCOLOGIA", "Oncologia", "ESPECIALIDADE", ["132"]),
    ("ESP_PNEUMOLOGIA", "Pneumologia", "ESPECIALIDADE", ["133"]),
    ("ESP_ENDOCRINOLOGIA", "Endocrinologia", "ESPECIALIDADE", ["124"]),
    ("ESP_UROLOGIA", "Urologia", "ESPECIALIDADE", ["169"]),
    ("ESP_NEUROLOGIA", "Neurologia", "ESPECIALIDADE", ["105"]),
    ("ESP_ORTOPEDIA", "Ortopedia e traumatologia", "ESPECIALIDADE", ["155"]),
    ("ESP_NEFROLOGIA", "Doença renal crônica (nefrologia)", "ESPECIALIDADE", ["130"]),
    ("ESP_FISIOTERAPIA", "Fisioterapia", "ESPECIALIDADE", ["126"]),
    ("ESP_REABILITACAO", "Reabilitação", "ESPECIALIDADE", ["135"]),
    ("ESP_SAUDE_MENTAL", "Saúde mental (atenção psicossocial)", "ESPECIALIDADE", ["115"]),
    ("ESP_SAUDE_BUCAL", "Saúde bucal (odontologia)", "ESPECIALIDADE", ["114"]),
    ("ESP_PRE_NATAL", "Pré-natal, parto e nascimento", "ESPECIALIDADE", ["112"]),
    ("ESP_SAUDE_REPRODUTIVA", "Saúde reprodutiva", "ESPECIALIDADE", ["110"]),
    ("ESP_SAUDE_AUDITIVA", "Saúde auditiva", "ESPECIALIDADE", ["107"]),
    ("ESP_CIRURGIA_VASCULAR", "Cirurgia vascular", "ESPECIALIDADE", ["150"]),
    ("ESP_CIRURGIA_TORACICA", "Cirurgia torácica", "ESPECIALIDADE", ["118"]),
    ("ESP_CIRURGIA_REPARADORA", "Cirurgia reparadora", "ESPECIALIDADE", ["117"]),
    ("ESP_OBESIDADE", "Atenção à obesidade", "ESPECIALIDADE", ["127"]),
    ("ESP_IST", "Atenção a IST/DST", "ESPECIALIDADE", ["106"]),
    ("ESP_HANSENIASE", "Hanseníase", "ESPECIALIDADE", ["158"]),
    ("ESP_TUBERCULOSE", "Tuberculose", "ESPECIALIDADE", ["111"]),
    ("ESP_TABAGISMO", "Controle do tabagismo", "ESPECIALIDADE", ["119"]),
    ("ESP_TRANSEXUALIZADOR", "Processo transexualizador", "ESPECIALIDADE", ["153"]),
    ("ESP_PRATICAS_INTEGRATIVAS", "Práticas integrativas e complementares", "ESPECIALIDADE", ["134"]),
    ("ATEND_VACINACAO", "Vacinação (imunização)", "ATENDIMENTO", ["174"]),
    ("ATEND_URGENCIA", "Urgência e emergência", "ATENDIMENTO", ["140"]),
    ("ATEND_ATENCAO_PRIMARIA", "Atenção primária (UBS)", "ATENDIMENTO", ["159"]),
    ("ATEND_DOMICILIAR", "Atenção domiciliar", "ATENDIMENTO", ["113"]),
    ("ATEND_VIOLENCIA_SEXUAL", "Atendimento a pessoas em situação de violência sexual", "ATENDIMENTO", ["165"]),
]


def q(texto):
    return "'" + str(texto).replace("'", "''") + "'"


def lotes(itens):
    for i in range(0, len(itens), LOTE):
        yield itens[i:i + LOTE]


def ler_dbc(caminho):
    dbf = Path(caminho).with_suffix(".dbf")
    if not dbf.exists():
        dbc2dbf(str(caminho), str(dbf))
    return DBF(str(dbf), encoding="iso-8859-1")


def nomes_equipamentos(cnv):
    nomes = {}
    for linha in Path(cnv).read_text(encoding="latin-1").splitlines():
        m = re.match(r"\s*\d+\s+(\d{4})-(.+?)\s+(\d{4})\s*$", linha)
        if m:
            nomes[m.group(1)] = m.group(2).strip()
    return nomes


def nomes_servicos(dbf):
    nomes = {}
    for r in DBF(str(dbf), encoding="iso-8859-1"):
        m = re.match(r"(\d{3})\s+(.+?)\s*/", r["DS_REGRA"])
        if m:
            nomes.setdefault(m.group(1), m.group(2).strip())
    return nomes


def main(eq_dbc, sr_dbc, cnv, classen):
    cnes_banco = set(re.findall(r"SELECT '(\d{7})'", V2.read_text(encoding="utf-8")))
    assert len(cnes_banco) == 1092, f"esperava 1092 CNES na V2, li {len(cnes_banco)}"
    nomes_eq = nomes_equipamentos(cnv)
    nomes_sr = nomes_servicos(classen)

    eq_por_unidade = defaultdict(set)  # cnes -> codigos de equipamento em uso
    for r in ler_dbc(eq_dbc):
        if r["CNES"] in cnes_banco and (r["QT_USO"] or 0) > 0:
            eq_por_unidade[r["CNES"]].add(f"{r['TIPEQUIP']}{r['CODEQUIP']}")
    sr_por_unidade = defaultdict(set)  # cnes -> SERV_ESP
    for r in ler_dbc(sr_dbc):
        if r["CNES"] in cnes_banco:
            sr_por_unidade[r["CNES"]].add(r["SERV_ESP"])

    catalogo = []  # (codigo, nome, descricao, campo_origem, categoria, sigla_fonte)
    vinculos = []  # (cnes, codigo, sigla_fonte)
    for codigo, nome, termos, equips in EXAMES_EQ:
        oficiais = ", ".join(nomes_eq[e] for e in equips)
        descricao = f"Unidade com equipamento em uso no CNES ({termos}). {AVISO}"
        catalogo.append((codigo, nome, descricao, "CNES EQ " + ",".join(equips), "EXAME", "CNES_EQ"))
        assert len(descricao) <= 300 and oficiais
        for cnes, tem in eq_por_unidade.items():
            if tem & set(equips):
                vinculos.append((cnes, codigo, "CNES_EQ"))
    for codigo, nome, categoria, servs in SERVICOS_SR:
        oficiais = "; ".join(nomes_sr[s].capitalize() for s in servs)
        aviso = AVISO if categoria == "EXAME" else "Não garante vaga, agenda ou atendimento hoje."
        descricao = f"Serviço especializado registrado no CNES: {oficiais}. {aviso}"
        assert len(descricao) <= 300, codigo
        catalogo.append((codigo, nome, descricao, "CNES SR " + ",".join(servs), categoria, "CNES_SR"))
        for cnes, tem in sr_por_unidade.items():
            if tem & set(servs):
                vinculos.append((cnes, codigo, "CNES_SR"))

    # so entra no catalogo o que tem pelo menos uma unidade
    com_unidade = {c for _, c, _ in vinculos}
    catalogo = [s for s in catalogo if s[0] in com_unidade]
    vinculos.sort()

    sql = [
        "-- =====================================================================",
        "-- VIAS - V5: exames e servicos especializados do CNES (DATASUS)",
        "-- Gerada por scripts/gerar_carga_eq_sr.py (nao editar a mao).",
        "-- Fontes: EQSP2610.dbc (equipamentos) e SRSP2610.dbc (servicos especializados),",
        "--   ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/{EQ,SR}, competencia 10/2026.",
        "-- Exame = equipamento EM USO (QT_USO > 0). Nada disso garante exame, vaga ou agenda.",
        f"-- Itens no catalogo: {len(catalogo)} | vinculos unidade x item: {len(vinculos)}",
        "-- Nao destrutiva: so ADD COLUMN, INSERT e CHECK novo.",
        "-- =====================================================================",
        "",
        "ALTER TABLE SERVICO_SAUDE ADD (categoria VARCHAR2(15) DEFAULT 'ATENDIMENTO' NOT NULL);",
        "ALTER TABLE SERVICO_SAUDE ADD CONSTRAINT ck_servico_categoria",
        "  CHECK (categoria IN ('EXAME','ESPECIALIDADE','ATENDIMENTO'));",
        "",
        "INSERT INTO FONTE_DADO (sigla, nome, url, oficial)",
        "VALUES ('CNES_EQ', 'CNES - Equipamentos por estabelecimento (DATASUS, competência 10/2026)',",
        "  'ftp://ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/EQ/', 'S');",
        "INSERT INTO FONTE_DADO (sigla, nome, url, oficial)",
        "VALUES ('CNES_SR', 'CNES - Serviços especializados por estabelecimento (DATASUS, competência 10/2026)',",
        "  'ftp://ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/SR/', 'S');",
        "",
    ]
    for codigo, nome, descricao, origem, categoria, fonte in catalogo:
        sql.append(
            "INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) "
            f"SELECT {q(codigo)}, {q(nome)}, {q(descricao)}, {q(origem)}, {q(categoria)}, id_fonte "
            f"FROM FONTE_DADO WHERE sigla = {q(fonte)};"
        )
    sql.append(f"\n-- Vinculos unidade x item: {len(vinculos)}")
    for lote in lotes(vinculos):
        linhas = "\n  UNION ALL ".join(
            f"SELECT '{c}' cnes, '{s}' cod, '{f}' fonte FROM dual" for c, s, f in lote
        )
        sql.append(
            "INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)\n"
            f"SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '{COMPETENCIA}'\n"
            "FROM (\n  " + linhas + "\n) x\n"
            "JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes\n"
            "JOIN SERVICO_SAUDE s ON s.codigo = x.cod\n"
            "JOIN FONTE_DADO f ON f.sigla = x.fonte;"
        )

    SAIDA.write_text("\n".join(sql) + "\n", encoding="utf-8", newline="\n")
    print(f"{SAIDA.name}: {len(catalogo)} itens, {len(vinculos)} vinculos")
    for codigo, nome, _, _, categoria, _ in catalogo:
        n = sum(1 for _, c, _ in vinculos if c == codigo)
        print(f"  {categoria:13s} {nome:55s} {n:4d} unidades")


if __name__ == "__main__":
    main(*sys.argv[1:5])
