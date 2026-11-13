import pytest

from vias_etl.cnes.demas import LIMITE_POR_PAGINA, ClienteDemas, ErroDemas, extrair_itens


class RespostaFalsa:
    def __init__(self, dados):
        self._dados = dados

    def raise_for_status(self):
        pass

    def json(self):
        return self._dados


class SessaoFalsa:
    """Simula a API: devolve páginas de uma lista conforme o offset pedido."""

    def __init__(self, registros, ignora_offset=False, resposta_login=None):
        self.registros = registros
        self.ignora_offset = ignora_offset
        self.resposta_login = resposta_login or {"access_token": "abc"}
        self.headers = {}
        self.offsets_pedidos = []

    def post(self, url, json, timeout):
        return RespostaFalsa(self.resposta_login)

    def get(self, url, params, timeout):
        pagina = 0 if self.ignora_offset else params["offset"]
        self.offsets_pedidos.append(params["offset"])
        inicio = pagina * params["limit"]
        return RespostaFalsa({"estabelecimentos": self.registros[inicio : inicio + params["limit"]]})


def registros(quantidade):
    return [{"codigo_cnes": i} for i in range(quantidade)]


def test_percorre_todas_as_paginas():
    sessao = SessaoFalsa(registros(45))
    cliente = ClienteDemas("login", "senha", sessao=sessao)
    resultado = list(cliente.estabelecimentos("355030"))
    assert len(resultado) == 45
    assert sessao.offsets_pedidos == [0, 1, 2]


def test_para_quando_a_ultima_pagina_vem_cheia_e_a_seguinte_vazia():
    sessao = SessaoFalsa(registros(2 * LIMITE_POR_PAGINA))
    cliente = ClienteDemas("login", "senha", sessao=sessao)
    assert len(list(cliente.estabelecimentos("355030"))) == 2 * LIMITE_POR_PAGINA


def test_avisa_quando_o_offset_nao_avanca():
    sessao = SessaoFalsa(registros(100), ignora_offset=True)
    cliente = ClienteDemas("login", "senha", sessao=sessao)
    with pytest.raises(ErroDemas, match="offset"):
        list(cliente.estabelecimentos("355030"))


def test_autenticar_guarda_o_token_no_cabecalho():
    sessao = SessaoFalsa([])
    cliente = ClienteDemas("login", "senha", sessao=sessao)
    cliente.autenticar()
    assert sessao.headers["Authorization"] == "Bearer abc"


def test_autenticar_explica_quando_nao_acha_o_token():
    sessao = SessaoFalsa([], resposta_login={"outra_coisa": 1})
    cliente = ClienteDemas("login", "senha", sessao=sessao)
    with pytest.raises(ErroDemas, match="token"):
        cliente.autenticar()


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
