"use client";

import dynamic from "next/dynamic";
import { useEffect, useRef, useState } from "react";
import Alert from "@/components/ui/Alert";
import Etapas from "@/components/ui/Etapas";
import Icon from "@/components/ui/Icon";
import Skeleton from "@/components/ui/Skeleton";
import { cn } from "@/lib/cn";
import {
  escolherDestaque,
  formatarDuracao,
  horaDe,
  linhasDoMapa,
  linkComoChegar,
  minutosDeSobra,
  minutosEntre,
  numero,
  onibusAcessivelParaEmbarque,
} from "@/lib/percurso";
import ListaTrechos from "./ListaTrechos";
import ResumoRota from "./ResumoRota";

// O Leaflet só roda no navegador.
const MapaPercurso = dynamic(() => import("./MapaPercurso"), {
  ssr: false,
  loading: () => <Skeleton className="h-80 w-full" />,
});

/**
 * Resultado do POST /api/percursos em tela cheia (referência final de 19/11, D-25):
 * 1. cartão escuro com "Faltam X para sair", a chegada prevista e a rota;
 * 2. à esquerda, o mapa e as opções ("Escolha como ir"); à direita, o passo a passo;
 * 3. "Sobre estes horários" e "Abrir no Google Maps".
 * Tudo vem da API (Google Routes + SPTrans); a tela só organiza.
 */
