from vias_etl.verificar_tabelas import TABELAS_ETL, avaliar, tabelas_fora_do_contrato


def test_lista_segue_o_modelo_combinado():
    assert "UNIDADE_SAUDE" in TABELAS_ETL
    assert "PARADA_TRANSPORTE" in TABELAS_ETL
    assert "TIPO_UNIDADE" not in TABELAS_ETL


def test_no_proprio_usuario_nao_falta_permissao():
    colunas = [("UNIDADE_SAUDE", "ID_UNIDADE", "NUMBER")]
    relatorio = avaliar([], colunas, dono_e_o_proprio_usuario=True)
    assert relatorio["UNIDADE_SAUDE"]["visivel"]
    assert relatorio["UNIDADE_SAUDE"]["faltam"] == []


def test_tabela_de_gravacao_com_todos_os_privilegios_fica_pronta():
    privilegios = [("PARADA_TRANSPORTE", p) for p in ["SELECT", "INSERT", "UPDATE", "DELETE"]]
    colunas = [("PARADA_TRANSPORTE", "ID_PARADA", "NUMBER"), ("PARADA_TRANSPORTE", "LOCALIZACAO", "SDO_GEOMETRY")]
    relatorio = avaliar(privilegios, colunas)
    assert relatorio["PARADA_TRANSPORTE"] == {
        "visivel": True,
        "faltam": [],
        "colunas": ["ID_PARADA (NUMBER)", "LOCALIZACAO (SDO_GEOMETRY)"],
    }


def test_tabela_de_leitura_precisa_so_de_select():
    relatorio = avaliar([("FONTE_DADO", "SELECT")], [("FONTE_DADO", "ID_FONTE", "NUMBER")])
    assert relatorio["FONTE_DADO"]["faltam"] == []


def test_aponta_privilegios_que_faltam():
    relatorio = avaliar([("LINHA_TRANSPORTE", "SELECT")], [("LINHA_TRANSPORTE", "ID_LINHA", "NUMBER")])
    assert relatorio["LINHA_TRANSPORTE"]["faltam"] == ["INSERT", "UPDATE", "DELETE"]


def test_tabela_sem_colunas_visiveis_aparece_como_nao_encontrada():
    relatorio = avaliar([], [])
    assert set(relatorio) == set(TABELAS_ETL)
    assert all(not situacao["visivel"] for situacao in relatorio.values())


def test_lista_tabelas_fora_do_contrato():
    colunas = [
        ("UNIDADE_SAUDE", "ID_UNIDADE", "NUMBER"),
        ("T_VIAS_FLYWAY_HISTORICO", "version", "VARCHAR2"),
    ]
    assert tabelas_fora_do_contrato(colunas) == {"T_VIAS_FLYWAY_HISTORICO": ["version (VARCHAR2)"]}
