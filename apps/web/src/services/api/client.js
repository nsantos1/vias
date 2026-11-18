/**
 * Cliente HTTP único da API Java (FE-08).
 *
 * - URL base: NEXT_PUBLIC_API_URL (pública, vai para o navegador: nunca colocar segredo).
 * - Timeout próprio + cancelamento externo (AbortController), para uma busca nova
 *   cancelar a anterior e uma resposta antiga não sobrescrever a nova.
 * - Todo erro vira um ErroApi com `tipo`, para a tela diferenciar falha de lista
 *   vazia e mostrar uma mensagem segura (sem stack trace nem detalhe técnico).
 * - Sem repetição automática: quem decide tentar de novo é a pessoa, pelo botão
 *   "Tentar novamente". POST/PUT/DELETE nunca são repetidos sozinhos.
 *
 * Formato de erro da API Java (confirmado pelo Raphael em 16/11):
 * { timestamp, status, erro, mensagem, caminho, campos }.
 */

/**
 * 60 s: a API está no plano gratuito do Render, que "dorme" sem uso e leva
 * perto de 1 minuto para acordar na primeira consulta (medido em 18/11).
 * Com 10 s, a primeira busca da demonstração falharia por tempo. As telas
 * avisam a pessoa quando a espera passa de alguns segundos (AvisoDemora).
 */
export const TIMEOUT_PADRAO_MS = 60_000;

/** Tipos de erro que as telas tratam de forma diferente. */
export const TIPOS_ERRO = Object.freeze({
  CONFIGURACAO: "CONFIGURACAO", // NEXT_PUBLIC_API_URL ausente ou inválida
  REDE: "REDE", // API fora do ar, sem internet, CORS bloqueado
  TIMEOUT: "TIMEOUT", // passou do tempo limite
  CANCELADO: "CANCELADO", // cancelado pelo próprio app (nova busca); a tela deve ignorar
  HTTP: "HTTP", // a API respondeu com status de erro (400, 404, 500…)
  RESPOSTA_INVALIDA: "RESPOSTA_INVALIDA", // 2xx com corpo que não é JSON
});

const MENSAGENS_STATUS = {
  400: "Algum dado da busca não foi aceito. Revise os filtros e tente de novo.",
  404: "Não encontramos o que você procurou.",
};

const MENSAGENS_TIPO = {
  CONFIGURACAO: "O endereço do serviço do VIAS não está configurado.",
  REDE: "Não foi possível conectar ao serviço do VIAS. Verifique a internet e tente de novo.",
  TIMEOUT: "O serviço do VIAS demorou mais de 1 minuto para responder. Tente de novo.",
  CANCELADO: "A consulta foi cancelada.",
  RESPOSTA_INVALIDA: "O serviço do VIAS respondeu em um formato inesperado.",
  HTTP: "O serviço do VIAS encontrou um problema. Tente de novo em instantes.",
};

/** Mensagem segura para a tela, a partir do tipo e do status do erro. */
export function mensagemDeErro({ tipo, status } = {}) {
  if (tipo === TIPOS_ERRO.HTTP && MENSAGENS_STATUS[status]) return MENSAGENS_STATUS[status];
  return MENSAGENS_TIPO[tipo] ?? MENSAGENS_TIPO.HTTP;
}

/** Erro normalizado. `mensagem` pode ir para a tela; `detalhe` é só para log/depuração. */
export class ErroApi extends Error {
  constructor({ tipo, status = null, mensagem, detalhe = null, caminho = null }) {
    super(mensagem);
    this.name = "ErroApi";
    this.tipo = tipo;
    this.status = status;
    this.mensagem = mensagem;
    this.detalhe = detalhe;
    this.caminho = caminho;
  }

  /** true quando faz sentido oferecer "Tentar novamente". */
  get podeTentarDeNovo() {
    return (
      this.tipo === TIPOS_ERRO.REDE ||
      this.tipo === TIPOS_ERRO.TIMEOUT ||
      (this.tipo === TIPOS_ERRO.HTTP && this.status >= 500)
    );
  }
}

/** Lê e valida a URL base. Exportada para teste. */
export function urlBase(valor = process.env.NEXT_PUBLIC_API_URL) {
  if (!valor) {
    throw new ErroApi({ tipo: TIPOS_ERRO.CONFIGURACAO, mensagem: MENSAGENS_TIPO.CONFIGURACAO });
  }
  let url;
  try {
    url = new URL(valor);
  } catch {
    throw new ErroApi({
      tipo: TIPOS_ERRO.CONFIGURACAO,
      mensagem: MENSAGENS_TIPO.CONFIGURACAO,
      detalhe: "NEXT_PUBLIC_API_URL não é uma URL válida",
    });
  }
  if (url.protocol !== "http:" && url.protocol !== "https:") {
    throw new ErroApi({
      tipo: TIPOS_ERRO.CONFIGURACAO,
      mensagem: MENSAGENS_TIPO.CONFIGURACAO,
      detalhe: "NEXT_PUBLIC_API_URL precisa começar com http:// ou https://",
    });
  }
  return valor.replace(/\/+$/, "");
}