export default function ResultadoPercurso({ dados, origem, aoAlterar }) {
  const opcoes = dados.opcoes ?? [];
  const comHorario = Boolean(dados.horarioAtendimento);
  const [escolhida, setEscolhida] = useState(null);
  const titulo = useRef(null);

  // Ao calcular, leva a pessoa (e o foco do leitor de tela) ao topo do resultado.
  useEffect(() => {
    window.scrollTo?.({ top: 0 });
    titulo.current?.focus({ preventScroll: true });
  }, []);

  const atual = opcoes.includes(escolhida) ? escolhida : escolherDestaque(opcoes, comHorario);
  const mapas = linkComoChegar(dados.unidade);

  return (
    <div className="percurso-resultado relative isolate">
      <div className="mx-auto flex w-full max-w-[112rem] flex-col gap-8 px-4 pb-10 sm:px-6 lg:px-16">
        {/* Selo do cabeçalho, à direita do logo (como na referência) */}
        <p className="selo-etapa hidden items-center rounded-pill bg-superficie text-sm lg:flex">
          <span className="flex items-center gap-3 py-3.5 pr-6 pl-6 font-semibold tracking-[0.12em] text-pinho uppercase">
            <span aria-hidden="true" className="size-2.5 rounded-full bg-rota" />
            Etapa 3 de 3
          </span>
          <span aria-hidden="true" className="h-7 w-px bg-linha" />
          <span className="py-3.5 pr-24 pl-6 font-medium tracking-[0.16em] text-salvia uppercase">Sua rota</span>
        </p>

        <div className="surgir flex flex-col gap-5">
          <Etapas atual={3} percursoDisponivel semRotulo className="max-w-[42rem]" />
          <div className="flex flex-wrap items-center gap-3">
            <p className="w-fit rounded-pill border border-rota/20 bg-nevoa px-6 py-2 text-xs font-semibold tracking-wide text-rota uppercase">
              Planejamento de deslocamento
            </p>
            {aoAlterar && (
              <button
                type="button"
                onClick={aoAlterar}
                className="inline-flex min-h-11 items-center gap-2 rounded-pill px-3 text-sm font-semibold text-pinho underline decoration-linha underline-offset-4 hover:decoration-rota"
              >
                <Icon nome="relogio" className="size-4 text-rota" />
                Alterar horário
              </button>
            )}
          </div>
        </div>

        <h2 id="titulo-percurso" ref={titulo} tabIndex={-1} className="sr-only">
          Percurso calculado até {dados.unidade?.nome ?? "a unidade"}
        </h2>

        {!opcoes.length || !atual ? (
          <Alert tom="aviso" titulo="Sem percurso para este horário">
            {dados.avisos?.[0] ?? "Não encontramos percurso de transporte público até esta unidade."}
          </Alert>
        ) : (
          <>
            <Destaque opcao={atual} dados={dados} />

            <div className="grid grid-cols-[minmax(0,1fr)] items-start gap-8 lg:grid-cols-[minmax(0,0.82fr)_minmax(0,1fr)]">
              <div className="flex flex-col gap-8">
                <Mapa opcao={atual} dados={dados} origem={origem} />
                <Opcoes opcoes={opcoes} atual={atual} comHorario={comHorario} aoEscolher={setEscolhida} />
              </div>
              <PassoAPasso opcao={atual} dados={dados} />
            </div>
          </>
        )}

        <div className="grid grid-cols-[minmax(0,1fr)] gap-6 lg:grid-cols-2">
          <details className="cartao-claro surgir group rounded-[1.75rem] bg-superficie" style={{ "--atraso": "300ms" }}>
            <summary className="flex min-h-24 cursor-pointer list-none items-center gap-6 px-8 py-6 [&::-webkit-details-marker]:hidden">
              <Icon nome="avancar" className="size-6 rotate-90 text-pinho transition-transform group-open:-rotate-90" />
              <span className="flex flex-col gap-1">
                <span className="text-lg font-bold text-pinho">Sobre estes horários</span>
                <span className="text-sm font-medium text-salvia">Detalhes de cálculo e atualização dos horários</span>
              </span>
            </summary>
            <div className="flex flex-col gap-3 px-8 pb-7 text-sm text-salvia">
              <ul className="flex flex-col gap-1.5">
                {(opcoes.length ? dados.avisos : dados.avisos?.slice(1))?.map((aviso) => (
                  <li key={aviso} className="flex items-start gap-2">
                    <Icon nome="info" className="mt-0.5 size-4 shrink-0 text-rota" />
                    {aviso}
                  </li>
                ))}
              </ul>
              <p>
                Fontes: {dados.fontes?.rotas ?? "serviço de rotas"}
                {dados.fontes?.aoVivo && <> · previsão ao vivo: {dados.fontes.aoVivo}</>} · mapa: OpenStreetMap
              </p>
            </div>
          </details>

          {mapas && (
            <a
              href={mapas}
              target="_blank"
              rel="noopener noreferrer"
              className="cartao-mapas surgir group flex min-h-24 items-center gap-6 rounded-[1.75rem] px-8 text-papel"
              style={{ "--atraso": "360ms" }}
            >
              <span className="flex size-10 shrink-0 items-center justify-center rounded-full bg-papel/10 ring-1 ring-papel/20">
                <Icon nome="pin" className="size-5 text-lima" />
              </span>
              <span className="flex-1 text-lg font-bold">Abrir no Google Maps</span>
              <span className="sr-only">(abre em nova aba)</span>
              <Icon
                nome="seta"
                className="size-6 -rotate-45 text-lima transition-transform group-hover:translate-x-1 group-hover:-translate-y-1"
              />
            </a>
          )}
        </div>

        {/* Rodapé claro desta tela (o rodapé escuro comum fica escondido aqui) */}
        <footer className="mt-4 flex flex-col gap-3 border-t border-linha pt-8 text-sm text-salvia sm:flex-row sm:items-start sm:justify-between">
          <div className="flex flex-col gap-2">
            <p>
              <span className="font-bold tracking-wide text-pinho">VIAS</span>
              <span className="ml-4 font-medium">Via Inteligente de Acesso à Saúde</span>
            </p>
            <p className="text-xs">
              As previsões de transporte podem mudar. Consulte os horários atualizados antes de sair. Projeto
              acadêmico da FIAP Global Solution 2026: o VIAS não substitui a orientação de um profissional de saúde.
            </p>
          </div>
          <p className="shrink-0 font-mono text-xs tracking-[0.18em] uppercase">Rota de transporte público</p>
        </footer>
      </div>
    </div>
  );
}

