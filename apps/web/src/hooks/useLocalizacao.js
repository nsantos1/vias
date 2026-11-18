"use client";

import { useEffect, useState } from "react";

/**
 * Localização do aparelho para ordenar as unidades mais próximas (D-18).
 *
 * Regras de privacidade (documento de contexto §10.4 e §13.3):
 * - pedida só quando a pessoa faz uma busca (a tela de resultados depende dela);
 * - fica só na memória da tela: não vai para a URL, para a API, para logs nem
 *   para o armazenamento do navegador;
 * - se for negada ou não existir, o app NÃO inventa uma origem.
 */
export const ESTADOS_LOCAL = Object.freeze({
  PEDINDO: "pedindo",
  OK: "ok",
  NEGADA: "negada", // a pessoa (ou o navegador) bloqueou o acesso
  INDISPONIVEL: "indisponivel", // aparelho sem localização ou sem suporte
  ERRO: "erro", // demorou demais ou falhou por outro motivo
});

const OPCOES = { enableHighAccuracy: false, timeout: 15_000, maximumAge: 5 * 60_000 };

/** Pede a posição e sempre resolve (nunca rejeita) com { estado, origem }. */
export function obterPosicao(geo = globalThis.navigator?.geolocation) {
  return new Promise((resolver) => {
    if (!geo) {
      resolver({ estado: ESTADOS_LOCAL.INDISPONIVEL, origem: null });
      return;
    }
    geo.getCurrentPosition(
      (posicao) =>
        resolver({
          estado: ESTADOS_LOCAL.OK,
          origem: {
            latitude: posicao.coords.latitude,
            longitude: posicao.coords.longitude,
            precisaoMetros: posicao.coords.accuracy ?? null,
          },
        }),
      (erro) => {
        const estado =
          erro?.code === 1
            ? ESTADOS_LOCAL.NEGADA
            : erro?.code === 2
              ? ESTADOS_LOCAL.INDISPONIVEL
              : ESTADOS_LOCAL.ERRO;
        resolver({ estado, origem: null });
      },
      OPCOES,
    );
  });
}

/** { estado, origem, pedirDeNovo } — pede a localização ao montar a tela. */
export function useLocalizacao() {
  const [tentativa, setTentativa] = useState(0);
  const [resultado, setResultado] = useState(null); // { tentativa, estado, origem }

  useEffect(() => {
    let vigente = true;
    obterPosicao().then((r) => {
      if (vigente) setResultado({ tentativa, ...r });
    });
    return () => {
      vigente = false;
    };
  }, [tentativa]);

  const atual = resultado?.tentativa === tentativa ? resultado : null;
  return {
    estado: atual?.estado ?? ESTADOS_LOCAL.PEDINDO,
    origem: atual?.origem ?? null,
    pedirDeNovo: () => setTentativa((t) => t + 1),
  };
}
