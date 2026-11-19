import Icon from "@/components/ui/Icon";
import { formatarDuracao, rotuloTipo } from "@/lib/percurso";

const ICONES = { A_PE: "caminhar", ONIBUS: "onibus", METRO: "trem", TREM: "trem", OUTRO: "onibus" };

/**
 * A rota em uma linha de selos: 🚶 7 min › 🚌 6358-10 › 🚶 8 min.
 * A cor da linha só é usada quando o Google manda a cor do texto junto
 * (par pensado para ter contraste); senão, o selo usa as cores do VIAS.
 * Para leitor de tela, cada selo diz o modo e a linha por extenso.
 */
export default function ResumoRota({ trechos = [], claro = false }) {
  return (
    // span com role de lista (e não <ol>) porque o resumo também aparece dentro de botões.
    <span role="list" aria-label="Resumo do caminho" className="flex flex-wrap items-center gap-x-1 gap-y-2">
      {trechos.map((t, i) => (
        <span role="listitem" key={i} className="flex items-center gap-1">
          {i > 0 && (
            <Icon nome="avancar" className={claro ? "size-3.5 text-papel/60" : "size-3.5 text-salvia"} />
          )}
          {t.tipo === "A_PE" ? (
            <span
              className={
                claro
                  ? "flex items-center gap-1 text-sm font-semibold text-papel"
                  : "flex items-center gap-1 text-sm font-medium text-salvia"
              }
            >
              <Icon nome="caminhar" className="size-4" />
              <span className="sr-only">A pé, </span>
              {formatarDuracao(t.duracaoMinutos) ?? "a pé"}
            </span>
          ) : (
            <SeloLinha trecho={t} />
          )}
        </span>
      ))}
    </span>
  );
}

export function SeloLinha({ trecho }) {
  const linha = trecho.linha?.codigo ?? trecho.linha?.nome;
  const cores =
    trecho.linha?.cor && trecho.linha?.corTexto
      ? { backgroundColor: trecho.linha.cor, color: trecho.linha.corTexto }
      : undefined;
  return (
    <span
      style={cores}
      className="flex items-center gap-1.5 rounded-pill bg-pinho px-3 py-0.5 text-sm font-semibold text-papel ring-1 ring-papel/30"
    >
      <Icon nome={ICONES[trecho.tipo] ?? "onibus"} className="size-4" />
      <span className="sr-only">{rotuloTipo(trecho.tipo)} </span>
      <span className="font-mono">{linha ?? rotuloTipo(trecho.tipo)}</span>
    </span>
  );
}