/** Cartão escuro: quanto falta para sair, chegada prevista, tempo total e a rota. */
function Destaque({ opcao, dados }) {
  const comHorario = Boolean(dados.horarioAtendimento);
  const sobra = comHorario ? minutosDeSobra(opcao.chegada, dados.horarioAtendimento) : null;
  const faltam = minutosEntre(dados.calculadoEm, opcao.saida);
  const duracao = formatarDuracao(opcao.duracaoMinutos);
  // Só destaca um ônibus acessível que passe perto do horário de embarque planejado.
  const acessivel = opcao.trechos
    ?.filter((t) => t.tipo === "ONIBUS")
    .map((t) => ({ linha: t.linha?.codigo, onibus: onibusAcessivelParaEmbarque(t) }))
    .find((x) => x.onibus);

  const tituloSaida =
    faltam === null ? `Saia às ${horaDe(opcao.saida)}.` : faltam <= 0 ? "É hora de sair." : `Faltam ${formatarDuracao(faltam)} para sair.`;

  return (
    <article
      aria-labelledby="titulo-saida"
      className="cartao-saida surgir relative grid grid-cols-[minmax(0,1fr)] gap-8 overflow-hidden rounded-[2rem] p-7 text-papel sm:p-11 lg:grid-cols-[1fr_auto_1.15fr] lg:items-center"
      style={{ "--atraso": "80ms" }}
    >
      <div className="relative flex flex-col gap-4">
        <p className="flex w-fit items-center gap-2.5 rounded-pill border border-lima/30 bg-papel/5 px-5 py-1.5 text-xs font-bold tracking-wide text-lima uppercase">
          <span aria-hidden="true" className="ponto-vivo size-2 rounded-full bg-lima" />
          {comHorario ? `Atendimento às ${horaDe(dados.horarioAtendimento)}` : "Saindo agora"}
        </p>
        <h3 id="titulo-saida" className="font-display text-[2.2rem] leading-tight font-bold text-papel sm:text-[2.6rem]">
          {tituloSaida}
        </h3>
        <p className="text-lg font-semibold text-papel sm:text-xl">
          {comHorario ? (
            <>
              Saia até {horaDe(opcao.saida)} e chegue às {horaDe(opcao.chegada)}
              {sobra !== null &&
                (sobra >= 0
                  ? `, ${formatarDuracao(sobra) ?? "0 min"} antes do atendimento.`
                  : `, ${formatarDuracao(-sobra)} depois do horário do atendimento.`)}
            </>
          ) : (
            <>
              Você chega às {horaDe(opcao.chegada)}
              {duracao ? ` · ${duracao} de viagem.` : "."}
            </>
          )}
        </p>
        <p className="text-sm text-papel/80">
          {!comHorario && <>Saída às {horaDe(opcao.saida)}. </>}
          Calculado às {horaDe(dados.calculadoEm)}. Os horários podem mudar.
        </p>
        {acessivel && (
          <p className="flex items-start gap-2 rounded-2xl bg-papel/10 p-3 text-sm">
            <Icon nome="acessibilidade" className="mt-0.5 size-5 shrink-0 text-lima" />
            <span>
              Ônibus acessível{acessivel.linha && <> da linha {acessivel.linha}</>} previsto no ponto às{" "}
              <strong>{horaDe(acessivel.onibus.previsto)}</strong>, perto do seu embarque (SPTrans, ao vivo).
            </span>
          </p>
        )}
        {opcao.chegaATempo === false && (
          <p className="w-fit rounded-pill bg-aviso-fundo px-3 py-1 text-sm font-semibold text-aviso">
            Nenhuma opção chega no horário desejado
          </p>
        )}
      </div>

      <span aria-hidden="true" className="hidden h-44 w-px bg-papel/15 lg:block" />

      <div className="relative flex flex-col gap-6">
        <div className="flex flex-wrap items-end gap-x-10 gap-y-5">
          <div className="flex flex-col gap-1">
            <p className="text-xs font-semibold tracking-[0.2em] text-papel/80 uppercase">Chegada prevista</p>
            <p className="font-display text-7xl leading-none font-bold tracking-[-0.04em] text-papel tabular-nums sm:text-[5.5rem]">
              {horaDe(opcao.chegada)}
            </p>
          </div>
          {duracao && (
            <p className="flex items-center gap-4 rounded-pill border border-papel/20 bg-papel/5 py-3 pr-12 pl-5">
              <span className="flex size-9 items-center justify-center rounded-full bg-lima text-pinho">
                <Icon nome="relogio" className="size-5" />
              </span>
              <span className="flex flex-col">
                <span className="text-xs font-semibold tracking-[0.16em] text-papel/80 uppercase">Tempo total</span>
                <span className="text-xl font-bold">{duracao}</span>
              </span>
            </p>
          )}
        </div>
        <div className="flex flex-wrap items-center gap-3">
          <span className="rounded-pill border border-papel/25 px-6 py-1 text-xs font-bold text-lima uppercase">
            {opcao.recomendada ? "Rota ideal" : "Opção escolhida"}
          </span>
          <ResumoRota trechos={opcao.trechos} claro />
        </div>
      </div>
    </article>
  );
}

