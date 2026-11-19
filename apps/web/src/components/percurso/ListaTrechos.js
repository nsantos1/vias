import Icon from "@/components/ui/Icon";
import { cn } from "@/lib/cn";
import { formatarDuracao, formatarMetros, horaDe, horariosDosTrechos } from "@/lib/percurso";
import PrevisaoAoVivo from "./PrevisaoAoVivo";
import { SeloLinha } from "./ResumoRota";

/**
 * Linha do tempo de uma opção (referência final de 19/11, D-25): horário à
 * esquerda, um círculo por trecho (a pé claro, transporte escuro, chegada lima)
 * e o que fazer num cartão à direita. Os horários de ônibus e metrô são os da
 * API; os das caminhadas são somados a partir deles.
 */
export default function ListaTrechos({ opcao, destino }) {
  const trechos = opcao.trechos ?? [];
  const horarios = horariosDosTrechos(opcao);

  return (
    <ol className="flex flex-col">
      {trechos.map((trecho, indice) => (
        <Passo key={indice} hora={horaDe(horarios[indice])} tipo={trecho.tipo}>
          {trecho.tipo === "A_PE" ? <Caminhada trecho={trecho} /> : <Transporte trecho={trecho} />}
        </Passo>
      ))}
      <Passo hora={horaDe(opcao.chegada)} tipo="CHEGADA" ultimo>
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div className="flex flex-col gap-0.5">
            <p className="text-lg font-bold text-pinho">Chegada</p>
            {destino && <p className="font-semibold text-rota uppercase">{destino}</p>}
          </div>
          <span className="rounded-pill border border-rota/20 bg-lima/40 px-5 py-1 text-[0.65rem] font-bold text-pinho uppercase">
            Destino final
          </span>
        </div>
      </Passo>
    </ol>
  );
}

function Passo({ hora, tipo, ultimo = false, children }) {
  const marcador =
    tipo === "A_PE"
      ? "border-2 border-linha bg-superficie text-rota"
      : tipo === "CHEGADA"
        ? "bg-lima text-pinho shadow-[0_0_0_6px_rgb(215_243_106/0.3)]"
        : "bg-pinho text-papel shadow-[0_6px_16px_rgb(18_59_53/0.3)]";
  const icone = tipo === "A_PE" ? "caminhar" : tipo === "CHEGADA" ? "pin" : tipo === "ONIBUS" ? "onibus" : "trem";
  return (
    <li className="passo relative grid grid-cols-[2.75rem_2.75rem_1fr] gap-x-3 pb-4 last:pb-0 sm:grid-cols-[3.25rem_3rem_1fr] sm:gap-x-4">
      <span className="pt-5 text-right font-semibold text-pinho tabular-nums">{hora ?? ""}</span>
      <span className="relative flex justify-center">
        {!ultimo && <span aria-hidden="true" className="absolute top-14 -bottom-4 w-0.5 bg-linha" />}
        <span
          aria-hidden="true"
          className={cn("relative z-[1] mt-3 flex size-11 items-center justify-center rounded-full", marcador)}
        >
          <Icon nome={icone} className="size-5" />
        </span>
      </span>
      <div
        className={cn(
          "flex min-w-0 flex-col gap-1.5 rounded-2xl border px-5 py-4",
          tipo === "CHEGADA" ? "border-lima/60 bg-lima/20" : "border-linha/70 bg-papel/50",
        )}
      >
        {children}
      </div>
    </li>
  );
}

function Caminhada({ trecho }) {
  const duracao = formatarDuracao(trecho.duracaoMinutos);
  const metros = formatarMetros(trecho.distanciaMetros);
  return (
    <>
      <p className="text-lg font-bold text-pinho">
        Caminhe{duracao && ` ${duracao}`}
        {metros && <span className="ml-3 text-sm font-medium text-salvia">{metros}</span>}
      </p>
      {trecho.para && <p className="font-medium text-grafite/80">até {trecho.para}</p>}
    </>
  );
}

function Transporte({ trecho }) {
  const desembarque = horaDe(trecho.desembarque?.horario);
  // O selo já diz o modo ("Ônibus", "Metrô") para o leitor de tela.
  const verbo = trecho.tipo === "OUTRO" ? "Embarque no" : "Pegue o";
  return (
    <>
      <p className="flex flex-wrap items-center gap-x-2 gap-y-1 text-lg font-bold text-pinho">
        {verbo} <SeloLinha trecho={trecho} />
        {trecho.sentido && <span className="ml-1 text-base font-semibold">sentido {trecho.sentido}</span>}
      </p>
      {trecho.embarque?.nome && <p className="font-medium text-grafite/80">Embarque em {trecho.embarque.nome}</p>}
      <p className="font-medium text-grafite/80">
        Desça em {trecho.desembarque?.nome ?? "—"}
        {desembarque && <> às {desembarque}</>}
        {Number.isFinite(trecho.paradas) && (
          <>
            {" "}
            · {trecho.paradas} {trecho.paradas === 1 ? "parada" : "paradas"}
          </>
        )}
      </p>
      {Number.isFinite(trecho.intervaloMinutos) && (
        <p className="text-sm text-salvia">Passa a cada {trecho.intervaloMinutos} min</p>
      )}
      <div className="mt-1 flex flex-wrap items-start gap-x-3 gap-y-2">
        {trecho.linha?.operadora && (
          <span className="rounded-pill border border-indigo-200 bg-indigo-50 px-3 py-0.5 text-[0.65rem] font-bold text-indigo-800 uppercase">
            {trecho.linha.operadora}
          </span>
        )}
        <div className="min-w-0 flex-1 text-xs">
          {trecho.tipo === "ONIBUS" ? (
            <PrevisaoAoVivo aoVivo={trecho.aoVivo} embarque={trecho.embarque?.horario} compacta />
          ) : (
            <p className="flex items-start gap-2 text-salvia">
              <Icon nome="acessibilidade" className="size-4 shrink-0" />
              Acessibilidade da estação não informada pelas fontes usadas.
            </p>
          )}
        </div>
      </div>
    </>
  );
}
