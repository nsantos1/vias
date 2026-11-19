import Link from "next/link";
import ValorInformado from "@/components/estados/ValorInformado";
import Icon from "@/components/ui/Icon";
import { formatarDistancia } from "@/lib/distancia";
import { nomeProprio, textoLegivel } from "@/lib/unidade";

/**
 * Item da lista "Outras unidades próximas" (referência final de 19/11, D-22).
 * O cartão inteiro é um link para o detalhe, com área de toque grande.
 * À direita, só o que o resumo da API traz: SUS quando o CNES diz que sim.
 */
export default function CardUnidade({ unidade, comLocalizacao }) {
  const distancia = formatarDistancia(unidade.distanciaKm)?.replace(/^≈\s*/, "");
  const local = [textoLegivel(unidade.tipoUnidade), nomeProprio(unidade.bairro)].filter(Boolean).join(" · ");

  return (
    <Link
      href={`/unidades/${encodeURIComponent(unidade.id)}`}
      className="cartao-unidade group flex items-center gap-4 rounded-2xl bg-superficie px-5 py-4"
    >
      <div className="flex min-w-0 flex-1 flex-col gap-0.5">
        {comLocalizacao && (
          <p className="text-sm font-medium text-rota">
            {distancia ? (
              <>
                A {distancia}
                <span className="sr-only"> em linha reta</span>
              </>
            ) : (
              <span className="text-salvia">Sem coordenadas na fonte</span>
            )}
          </p>
        )}
        <p className="font-display leading-snug font-bold text-pinho group-hover:underline">{unidade.nome}</p>
        <p className="text-sm text-salvia">
          <ValorInformado valor={local || null} />
        </p>
      </div>
      {unidade.atendeSus === "SIM" && (
        <span className="hidden shrink-0 items-center gap-1.5 text-sm text-grafite sm:flex">
          <Icon nome="check" className="size-4 text-rota" />
          Atende SUS
        </span>
      )}
      <Icon nome="avancar" className="size-5 shrink-0 text-pinho transition-transform group-hover:translate-x-1" />
    </Link>
  );
}
