import { ErroApi, requisitar } from "./client";

/** O Google e a SPTrans podem demorar; mais o cold start do Render. */
const TIMEOUT_PERCURSO_MS = 180_000;

/**
 * POST /api/percursos — percurso de transporte público até a unidade (D-20).
 *
 * A origem vai no corpo, nunca na URL: é a localização da pessoa. A API usa só
 * para este cálculo (Google Routes + SPTrans Olho Vivo) e não grava.
 * A precisão do GPS não é enviada.
 *
 * Para 422 (horário inválido, unidade sem coordenada) e 503 (serviço de rotas
 * fora do ar ou sem chave), a mensagem escrita pela API do VIAS é a que a
 * pessoa precisa ler, então ela sobe para `mensagem`.
 */
export async function calcularPercurso({ unidadeId, origem, horarioAtendimento, folgaMinutos, signal }) {
  const corpo = {
    unidadeId: Number(unidadeId),
    origem: { latitude: origem.latitude, longitude: origem.longitude },
    horarioAtendimento: horarioAtendimento ?? null,
    folgaMinutos: horarioAtendimento ? folgaMinutos : null,
  };
  try {
    return await requisitar("/percursos", { metodo: "POST", corpo, signal, timeoutMs: TIMEOUT_PERCURSO_MS });
  } catch (erro) {
    if (erro instanceof ErroApi && (erro.status === 422 || erro.status === 503) && erro.detalhe) {
      throw new ErroApi({
        tipo: erro.tipo,
        status: erro.status,
        mensagem: erro.detalhe,
        detalhe: erro.detalhe,
        caminho: erro.caminho,
      });
    }
    throw erro;
  }
}
