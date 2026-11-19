from vias_etl.cnes.baixar_estabelecimentos import grupo_natureza, imprimir_resumo, resumir


def unidade(tipo, sus="SIM", natureza="1244", lat=-23.55, lon=-46.63):
    return {
        "codigo_tipo_unidade": tipo,
        "estabelecimento_faz_atendimento_ambulatorial_sus": sus,
        "descricao_natureza_juridica_estabelecimento": natureza,
        "latitude_estabelecimento_decimo_grau": lat,
        "longitude_estabelecimento_decimo_grau": lon,
    }


def test_grupo_natureza_pelo_primeiro_digito():
    assert grupo_natureza({"descricao_natureza_juridica_estabelecimento": "1244"}) == "publica"
    assert grupo_natureza({"descricao_natureza_juridica_estabelecimento": "2062"}) == "empresa"
    assert grupo_natureza({"descricao_natureza_juridica_estabelecimento": "3999"}) == "sem_fins_lucrativos"
    assert grupo_natureza({"descricao_natureza_juridica_estabelecimento": None}) == "outra"
    assert grupo_natureza({}) == "outra"


def test_resumir_conta_por_tipo():
    resumo = resumir([
        unidade(2),
        unidade(2, sus="NAO", natureza="2062"),
        unidade(2, lat=None),
        unidade(73),
    ])
    assert resumo[2]["total"] == 3
    assert resumo[2]["sus"] == 2
    assert resumo[2]["coordenadas"] == 2
    assert resumo[2]["publica"] == 2
    assert resumo[2]["empresa"] == 1
    assert resumo[73]["total"] == 1


def test_imprimir_resumo_mostra_total(capsys):
    imprimir_resumo(resumir([unidade(2), unidade(73)]), {2: "Ubs", 73: "Pronto Atendimento"})
    saida = capsys.readouterr().out
    assert "2 - Ubs" in saida
    assert "TOTAL" in saida
