import pytest

from vias_etl.olhovivo import ErroOlhoVivo, autenticar, resumir_frota


class RespostaFalsa:
    def __init__(self, dados):
        self._dados = dados

    def raise_for_status(self):
        pass

    def json(self):
        return self._dados


class SessaoFalsa:
    def __init__(self, resposta_login):
        self.resposta_login = resposta_login
        self.chamadas = []

    def post(self, url, params, timeout):
        self.chamadas.append((url, params))
        return RespostaFalsa(self.resposta_login)


def test_autenticar_aceita_true_e_envia_o_token():
    sessao = SessaoFalsa(True)
    autenticar(sessao, "meu-token")
    url, params = sessao.chamadas[0]
    assert url.endswith("/v2.1/Login/Autenticar")
    assert params == {"token": "meu-token"}


@pytest.mark.parametrize("resposta", [False, "false", None])
def test_autenticar_recusa_qualquer_coisa_diferente_de_true(resposta):
    with pytest.raises(ErroOlhoVivo, match="token"):
        autenticar(SessaoFalsa(resposta), "token-errado")


def test_resumir_frota_conta_total_e_acessiveis():
    dados = {
        "hr": "21:50",
        "l": [
            {"c": "8000-10", "vs": [{"p": 1, "a": True}, {"p": 2, "a": False}]},
            {"c": "875A-10", "vs": [{"p": 3, "a": True}]},
            {"c": "sem-veiculos", "vs": []},
        ],
    }
    assert resumir_frota(dados) == (3, 2)


def test_resumir_frota_explica_resposta_inesperada():
    with pytest.raises(ErroOlhoVivo, match="Chaves recebidas"):
        resumir_frota({"outra": 1})
