import pytest
import requests

from vias_etl.cnes.demas import (
    LIMITE_POR_PAGINA,
    ClienteDemas,
    ErroDemas,
    atende_sus,
    extrair_itens,
    tem_coordenadas,
)


class RespostaFalsa:
    def __init__(self, dados, status_code=200):
        self._dados = dados
        self.status_code = status_code

    def raise_for_status(self):
        if self.status_code >= 400:
            raise requests.HTTPError(f"status {self.status_code}")

    def json(self):
        return self._dados


class SessaoFalsa:
    """Simula a API: offset é o número da página, começando em 0."""

    def __init__(self, registros, ignora_offset=False, falhas_iniciais=0):
        self.registros = registros
        self.ignora_offset = ignora_offset
        self.falhas_iniciais = falhas_iniciais
        self.chamadas = []

    def get(self, url, params, headers, timeout):
        self.chamadas.append((url, params))
        if self.falhas_iniciais > 0:
            self.falhas_iniciais -= 1
            return RespostaFalsa(None, status_code=503)
        if url.endswith("/cnes/tipounidades"):
            return RespostaFalsa({"tipos_unidade": [{"codigo_tipo_unidade": 2}]})
        pagina = 0 if self.ignora_offset else params["offset"]
        inicio = pagina * params["limit"]
        return RespostaFalsa({"estabelecimentos": self.registros[inicio : inicio + params["limit"]]})


def registros(quantidade):
    return [{"codigo_cnes": i} for i in range(quantidade)]


def cliente(sessao):
    return ClienteDemas(sessao=sessao, espera_entre_tentativas=0)


def test_percorre_todas_as_paginas_sem_repetir():
    sessao = SessaoFalsa(registros(45))
    resultado = list(cliente(sessao).estabelecimentos("355030"))
    assert [r["codigo_cnes"] for r in resultado] == list(range(45))
    assert [params["offset"] for _, params in sessao.chamadas] == [0, 1, 2]


def test_para_quando_a_ultima_pagina_vem_cheia_e_a_seguinte_vazia():
    sessao = SessaoFalsa(registros(2 * LIMITE_POR_PAGINA))
    assert len(list(cliente(sessao).estabelecimentos("355030"))) == 2 * LIMITE_POR_PAGINA


def test_envia_filtros_de_municipio_tipo_e_status():
    sessao = SessaoFalsa(registros(1))
    list(cliente(sessao).estabelecimentos("355030", codigo_tipo_unidade=2))
    _, params = sessao.chamadas[0]
    assert params["codigo_municipio"] == "355030"
    assert params["codigo_tipo_unidade"] == 2
    assert params["status"] == 1
    assert params["limit"] == LIMITE_POR_PAGINA


def test_avisa_quando_o_offset_nao_avanca():
    sessao = SessaoFalsa(registros(100), ignora_offset=True)
    with pytest.raises(ErroDemas, match="offset"):
        list(cliente(sessao).estabelecimentos("355030"))


def test_tenta_de_novo_quando_a_api_falha():
    sessao = SessaoFalsa(registros(3), falhas_iniciais=2)
    assert len(list(cliente(sessao).estabelecimentos("355030"))) == 3


def test_desiste_depois_das_tentativas():
    sessao = SessaoFalsa(registros(3), falhas_iniciais=10)
    with pytest.raises(ErroDemas, match="3 tentativas"):
        list(cliente(sessao).estabelecimentos("355030"))


def test_tipos_unidade():
    assert cliente(SessaoFalsa([])).tipos_unidade() == [{"codigo_tipo_unidade": 2}]


@pytest.mark.parametrize(
    "dados, esperado",
    [
        ([{"a": 1}], [{"a": 1}]),
        ({"estabelecimentos": [{"a": 1}]}, [{"a": 1}]),
        ({"total": 0}, []),
        (None, []),
    ],
)
def test_extrair_itens(dados, esperado):
    assert extrair_itens(dados) == esperado


def test_atende_sus():
    assert atende_sus({"estabelecimento_faz_atendimento_ambulatorial_sus": "SIM"})
    assert not atende_sus({"estabelecimento_faz_atendimento_ambulatorial_sus": "NAO"})
    assert not atende_sus({})


@pytest.mark.parametrize(
    "latitude, longitude, esperado",
    [
        (-23.589789, -46.607978, True),
        (None, -46.6, False),
        (0, 0, False),
        (-123.5, -46.6, False),
    ],
)
def test_tem_coordenadas(latitude, longitude, esperado):
    unidade = {
        "latitude_estabelecimento_decimo_grau": latitude,
        "longitude_estabelecimento_decimo_grau": longitude,
    }
    assert tem_coordenadas(unidade) is esperado
