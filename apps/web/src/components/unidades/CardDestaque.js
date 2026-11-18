import ValorInformado from "@/components/estados/ValorInformado";
import Button from "@/components/ui/Button";
import Icon from "@/components/ui/Icon";
import { formatarDistancia } from "@/lib/distancia";
import { textoAtendeSus, textoFonte } from "@/lib/unidade";
import LinhaInfo from "./LinhaInfo";

/**
 * Unidade em destaque no resultado (referência 2): a mais próxima quando há
 * localização; sem localização, a primeira da lista, sem falar em proximidade.
 * Mostra só o que a API devolveu.
 */
export default function CardDestaque({ unidade, servicoNome, servicoDescricao, comLocalizacao }) {
  const distancia = formatarDistancia(unidade.distanciaKm);
  const tituloId = `destaque-${unidade.id}`;

  return (
    <article
      aria-labelledby={tituloId}
      className="flex flex-col gap-5 rounded-3xl border border-linha bg-superficie p-5 shadow-sm sm:p-7"
    >
      <div className="flex flex-col gap-1">
        <p className="font-mono text-label uppercase text-rota">
          {comLocalizacao && distancia ? "Mais próxima de você" : "Unidade de saúde"}
        </p>
        <h2 id={tituloId} className="font-display text-3xl leading-tight font-bold text-pinho">
          {unidade.nome}
        </h2>
        <p className="text-salvia">
          <ValorInformado valor={unidade.tipoUnidade} />
        </p>
      </div>

      {servicoNome && (
        <div className="flex items-center gap-4 rounded-2xl bg-nevoa p-4">
          <span className="flex size-11 shrink-0 items-center justify-center rounded-full bg-rota text-papel">
            <Icon nome="check" className="size-6" />
          </span>
          <div>
            <p className="font-display text-xl font-semibold text-pinho">{servicoNome} no cadastro</p>
            {/* A descrição vem da API e diz de onde veio o vínculo e o que ele não garante. */}
            <p className="text-salvia">{servicoDescricao || "Serviço identificado na base consultada."}</p>
          </div>
        </div>
      )}

      <dl>
        <LinhaInfo icone="lista" rotulo="Serviço">
          <ValorInformado valor={servicoNome} />
        </LinhaInfo>
        <LinhaInfo icone="pessoa" rotulo="Atendimento SUS">
          {textoAtendeSus(unidade.atendeSus)}
        </LinhaInfo>
        <LinhaInfo icone="pin" rotulo="Distância">
          {distancia ? (
            <>
              {distancia} <span className="text-salvia">em linha reta</span>
            </>
          ) : comLocalizacao ? (
            <span className="text-salvia">A fonte não informa as coordenadas desta unidade</span>
          ) : (
            <span className="text-salvia">Sem sua localização</span>
          )}
        </LinhaInfo>
        <LinhaInfo icone="alvo" rotulo="Bairro">
          <ValorInformado valor={unidade.bairro} />
        </LinhaInfo>
        <LinhaInfo icone="base" rotulo="Fonte">
          <ValorInformado valor={textoFonte(unidade.fonte)} />
        </LinhaInfo>
      </dl>

      <p className="flex items-start gap-3 text-salvia">
        <Icon nome="info" className="mt-0.5 size-6 shrink-0" />
        O cadastro do serviço não confirma disponibilidade de vagas ou agendamento.
      </p>

      <Button href={`/unidades/${encodeURIComponent(unidade.id)}`} largo seta>
        Ver unidade
      </Button>
    </article>
  );
}
