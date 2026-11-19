import Icon from "@/components/ui/Icon";
import { formatarDuracao, formatarMetros, horaDe, horariosDosTrechos } from "@/lib/percurso";
import PrevisaoAoVivo from "./PrevisaoAoVivo";
import { SeloLinha } from "./ResumoRota";

/**
 * Linha do tempo de uma opção: horário à esquerda, o que fazer à direita,
 * terminando na chegada à unidade. Os horários de ônibus e metrô são os da API;
 * os das caminhadas são somados a partir deles.
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
        <p className="font-semibold text-pinho">Chegada</p>
        {destino && <p className="text-salvia">{destino}</p>}
      </Passo>
    </ol>
  );
}

function Passo({ hora, tipo, ultimo = false, children }) {
  const marcador =
    tipo === "A_PE"
      ? "border-2 border-linha bg-papel text-pinho"
      : tipo === "CHEGADA"
        ? "bg-lima text-pinho"
        : "bg-pinho text-papel";
  const icone = tipo === "A_PE" ? "caminhar" : tipo === "CHEGADA" ? "pin" : tipo === "ONIBUS" ? "onibus" : "trem";
  return (
    <li className="relative grid grid-cols-[3.25rem_2.5rem_1fr] gap-x-3 pb-6 last:pb-0">
      <span className="pt-2 text-right font-mono text-sm font-semibold text-pinho">{hora ?? ""}</span>
      <span className="relative flex justify-center">
        {!ultimo && <span aria-hidden="true" className="absolute top-10 -bottom-6 w-0.5 bg-linha" />}
        <span
          aria-hidden="true"
          className={`relative z-[1] flex size-10 items-center justify-center rounded-full ${marcador}`}
        >
          <Icon nome={icone} className="size-5" />
        </span>
      </span>
      <div className="flex min-w-0 flex-col gap-1.5 pt-1.5">{children}</div>
    </li>
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
  const desembarque = horaDe(trecho.desembarque?.horario);
  // O selo já diz o modo ("Ônibus", "Metrô") para o leitor de tela.
  const verbo = trecho.tipo === "OUTRO" ? "Embarque no" : "Pegue o";
  return (
    <>
      <p className="flex flex-wrap items-center gap-x-2 gap-y-1 font-semibold text-pinho">
        {verbo} <SeloLinha trecho={trecho} />
        {trecho.sentido && <span className="font-normal text-salvia">sentido {trecho.sentido}</span>}
      </p>
      {trecho.embarque?.nome && <p>Embarque em {trecho.embarque.nome}</p>}
      <p>
        Desça em <span className="font-semibold">{trecho.desembarque?.nome ?? "—"}</span>
        {desembarque && <> às {desembarque}</>}
        {Number.isFinite(trecho.paradas) && (
          <span className="text-salvia">
            {" "}
            · {trecho.paradas} {trecho.paradas === 1 ? "parada" : "paradas"}
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
        <PrevisaoAoVivo aoVivo={trecho.aoVivo} embarque={trecho.embarque?.horario} />
      ) : (
        <p className="flex items-start gap-2 text-sm text-salvia">
          <Icon nome="acessibilidade" className="mt-0.5 size-4 shrink-0" />
          Acessibilidade da estação não informada pelas fontes usadas.
        </p>
      )}
    </>
  );
}
