"""Cliente da API DEMAS (apidadosabertos.saude.gov.br) para estabelecimentos do CNES.

O que já se sabe pelo catálogo da API:
- os endpoints do CNES exigem login (POST /autenticacao/login);
- /cnes/estabelecimentos aceita codigo_municipio, codigo_tipo_unidade, status, limit e offset;
- limit vale no máximo 20.

Pontos marcados com CONFIRMAR dependem da documentação do Swagger
(https://apidadosabertos.saude.gov.br/v1/#/), que só dá para ver com o cadastro feito.
Eles estão isolados em poucos lugares para serem ajustados sem mexer no resto.
"""

from collections.abc import Iterator
from typing import Any

import requests

URL_BASE = "https://apidadosabertos.saude.gov.br"
LIMITE_POR_PAGINA = 20


class ErroDemas(RuntimeError):
    """A API respondeu algo que o cliente não sabe tratar."""


class ClienteDemas:
    def __init__(
        self,
        login: str,
        senha: str,
        sessao: requests.Session | None = None,
        url_base: str = URL_BASE,
        primeira_pagina: int = 0,
        timeout: float = 30.0,
    ) -> None:
        self.login = login
        self.senha = senha
        self.sessao = sessao or requests.Session()
        self.url_base = url_base.rstrip("/")
        # CONFIRMAR: o catálogo descreve offset como "número da página".
        # Se a primeira página for 1, crie o cliente com primeira_pagina=1.
        self.primeira_pagina = primeira_pagina
        self.timeout = timeout

    def autenticar(self) -> None:
        # CONFIRMAR: nomes dos campos do corpo, onde vem o token e o formato do cabeçalho.
        resposta = self.sessao.post(
            f"{self.url_base}/autenticacao/login",
            json={"login": self.login, "senha": self.senha},
            timeout=self.timeout,
        )
        resposta.raise_for_status()
        dados = resposta.json()
        token = None
        if isinstance(dados, dict):
            token = dados.get("access_token") or dados.get("token")
        if not token:
            recebido = sorted(dados)[:10] if isinstance(dados, dict) else type(dados).__name__
            raise ErroDemas(
                "O login respondeu sem um token reconhecível. Confira no Swagger o formato "
                f"da resposta e ajuste ClienteDemas.autenticar. Recebido: {recebido}"
            )
        self.sessao.headers["Authorization"] = f"Bearer {token}"

    def estabelecimentos(
        self,
        codigo_municipio: str | int,
        codigo_tipo_unidade: int | None = None,
        status: int = 1,
        max_paginas: int = 5000,
    ) -> Iterator[dict[str, Any]]:
        """Percorre todas as páginas de /cnes/estabelecimentos e devolve um registro por vez."""
        pagina = self.primeira_pagina
        assinatura_anterior = None
        for _ in range(max_paginas):
            parametros: dict[str, Any] = {
                "codigo_municipio": codigo_municipio,
                "status": status,
                "limit": LIMITE_POR_PAGINA,
                "offset": pagina,
            }
            if codigo_tipo_unidade is not None:
                parametros["codigo_tipo_unidade"] = codigo_tipo_unidade

            resposta = self.sessao.get(
                f"{self.url_base}/cnes/estabelecimentos",
                params=parametros,
                timeout=self.timeout,
            )
            resposta.raise_for_status()
            itens = extrair_itens(resposta.json())
            if not itens:
                return

            # Se a API ignorar o offset, a mesma página voltaria para sempre.
            assinatura = repr(itens[0]) + repr(itens[-1])
            if assinatura == assinatura_anterior:
                raise ErroDemas(
                    "A API devolveu a mesma página duas vezes: o offset não está avançando. "
                    "Confira no Swagger se offset é número da página ou número do item."
                )
            assinatura_anterior = assinatura

            yield from itens
            if len(itens) < LIMITE_POR_PAGINA:
                return
            pagina += 1

        raise ErroDemas(f"Parou depois de {max_paginas} páginas sem chegar ao fim.")


def extrair_itens(dados: Any) -> list[dict[str, Any]]:
    """Acha a lista de registros na resposta, seja ela uma lista ou um objeto com uma lista dentro.

    CONFIRMAR: quando o formato da resposta for conhecido, isto pode virar dados["<chave>"].
    """
    if isinstance(dados, list):
        return dados
    if isinstance(dados, dict):
        for valor in dados.values():
            if isinstance(valor, list):
                return valor
    return []