/**
 * Monta a URL final. Parâmetros undefined, null ou "" são ignorados: o app só
 * envia filtros que a pessoa escolheu de fato.
 */
export function montarUrl(caminho, params = {}, base = urlBase()) {
  const url = new URL(base + (caminho.startsWith("/") ? caminho : `/${caminho}`));
  for (const [chave, valor] of Object.entries(params)) {
    if (valor === undefined || valor === null || valor === "") continue;
    url.searchParams.set(chave, String(valor));
  }
  return url.toString();
}

/**
 * Faz a requisição e devolve o JSON (ou null em 204).
 * @param {string} caminho  ex.: "/unidades"
 * @param {object} [opcoes]
 * @param {string} [opcoes.metodo="GET"]
 * @param {object} [opcoes.params]   query string
 * @param {object} [opcoes.corpo]    JSON do corpo (POST/PUT)
 * @param {AbortSignal} [opcoes.signal]  para cancelar de fora
 * @param {number} [opcoes.timeoutMs]
 * @param {string} [opcoes.base]     só para testes
 */
export async function requisitar(
  caminho,
  { metodo = "GET", params, corpo, signal, timeoutMs = TIMEOUT_PADRAO_MS, base } = {},
) {
  const url = montarUrl(caminho, params, base ?? urlBase());

  const controleTimeout = new AbortController();
  const timer = setTimeout(() => controleTimeout.abort(), timeoutMs);
  const sinal = signal ? AbortSignal.any([signal, controleTimeout.signal]) : controleTimeout.signal;

  let resposta;
  try {
    resposta = await fetch(url, {
      method: metodo,
      headers: {
        Accept: "application/json",
        ...(corpo !== undefined && { "Content-Type": "application/json" }),
      },
      body: corpo !== undefined ? JSON.stringify(corpo) : undefined,
      signal: sinal,
    });
  } catch (erro) {
    clearTimeout(timer);
    if (signal?.aborted) {
      throw new ErroApi({ tipo: TIPOS_ERRO.CANCELADO, mensagem: MENSAGENS_TIPO.CANCELADO, caminho });
    }
    if (controleTimeout.signal.aborted) {
      throw new ErroApi({ tipo: TIPOS_ERRO.TIMEOUT, mensagem: MENSAGENS_TIPO.TIMEOUT, caminho });
    }
    throw new ErroApi({
      tipo: TIPOS_ERRO.REDE,
      mensagem: MENSAGENS_TIPO.REDE,
      detalhe: erro?.message ?? null,
      caminho,
    });
  }

  try {
    if (!resposta.ok) {
      const corpoErro = await lerJsonSeguro(resposta);
      throw new ErroApi({
        tipo: TIPOS_ERRO.HTTP,
        status: resposta.status,
        mensagem: MENSAGENS_STATUS[resposta.status] ?? MENSAGENS_TIPO.HTTP,
        // A mensagem do backend fica só no detalhe: pode ser técnica.
        // A API Java devolve { mensagem, erro, caminho }; { message, error, path }
        // (proposta do Alinhamento §5.4) continua aceito.
        detalhe:
          corpoErro?.mensagem ?? corpoErro?.message ?? corpoErro?.erro ?? corpoErro?.error ?? null,
        caminho: corpoErro?.caminho ?? corpoErro?.path ?? caminho,
      });
    }

    if (resposta.status === 204) return null;

    const texto = await resposta.text();
    if (!texto) return null;
    try {
      return JSON.parse(texto);
    } catch {
      throw new ErroApi({
        tipo: TIPOS_ERRO.RESPOSTA_INVALIDA,
        status: resposta.status,
        mensagem: MENSAGENS_TIPO.RESPOSTA_INVALIDA,
        caminho,
      });
    }
  } catch (erro) {
    if (erro instanceof ErroApi) throw erro;
    // Corpo interrompido no meio (timeout ou cancelamento durante a leitura)
    if (signal?.aborted) {
      throw new ErroApi({ tipo: TIPOS_ERRO.CANCELADO, mensagem: MENSAGENS_TIPO.CANCELADO, caminho });
    }
    if (controleTimeout.signal.aborted) {
      throw new ErroApi({ tipo: TIPOS_ERRO.TIMEOUT, mensagem: MENSAGENS_TIPO.TIMEOUT, caminho });
    }
    throw new ErroApi({ tipo: TIPOS_ERRO.REDE, mensagem: MENSAGENS_TIPO.REDE, caminho });
  } finally {
    clearTimeout(timer);
  }
}

async function lerJsonSeguro(resposta) {
  try {
    return await resposta.json();
  } catch {
    return null;
  }
}
