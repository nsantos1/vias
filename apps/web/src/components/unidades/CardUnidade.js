import Link from "next/link";
import ValorInformado from "@/components/estados/ValorInformado";
import Icon from "@/components/ui/Icon";
import { formatarDistancia } from "@/lib/distancia";
import { textoAtendeSus } from "@/lib/unidade";

/**
 * Item compacto da lista "Outras unidades" (abaixo do destaque).
 * O card inteiro é um link para o detalhe, com área de toque grande.
 */
export default function CardUnidade({ unidade, comLocalizacao }) {
  const distancia = formatarDistancia(unidade.distanciaKm);

  return (
    <Link
      href={`/unidades/${encodeURIComponent(unidade.id)}`}
      className="group flex items-center gap-4 rounded-2xl border border-linha bg-superficie p-4 transition-colors hover:border-rota hover:bg-nevoa/40"
    >
      <div className="flex min-w-0 flex-1 flex-col gap-1">
        <p className="font-mono text-xs uppercase text-rota">
          <ValorInformado valor={unidade.tipoUnidade} />
        </p>
        <p className="font-display text-lg leading-snug font-semibold text-pinho group-hover:underline">
          {unidade.nome}
        </p>
        <p className="text-sm text-salvia">
          <ValorInformado valor={unidade.bairro} /> · SUS: {textoAtendeSus(unidade.atendeSus)}
        </p>
      </div>
      <div className="flex shrink-0 flex-col items-end gap-1 text-right">
        {distancia ? (
          <>
            <span className="font-semibold text-grafite">{distancia}</span>
            <span className="text-xs text-salvia">em linha reta</span>
          </>
        ) : comLocalizacao ? (
          <span className="max-w-24 text-xs text-salvia">Sem coordenadas na fonte</span>
        ) : null}
      </div>
      <Icon nome="seta" className="size-5 shrink-0 text-rota" />
    </Link>
  );
}
