"use client";

import Link from "next/link";
import ValorInformado from "@/components/estados/ValorInformado";
import Button from "@/components/ui/Button";
import Icon from "@/components/ui/Icon";
import Skeleton from "@/components/ui/Skeleton";
import { ESTADOS, useConsulta } from "@/hooks/useConsulta";
import { formatarDistancia } from "@/lib/distancia";
import { formatarTelefone, nomeProprio, textoAtendeSus, textoFonte, textoLegivel } from "@/lib/unidade";
import { obterUnidade } from "@/services/api/unidades";
import LinhaInfo from "./LinhaInfo";

/**
 * Unidade em destaque no resultado (referência final de 19/11, D-22): a mais
 * próxima quando há localização; sem localização, a primeira da lista, sem
 * falar em proximidade.
 *
 * O resumo da lista não traz endereço, telefone nem horário; por isso o cartão
 * busca o detalhe (GET /api/unidades/{id}) só desta unidade. Mostra só o que a
 * API devolveu: o que faltar aparece como "Não informado pela fonte".
 */
export default function CardDestaque({ unidade, servicoNome, servicoDescricao, comLocalizacao }) {
  const distancia = formatarDistancia(unidade.distanciaKm)?.replace(/^≈\s*/, "");
  const tituloId = `destaque-${unidade.id}`;
  const href = `/unidades/${encodeURIComponent(unidade.id)}`;
  const detalhe = useConsulta(`unidade:${unidade.id}`, (signal) => obterUnidade(unidade.id, { signal }));
  const d = detalhe.estado === ESTADOS.SUCESSO ? detalhe.dados : null;
  const carregando = detalhe.estado === ESTADOS.CARREGANDO;

  const rua = d?.endereco
    ? [nomeProprio(d.endereco.logradouro), d.endereco.numero].filter(Boolean).join(", ")
    : null;
  const endereco = rua ? [rua, d.endereco.uf].filter(Boolean).join(" - ") : null;
  const telefone = formatarTelefone(d?.telefone);

  // Enquanto o detalhe carrega, a linha mostra um traço animado; se ele falhar,
  // a linha manda para a página da unidade em vez de dizer que não existe.
  const doDetalhe = (valor, formatar = (v) => v) =>
    carregando ? (
      <Skeleton className="h-4 w-40" />
    ) : detalhe.estado === ESTADOS.ERRO ? (
      <span className="text-salvia">Veja na página da unidade</span>
    ) : (
      <ValorInformado valor={valor}>{valor ? formatar(valor) : null}</ValorInformado>
    );

  return (
    <article
      aria-labelledby={tituloId}
      className="cartao-destaque surgir flex flex-col gap-4 rounded-[1.75rem] bg-superficie p-5 sm:p-7"
      style={{ "--atraso": "160ms" }}
    >
      <div className="flex flex-col gap-2">
        {comLocalizacao && distancia ? (
          <p className="flex items-center gap-2.5 font-medium text-rota">
            <span className="pino-pulso relative flex size-6 items-center justify-center">
              <Icon nome="pin" className="size-6" />
            </span>
            A {distancia} da sua localização
            <span className="sr-only">, em linha reta</span>
          </p>
        ) : (
          <p className="font-mono text-label uppercase text-rota">Unidade de saúde</p>
        )}
        <h2 id={tituloId} className="font-display text-[1.6rem] leading-tight font-bold text-pinho">
          {unidade.nome}
        </h2>
        {unidade.tipoUnidade && (
          <span className="w-fit rounded-pill bg-nevoa px-3 py-0.5 text-sm font-semibold text-rota">
            {textoLegivel(unidade.tipoUnidade)}
          </span>
        )}
      </div>

      {servicoNome && (
        <Link
          href={href}
          className="caixa-servico group flex items-center gap-4 rounded-2xl p-4 transition-colors sm:p-5"
        >
          <span className="flex size-11 shrink-0 items-center justify-center rounded-full bg-rota text-papel shadow-[0_6px_16px_rgb(45_124_96/0.35)]">
            <Icon nome="check" className="size-6" />
          </span>
          <span className="flex min-w-0 flex-1 flex-col gap-0.5">
            <span className="font-semibold text-pinho">{servicoNome} no cadastro</span>
            {/* A descrição vem da API e diz de onde veio o vínculo e o que ele não garante. */}
            <span className="text-sm text-grafite/80">
              {servicoDescricao || "Serviço identificado na base consultada."}
            </span>
          </span>
          <Icon nome="avancar" className="size-5 shrink-0 text-pinho transition-transform group-hover:translate-x-1" />
          <span className="sr-only">(abre a página da unidade)</span>
        </Link>
      )}

      <dl>
        <LinhaInfo icone="hospital" rotulo="Endereço" variante="cartao">
          {doDetalhe(endereco)}
        </LinhaInfo>
        <LinhaInfo icone="relogio" rotulo="Atendimento" variante="cartao">
          {doDetalhe(textoLegivel(d?.horarioFuncionamento))}
        </LinhaInfo>
        <LinhaInfo icone="telefone" rotulo="Telefone" variante="cartao">
          {doDetalhe(telefone, (t) => (
            <a href={`tel:${t.replace(/\D/g, "")}`} className="hover:text-rota hover:underline">
              {t}
            </a>
          ))}
        </LinhaInfo>
        <LinhaInfo icone="mapa" rotulo="Bairro" variante="cartao">
          <ValorInformado valor={nomeProprio(unidade.bairro)} />
        </LinhaInfo>
        <LinhaInfo icone="pessoa" rotulo="Atendimento SUS" variante="cartao">
          {textoAtendeSus(unidade.atendeSus)}
        </LinhaInfo>
        <LinhaInfo icone="info" rotulo="Como chegar" variante="cartao">
          <Link href={`${href}/percurso`} className="text-grafite hover:text-rota hover:underline">
            Veja rotas e horários de transporte
          </Link>
        </LinhaInfo>
      </dl>

      <Button href={href} largo seta className="botao-brilho min-h-14">
        Ver unidade
      </Button>

      <p className="text-center text-xs text-salvia">
        Fonte: <ValorInformado valor={textoFonte(unidade.fonte)} />. O cadastro não confirma vaga nem agendamento.
      </p>
    </article>
  );
}
