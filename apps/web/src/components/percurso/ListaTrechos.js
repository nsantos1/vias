import Icon from "@/components/ui/Icon";
import { formatarDuracao, formatarMetros, horaDe, rotuloTipo } from "@/lib/percurso";
import PrevisaoAoVivo from "./PrevisaoAoVivo";

const ICONES = { A_PE: "caminhar", ONIBUS: "onibus", METRO: "trem", TREM: "trem", OUTRO: "onibus" };

/** Passo a passo de uma opção de percurso, na ordem em que a pessoa faz. */
export default function ListaTrechos({ trechos }) {
  return (
    <ol className="flex flex-col">
      {trechos.map((trecho, indice) => (
        <li key={indice} className="relative flex gap-4 pb-5 last:pb-0">
          {/* Linha vertical entre os passos (decorativa) */}
          {indice < trechos.length - 1 && (
            <span aria-hidden="true" className="absolute top-10 bottom-0 left-[19px] w-0.5 bg-linha" />
          )}
          <span
            aria-hidden="true"
            className={
              trecho.tipo === "A_PE"
                ? "relative z-[1] flex size-10 shrink-0 items-center justify-center rounded-full border-2 border-linha bg-papel text-pinho"
                : "relative z-[1] flex size-10 shrink-0 items-center justify-center rounded-full bg-pinho text-papel"
            }
          >
            <Icon nome={ICONES[trecho.tipo] ?? "onibus"} className="size-5" />
          </span>
          <div className="flex min-w-0 flex-1 flex-col gap-1.5 pt-1.5">
            {trecho.tipo === "A_PE" ? <Caminhada trecho={trecho} /> : <Transporte trecho={trecho} />}
          </div>
        </li>
      ))}
    </ol>
  );
}

function Caminhada({ trecho }) {
  const duracao = formatarDuracao(trecho.duracaoMinutos);
  const metros = formatarMetros(trecho.distanciaMetros);
  return (
    <>
      <p className="font-semibold text-pinho">
        Caminhe{duracao && ` ${duracao}`}
        {metros && <span className="font-normal text-salvia"> ({metros})</span>}
      </p>
      {trecho.para && <p className="text-salvia">até {trecho.para}</p>}
    </>
  );
}

function Transporte({ trecho }) {
  const linha = trecho.linha?.codigo ?? trecho.linha?.nome;
  const embarque = horaDe(trecho.embarque?.horario);
  const desembarque = horaDe(trecho.desembarque?.horario);
  return (
    <>
      <p className="flex flex-wrap items-center gap-x-2 gap-y-1">
        <span className="font-semibold text-pinho">{trecho.veiculo ?? rotuloTipo(trecho.tipo)}</span>
        {linha && (
          <span className="rounded-md bg-pinho px-2 py-0.5 font-mono text-sm font-semibold text-papel">{linha}</span>
        )}
        {trecho.sentido && <span className="text-salvia">sentido {trecho.sentido}</span>}
      </p>
      {trecho.linha?.nome && trecho.linha.nome !== linha && (
        <p className="text-sm text-salvia">{trecho.linha.nome}</p>
      )}
      <p>
        <span className="font-semibold">{embarque ? `Embarque às ${embarque}` : "Embarque"}</span>
        {trecho.embarque?.nome && <> em {trecho.embarque.nome}</>}
      </p>
      <p>
        <span className="font-semibold">Desça{desembarque ? ` às ${desembarque}` : ""}</span>
        {trecho.desembarque?.nome && <> em {trecho.desembarque.nome}</>}
        {Number.isFinite(trecho.paradas) && (
          <span className="text-salvia">
            {" "}
            ({trecho.paradas} {trecho.paradas === 1 ? "parada" : "paradas"})
          </span>
        )}
      </p>
      {(Number.isFinite(trecho.intervaloMinutos) || trecho.linha?.operadora) && (
        <p className="text-sm text-salvia">
          {Number.isFinite(trecho.intervaloMinutos) && <>Passa a cada {trecho.intervaloMinutos} min</>}
          {Number.isFinite(trecho.intervaloMinutos) && trecho.linha?.operadora && " · "}
          {trecho.linha?.operadora}
        </p>
      )}
      {trecho.tipo === "ONIBUS" ? (
        <PrevisaoAoVivo aoVivo={trecho.aoVivo} />
      ) : (
        <p className="flex items-start gap-2 text-sm text-salvia">
          <Icon nome="acessibilidade" className="mt-0.5 size-4 shrink-0" />
          Acessibilidade da estação não informada pelas fontes usadas.
        </p>
      )}
    </>
  );
}
