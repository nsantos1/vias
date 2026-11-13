import zipfile

from vias_etl.gtfs.acessibilidade import resumir


def criar_gtfs(caminho, stops, trips):
    with zipfile.ZipFile(caminho, "w") as arquivo_zip:
        arquivo_zip.writestr("stops.txt", stops)
        arquivo_zip.writestr("trips.txt", trips)
    return caminho


def test_conta_acessiveis_nao_acessiveis_e_sem_informacao(tmp_path):
    gtfs = criar_gtfs(
        tmp_path / "gtfs.zip",
        stops="stop_id,stop_name,wheelchair_boarding\n1,A,1\n2,B,2\n3,C,0\n4,D,\n",
        trips="route_id,trip_id,wheelchair_accessible\nr1,t1,1\nr1,t2,1\n",
    )
    paradas, viagens = resumir(gtfs)

    assert (paradas.total, paradas.acessiveis, paradas.nao_acessiveis) == (4, 1, 1)
    assert paradas.sem_informacao == 2
    assert paradas.percentual_preenchido == 50.0

    assert viagens.percentual_preenchido == 100.0


def test_campo_ausente_conta_como_nada_preenchido(tmp_path):
    gtfs = criar_gtfs(
        tmp_path / "gtfs.zip",
        stops="stop_id,stop_name\n1,A\n2,B\n",
        trips="route_id,trip_id\nr1,t1\n",
    )
    paradas, viagens = resumir(gtfs)

    assert not paradas.campo_existe
    assert paradas.percentual_preenchido == 0.0
    assert not viagens.campo_existe


def test_aceita_arquivo_com_bom(tmp_path):
    gtfs = criar_gtfs(
        tmp_path / "gtfs.zip",
        stops="﻿wheelchair_boarding,stop_id\n1,1\n",
        trips="trip_id\nt1\n",
    )
    paradas, _ = resumir(gtfs)
    assert paradas.acessiveis == 1
