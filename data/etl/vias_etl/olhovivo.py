"""Acesso à API Olho Vivo da SPTrans (v2.1).

Documentação oficial:
https://www.sptrans.com.br/desenvolvedores/api-do-olho-vivo-guia-de-referencia/documentacao-api/

A autenticação é um POST em /Login/Autenticar?token=..., que devolve true ou false.
A sessão fica num cookie, que o requests.Session guarda sozinho.
"""

from typing import Any

import requests

URL_BASE = "https://api.olhovivo.sptrans.com.br/v2.1"


class ErroOlhoVivo(RuntimeError):
    """A API recusou o token ou respondeu algo inesperado."""


def autenticar(sessao: requests.Session, token: str, timeout: float = 30.0) -> None:
    resposta = sessao.post(
        f"{URL_BASE}/Login/Autenticar",
        params={"token": token},
        timeout=timeout,
    )
    resposta.raise_for_status()
    if resposta.json() is not True:
        raise ErroOlhoVivo(
            "A Olho Vivo recusou o token. Confira o OLHOVIVO_TOKEN no .env e se o "
            "aplicativo aparece ativo em 'Meus Aplicativos' na área de desenvolvedores."
        )


def buscar_linhas(sessao: requests.Session, termo: str, timeout: float = 30.0) -> list[dict[str, Any]]:
    """Busca linhas pelo número ou por parte do nome, como "8000" ou "Lapa"."""
    resposta = sessao.get(
        f"{URL_BASE}/Linha/Buscar",
        params={"termosBusca": termo},
        timeout=timeout,
    )
    resposta.raise_for_status()
    return resposta.json()


def posicoes(sessao: requests.Session, timeout: float = 60.0) -> dict[str, Any]:
    """Posição de todos os ônibus em circulação agora, agrupados por linha."""
    resposta = sessao.get(f"{URL_BASE}/Posicao", timeout=timeout)
    resposta.raise_for_status()
    return resposta.json()


def resumir_frota(dados_posicao: dict[str, Any]) -> tuple[int, int]:
    """Conta quantos veículos estão na resposta de /Posicao e quantos são acessíveis.

    Na resposta, "l" é a lista de linhas, cada linha tem "vs" (veículos) e cada
    veículo tem "a" (acessível).
    """
    if "l" not in dados_posicao:
        raise ErroOlhoVivo(
            f"A resposta de /Posicao veio sem a lista de linhas. Chaves recebidas: {sorted(dados_posicao)}"
        )
    total = 0
    acessiveis = 0
    for linha in dados_posicao["l"] or []:
        for veiculo in linha.get("vs") or []:
            total += 1
            if veiculo.get("a") is True:
                acessiveis += 1
    return total, acessiveis
