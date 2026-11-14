import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import { ErroApi, mensagemDeErro } from "@/services/api/client";

/**
 * A consulta falhou. Nunca é mostrada como "nenhum resultado".
 * - Mostra só a mensagem segura do ErroApi; erro inesperado (não ErroApi)
 *   recebe uma mensagem genérica, sem detalhe técnico.
 * - "Tentar novamente" aparece quando faz sentido (rede, demora, 5xx).
 * - `acao` permite um caminho alternativo, como "Voltar à busca".
 */
export default function EstadoErro({
  erro,
  aoTentarDeNovo,
  titulo = "Não foi possível carregar as informações",
  acao,
}) {
  const conhecido = erro instanceof ErroApi;
  const mensagem = conhecido ? erro.mensagem : mensagemDeErro();
  const podeTentar = Boolean(aoTentarDeNovo) && (!conhecido || erro.podeTentarDeNovo);

  return (
    <Alert
      tom="erro"
      titulo={titulo}
      acao={
        (podeTentar || acao) && (
          <div className="flex flex-wrap gap-2">
            {podeTentar && (
              <Button variante="secundario" onClick={aoTentarDeNovo}>
                Tentar novamente
              </Button>
            )}
            {acao}
          </div>
        )
      }
    >
      {mensagem}
    </Alert>
  );
}