function Mapa({ opcao, dados, origem }) {
  const linhas = linhasDoMapa(opcao.trechos);
  const lat = numero(dados.unidade?.latitude);
  const lon = numero(dados.unidade?.longitude);
  const destino = lat !== null && lon !== null ? { latitude: lat, longitude: lon, nome: dados.unidade?.nome } : null;
  const paradas = opcao.trechos
    .filter((t) => t.tipo !== "A_PE")
    .flatMap((t) => [t.embarque, t.desembarque])
    .filter((p) => numero(p?.latitude) !== null && numero(p?.longitude) !== null);

  return (
    <section
      aria-labelledby="titulo-mapa"
      className="cartao-claro surgir flex flex-col gap-5 rounded-[1.75rem] bg-superficie p-6 sm:p-9"
      style={{ "--atraso": "140ms" }}
    >
      <div className="flex items-start justify-between gap-4">
        <div className="flex flex-col gap-3">
          <h3 id="titulo-mapa" className="text-[1.7rem] leading-tight font-bold">
            Sua rota no mapa
          </h3>
          <p className="flex flex-col gap-0.5">
            <span className="text-xs font-semibold tracking-[0.18em] text-salvia uppercase">Origem atual</span>
            <span className="text-lg font-semibold text-pinho">Você</span>
          </p>
        </div>
        <span className="mt-8 shrink-0 rounded-pill border border-rota/20 bg-nevoa px-6 py-2 text-xs font-semibold text-rota uppercase">
          Trajeto ativo
        </span>
      </div>
      <figure className="relative isolate overflow-hidden rounded-3xl border border-linha">
        <MapaPercurso origem={origem} destino={destino} linhas={linhas} paradas={paradas} />
        <figcaption className="absolute inset-x-6 bottom-4 z-[500] flex flex-wrap items-center gap-x-6 gap-y-1 rounded-pill bg-superficie/95 px-5 py-2 text-xs font-medium text-grafite shadow-sm">
          <span className="flex items-center gap-1.5">
            <Icon nome="caminhar" className="size-4 text-grafite" /> a pé
          </span>
          <span className="flex items-center gap-1.5">
            <span aria-hidden="true" className="inline-block h-2.5 w-5 rounded-full bg-rota" /> ônibus
          </span>
          <span className="flex items-center gap-1.5">
            <span aria-hidden="true" className="inline-block h-2.5 w-5 rounded-full bg-[#3b82b0]" /> metrô e trem na cor
            da linha
          </span>
          {!linhas.length && <span>O serviço de rotas não mandou o desenho do caminho.</span>}
        </figcaption>
      </figure>
    </section>
  );
}

const OPCOES_VISIVEIS = 5;

function Opcoes({ opcoes, atual, comHorario, aoEscolher }) {
  const [todas, setTodas] = useState(false);
  // Mostra as 5 primeiras (como na referência), sem esconder a opção escolhida.
  const visiveis = todas
    ? opcoes
    : opcoes.filter((o, i) => i < OPCOES_VISIVEIS || o === atual);
  const escondidas = opcoes.length - visiveis.length;
  return (
    <section aria-labelledby="titulo-opcoes" className="surgir flex flex-col gap-4" style={{ "--atraso": "200ms" }}>
      <div className="flex items-start justify-between gap-4 px-2">
        <div className="flex flex-col gap-1">
          <h3 id="titulo-opcoes" className="flex items-center gap-3 text-[1.7rem] leading-tight font-bold">
            <span className="flex size-8 items-center justify-center rounded-full bg-nevoa text-rota">
              <Icon nome="caminhar" className="size-4" />
            </span>
            Escolha como ir
          </h3>
          <p className="pl-11 text-sm text-salvia">Compare horários e duração antes de decidir.</p>
        </div>
        <p className="mt-2 shrink-0 font-mono text-xs tracking-[0.18em] text-salvia uppercase">
          {opcoes.length} {opcoes.length === 1 ? "opção" : "opções"}
        </p>
      </div>
      <ul className="flex flex-col gap-3">
        {visiveis.map((opcao, i) => (
          <li key={`${opcao.saida}-${i}`}>
            <CartaoOpcao
              opcao={opcao}
              comHorario={comHorario}
              selecionada={opcao === atual}
              aoEscolher={() => aoEscolher(opcao)}
            />
          </li>
        ))}
      </ul>
      {(escondidas > 0 || todas) && opcoes.length > OPCOES_VISIVEIS && (
        <button
          type="button"
          onClick={() => setTodas((v) => !v)}
          aria-expanded={todas}
          className="mx-auto inline-flex min-h-11 items-center gap-2 rounded-pill border border-linha bg-superficie px-6 text-sm font-semibold text-pinho shadow-sm transition-colors hover:border-rota"
        >
          {todas ? "Mostrar menos opções" : `Ver mais ${escondidas} ${escondidas === 1 ? "opção" : "opções"}`}
          <Icon nome="avancar" className={cn("size-4 transition-transform", todas ? "-rotate-90" : "rotate-90")} />
        </button>
      )}
    </section>
  );
}

