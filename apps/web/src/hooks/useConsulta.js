"use client";

import { useEffect, useEffectEvent, useState } from "react";
import { TIPOS_ERRO } from "@/services/api/client";

/** Estados de uma consulta. Falha e lista vazia são estados diferentes. */
export const ESTADOS = Object.freeze({
  INATIVO: "inativo", // consulta ainda não deve rodar (ex.: falta escolher o serviço)
  CARREGANDO: "carregando",
  SUCESSO: "sucesso",
  VAZIO: "vazio", // a API respondeu bem, mas sem registros
  ERRO: "erro", // a consulta falhou: NUNCA mostrar como "nenhum resultado"
});

/** Vazio = null, lista vazia ou objeto com `items` vazio (formato proposto no Alinhamento §5.1). */
export function ehVazioPadrao(dados) {
  if (dados === null || dados === undefined) return true;
  if (Array.isArray(dados)) return dados.length === 0;
  if (Array.isArray(dados.items)) return dados.items.length === 0;
  return false;
}

/**
 * Executa uma consulta à API e devolve o estado dela (FE-09).
 *
 * @param {string} chave  identifica a consulta (ex.: "unidades?servicoId=3").
 *   Quando a chave muda, a consulta anterior é cancelada e a nova começa.
 * @param {(signal: AbortSignal) => Promise<any>} buscar  função que chama a API.
 * @param {object} [opcoes]
 * @param {(dados:any) => boolean} [opcoes.ehVazio]
 * @param {boolean} [opcoes.ativo=true]  false = não consulta (estado INATIVO).
 *
 * Garantias:
 * - resposta de uma consulta antiga nunca sobrescreve a mais nova;
 * - cancelamento (troca de filtro, saída da tela) é ignorado, não vira erro;
 * - `tentarDeNovo()` repete a mesma consulta (para o botão "Tentar novamente").
 */
export function useConsulta(chave, buscar, { ehVazio = ehVazioPadrao, ativo = true } = {}) {
  const [tentativa, setTentativa] = useState(0);
  const [resultado, setResultado] = useState(null); // { id, dados, erro }
  const idAtual = `${chave}#${tentativa}`;

  const executar = useEffectEvent((signal) => buscar(signal));

  useEffect(() => {
    if (!ativo) return undefined;
    const controle = new AbortController();
    let vigente = true;

    Promise.resolve()
      .then(() => executar(controle.signal))
      .then(
        (dados) => {
          if (vigente) setResultado({ id: idAtual, dados, erro: null });
        },
        (erro) => {
          if (!vigente || erro?.tipo === TIPOS_ERRO.CANCELADO) return;
          setResultado({ id: idAtual, dados: null, erro });
        },
      );

    return () => {
      vigente = false;
      controle.abort();
    };
  }, [idAtual, ativo]);

  function tentarDeNovo() {
    setTentativa((valor) => valor + 1);
  }

  let estado;
  if (!ativo) estado = ESTADOS.INATIVO;
  else if (resultado?.id !== idAtual) estado = ESTADOS.CARREGANDO;
  else if (resultado.erro) estado = ESTADOS.ERRO;
  else if (ehVazio(resultado.dados)) estado = ESTADOS.VAZIO;
  else estado = ESTADOS.SUCESSO;

  const atual = resultado?.id === idAtual ? resultado : null;
  return {
    estado,
    dados: atual?.dados ?? null,
    erro: atual?.erro ?? null,
    tentarDeNovo,
  };
}
