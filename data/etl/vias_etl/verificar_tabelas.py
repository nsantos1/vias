"""Confere o acesso do seu usuário às tabelas que o Raphael criou e mostra as colunas reais.

Uso, a partir de data/etl:
    python -m vias_etl.verificar_tabelas

Precisa de ORACLE_ESQUEMA_TABELAS no .env: o usuário da FIAP dono das tabelas (o do Raphael).
"""

import sys
from collections import defaultdict

import oracledb

from .config import ConfiguracaoAusente, exigir
from .db import conectar

# Tabelas do modelo combinado ("Contrato de dados do ETL": V1 a V6 do Raphael + V7)
# e as permissões que o ETL precisa em cada uma (concedidas pela V7).
LEITURA = ["SELECT"]
GRAVACAO = ["SELECT", "INSERT", "UPDATE", "DELETE"]
PRIVILEGIOS_POR_TABELA = {
    "FONTE_DADO": LEITURA,
    "REGIAO": LEITURA,
    "UNIDADE_SAUDE": GRAVACAO,
    "SERVICO_SAUDE": GRAVACAO,
    "UNIDADE_SERVICO": GRAVACAO,
    "LINHA_TRANSPORTE": GRAVACAO,
    "PARADA_TRANSPORTE": GRAVACAO,
    "LINHA_INTERVALO": GRAVACAO,
    "PREVISAO_HISTORICO": GRAVACAO,
}
TABELAS_ETL = list(PRIVILEGIOS_POR_TABELA)

CONSULTA_PRIVILEGIOS = """
SELECT table_name, privilege FROM user_tab_privs_recd WHERE owner = :dono
"""
CONSULTA_COLUNAS = """
SELECT table_name, column_name, data_type
FROM all_tab_columns
WHERE owner = :dono
ORDER BY table_name, column_id
"""
CONSULTA_ESPACIAL = """
SELECT table_name, column_name FROM all_sdo_geom_metadata WHERE owner = :dono
"""


def avaliar(
    privilegios: list[tuple[str, str]],
    colunas: list[tuple[str, str, str]],
    dono_e_o_proprio_usuario: bool = False,
) -> dict[str, dict]:
    """Junta privilégios e colunas por tabela do contrato.

    O dono de uma tabela tem todas as permissões sobre ela, mas o Oracle não as lista em
    user_tab_privs_recd; por isso, quando o dono é o próprio usuário, nada falta.
    """
    privilegios_por_tabela: dict[str, set[str]] = defaultdict(set)
    for tabela, privilegio in privilegios:
        privilegios_por_tabela[tabela].add(privilegio)

    colunas_por_tabela: dict[str, list[str]] = defaultdict(list)
    for tabela, coluna, tipo in colunas:
        colunas_por_tabela[tabela].append(f"{coluna} ({tipo})")

    relatorio = {}
    for tabela in TABELAS_ETL:
        recebidos = privilegios_por_tabela.get(tabela, set())
        necessarios = PRIVILEGIOS_POR_TABELA[tabela]
        faltam = [] if dono_e_o_proprio_usuario else [p for p in necessarios if p not in recebidos]
        relatorio[tabela] = {
            "visivel": tabela in colunas_por_tabela,
            "faltam": faltam,
            "colunas": colunas_por_tabela.get(tabela, []),
        }
    return relatorio


def tabelas_fora_do_contrato(colunas: list[tuple[str, str, str]]) -> dict[str, list[str]]:
    """Tabelas visíveis no dono que não estão no contrato (outros nomes ou outro modelo)."""
    extras: dict[str, list[str]] = defaultdict(list)
    for tabela, coluna, tipo in colunas:
        if tabela not in TABELAS_ETL:
            extras[tabela].append(f"{coluna} ({tipo})")
    return dict(extras)


def main() -> None:
    try:
        dono = exigir("ORACLE_ESQUEMA_TABELAS").upper()
        with conectar() as conexao, conexao.cursor() as cursor:
            usuario = conexao.username.upper()
            cursor.execute(CONSULTA_PRIVILEGIOS, dono=dono)
            privilegios = cursor.fetchall()
            cursor.execute(CONSULTA_COLUNAS, dono=dono)
            colunas = cursor.fetchall()
            cursor.execute(CONSULTA_ESPACIAL, dono=dono)
            espaciais = cursor.fetchall()
    except ConfiguracaoAusente as erro:
        sys.exit(str(erro))
    except oracledb.Error as erro:
        sys.exit(f"O Oracle recusou a consulta: {erro}")

    print(f"Conectado como {usuario}. Dono das tabelas no .env: {dono}.")
    if dono == usuario:
        print(
            "Atenção: o dono configurado é o seu próprio usuário. Para o ETL, o "
            "ORACLE_ESQUEMA_TABELAS deve ser o usuário do Raphael."
        )

    relatorio = avaliar(privilegios, colunas, dono_e_o_proprio_usuario=(dono == usuario))
    prontas = 0
    for tabela, situacao in relatorio.items():
        if not situacao["visivel"]:
            print(f"\n✗ {dono}.{tabela}: não encontrada (não existe ou você não tem acesso)")
            continue
        if situacao["faltam"]:
            print(f"\n✗ {dono}.{tabela}: falta {', '.join(situacao['faltam'])}")
        else:
            prontas += 1
            print(f"\n✓ {dono}.{tabela}: acesso completo")
        print("    " + ", ".join(situacao["colunas"]))

    extras = tabelas_fora_do_contrato(colunas)
    if extras:
        print(f"\nOutras tabelas visíveis em {dono} (fora do contrato):")
        for tabela, cols in sorted(extras.items()):
            print(f"  {tabela}: " + ", ".join(cols))

    print(f"\nTabelas prontas para o ETL: {prontas} de {len(TABELAS_ETL)}")
    if espaciais:
        print("Metadados espaciais: " + ", ".join(f"{t}.{c}" for t, c in espaciais))
    else:
        print("Metadados espaciais: nenhum encontrado (a busca por raio precisa deles)")


if __name__ == "__main__":
    main()