function CartaoOpcao({ opcao, comHorario, selecionada, aoEscolher }) {
  const duracao = formatarDuracao(opcao.duracaoMinutos);
  return (
    <button
      type="button"
      aria-pressed={selecionada}
      onClick={aoEscolher}
      className={cn(
        "cartao-opcao relative flex w-full flex-col gap-2.5 overflow-hidden rounded-2xl bg-superficie px-6 py-4 text-left sm:px-8",
        selecionada && "cartao-opcao--escolhida",
      )}
    >
      <span className="flex w-full flex-wrap items-baseline justify-between gap-x-4 gap-y-1">
        <span className="text-lg font-bold text-pinho">
          {comHorario ? "Saia até" : "Saia às"} {horaDe(opcao.saida)}
        </span>
        <span className="font-medium text-salvia">
          chega {horaDe(opcao.chegada)}
          {duracao && <> · {duracao}</>}
        </span>
      </span>
      <span className="flex w-full flex-wrap items-end justify-between gap-3">
        <ResumoRota trechos={opcao.trechos} />
        <span className="flex flex-wrap gap-2">
          {opcao.recomendada && (
            <span className="rounded-pill bg-nevoa px-6 py-1 text-xs font-semibold text-rota uppercase">Recomendada</span>
          )}
          {opcao.chegaATempo === false && (
            <span className="rounded-pill bg-aviso-fundo px-3 py-1 text-xs font-semibold text-aviso">
              Chega depois do horário
            </span>
          )}
        </span>
      </span>
      {selecionada && <span className="sr-only">(opção mostrada no mapa e no passo a passo)</span>}
    </button>
  );
}

function PassoAPasso({ opcao, dados }) {
  const trechos = opcao.trechos ?? [];
  const duracao = formatarDuracao(opcao.duracaoMinutos);
  return (
    <section
      aria-labelledby="titulo-passos"
      className="cartao-claro surgir flex flex-col gap-6 rounded-[1.75rem] bg-superficie p-6 sm:p-10"
      style={{ "--atraso": "180ms" }}
    >
      <div className="flex items-end justify-between gap-4">
        <div className="flex flex-col gap-2">
          <span className="w-fit rounded-pill border border-rota/20 bg-nevoa px-6 py-1.5 text-xs font-semibold text-rota uppercase">
            Rota detalhada
          </span>
          <h3 id="titulo-passos" className="text-[1.9rem] leading-tight font-bold">
            Passo a passo
          </h3>
        </div>
        <p className="flex flex-col items-end gap-1 text-right">
          <span className="font-mono text-xs tracking-[0.18em] text-salvia uppercase">
            {trechos.length} {trechos.length === 1 ? "trecho" : "trechos"}
          </span>
          {duracao && <span className="text-xl font-bold text-pinho">{duracao}</span>}
        </p>
      </div>

      <div className="flex items-center gap-4 rounded-2xl border border-linha bg-papel/60 px-5 py-3">
        <span className="flex items-center gap-3">
          <span aria-hidden="true" className="flex size-5 items-center justify-center rounded-full border-2 border-rota">
            <span className="size-2 rounded-full bg-rota" />
          </span>
          <span className="flex flex-col">
            <span className="text-[0.65rem] font-semibold tracking-[0.16em] text-salvia uppercase">Origem</span>
            <span className="font-semibold text-pinho">Você</span>
          </span>
        </span>
        <span aria-hidden="true" className="trilha-pontilhada h-0.5 flex-1" />
        <span className="flex min-w-0 items-center gap-3">
          <Icon nome="pin" className="size-5 shrink-0 text-rota" />
          <span className="flex min-w-0 flex-col">
            <span className="text-[0.65rem] font-semibold tracking-[0.16em] text-salvia uppercase">Destino</span>
            <span className="truncate font-semibold text-pinho uppercase">{dados.unidade?.nome ?? "Unidade"}</span>
          </span>
        </span>
      </div>

      <ListaTrechos opcao={opcao} destino={dados.unidade?.nome} />
    </section>
  );
}
