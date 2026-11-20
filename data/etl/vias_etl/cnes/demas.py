"""Cliente da API de dados abertos da Saúde (DEMAS) para o CNES.

Conferido direto na API em 17/11/2026:
- /cnes/estabelecimentos e /cnes/tipounidades são públicos, sem login;
- /cnes/estabelecimentos devolve {"estabelecimentos": [...]}, com no máximo 20 itens por página;
- offset é o número da página, começando em 0 (offset=1 traz os itens 21 a 40 quando limit=20);
- codigo_municipio usa 6 dígitos (São Paulo: 355030);
- /cnes/tipounidades devolve {"tipos_unidade": [{"codigo_tipo_unidade", "descricao_tipo_unidade"}]}.

Campos usados de cada estabelecimento: codigo_cnes, nome_fantasia, codigo_tipo_unidade,
endereco_estabelecimento, numero_estabelecimento, bairro_estabelecimento,
codigo_cep_estabelecimento, numero_telefone_estabelecimento, descricao_turno_atendimento,
latitude_estabelecimento_decimo_grau, longitude_estabelecimento_decimo_grau,
estabelecimento_faz_atendimento_ambulatorial_sus ("SIM" ou "NAO") e data_atualizacao.
"""

import time
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
        sessao: requests.Session | None = None,
        url_base: str = URL_BASE,
        timeout: float = 30.0,
        tentativas: int = 3,
        espera_entre_tentativas: float = 2.0,
    ) -> None:
        self.sessao = sessao or requests.Session()
        self.url_base = url_base.rstrip("/")
        self.timeout = timeout
        self.tentativas = tentativas
        self.espera_entre_tentativas = espera_entre_tentativas

    def _get(self, caminho: str, parametros: dict[str, Any] | None = None) -> Any:
        """GET com novas tentativas: a API às vezes falha com erro 5xx ou demora."""
        ultimo_erro: Exception | None = None
        for tentativa in range(1, self.tentativas + 1):
            try:
                resposta = self.sessao.get(
                    f"{self.url_base}{caminho}",
                    params=parametros,
                    headers={"Accept": "application/json"},
                    timeout=self.timeout,
                )
                if resposta.status_code >= 500:
                    raise ErroDemas(f"A API respondeu {resposta.status_code} em {caminho}.")
                resposta.raise_for_status()
                return resposta.json()
            except (requests.ConnectionError, requests.Timeout, ErroDemas) as erro:
                ultimo_erro = erro
                if tentativa < self.tentativas:
                    time.sleep(self.espera_entre_tentativas * tentativa)
        raise ErroDemas(f"Falhou depois de {self.tentativas} tentativas: {ultimo_erro}")

    def tipos_unidade(self) -> list[dict[str, Any]]:
        """Tipos de unidade do CNES (UBS, UPA, hospital), com código e descrição."""
        return extrair_itens(self._get("/cnes/tipounidades"))

    def estabelecimentos(
        self,
        codigo_municipio: str | int,
        codigo_tipo_unidade: int | None = None,
        status: int = 1,
        max_paginas: int = 5000,
    ) -> Iterator[dict[str, Any]]:
        """Percorre todas as páginas de /cnes/estabelecimentos e devolve um registro por vez."""
        assinatura_anterior = None
        for pagina in range(max_paginas):
            parametros: dict[str, Any] = {
                "codigo_municipio": codigo_municipio,
                "status": status,
                "limit": LIMITE_POR_PAGINA,
                "offset": pagina,
            }
            if codigo_tipo_unidade is not None:
                parametros["codigo_tipo_unidade"] = codigo_tipo_unidade

            itens = extrair_itens(self._get("/cnes/estabelecimentos", parametros))
            if not itens:
                return

            # Proteção: se a API passar a ignorar o offset, a mesma página voltaria para sempre.
            assinatura = repr(itens[0]) + repr(itens[-1])
            if assinatura == assinatura_anterior:
                raise ErroDemas(
                    "A API devolveu a mesma página duas vezes: o offset deixou de avançar."
                )
            assinatura_anterior = assinatura

            yield from itens
            if len(itens) < LIMITE_POR_PAGINA:
                return

        raise ErroDemas(f"Parou depois de {max_paginas} páginas sem chegar ao fim.")


def extrair_itens(dados: Any) -> list[dict[str, Any]]:
    """Acha a lista de registros na resposta ("estabelecimentos" ou "tipos_unidade")."""
    if isinstance(dados, list):
        return dados
    if isinstance(dados, dict):
        for valor in dados.values():
            if isinstance(valor, list):
                return valor
    return []


def atende_sus(estabelecimento: dict[str, Any]) -> bool:
    return estabelecimento.get("estabelecimento_faz_atendimento_ambulatorial_sus") == "SIM"


def tem_coordenadas(estabelecimento: dict[str, Any]) -> bool:
    latitude = estabelecimento.get("latitude_estabelecimento_decimo_grau")
    longitude = estabelecimento.get("longitude_estabelecimento_decimo_grau")
    return (
        isinstance(latitude, (int, float))
        and isinstance(longitude, (int, float))
        and -90 <= latitude <= 90
        and -180 <= longitude <= 180
        and (latitude, longitude) != (0, 0)
    )
