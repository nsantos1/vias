"use client";

import dynamic from "next/dynamic";
import { useEffect, useRef, useState } from "react";
import Alert from "@/components/ui/Alert";
import Badge from "@/components/ui/Badge";
import Button from "@/components/ui/Button";
import Icon from "@/components/ui/Icon";
import Skeleton from "@/components/ui/Skeleton";
import { cn } from "@/lib/cn";
import {
  FILTROS,
  categoriaDaOpcao,
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
  loading: () => <Skeleton className="h-72 w-full sm:h-96" />,
});

/**
 * Resultado do POST /api/percursos (D-20), em quatro blocos:
 * 1. "Saia até HH:MM" da opção escolhida (de início, a recomendada);
 * 2. o mapa com o caminho real do Google;
 * 3. as opções, com filtro ônibus × metrô/trem, para trocar a escolhida;
 * 4. o passo a passo com horários.
 * Tudo vem da API (Google Routes + SPTrans); a tela só organiza.
 */
export default function ResultadoPercurso({ dados, origem }) {
  const opcoes = dados.opcoes ?? [];
  const comHorario = Boolean(dados.horarioAtendimento);
  const [filtro, setFiltro] = useState("TODAS");
  const [escolhida, setEscolhida] = useState(null);
  const titulo = useRef(null);

  // Ao calcular, leva a pessoa (e o foco do leitor de tela) até o resultado.
  useEffect(() => {
    titulo.current?.focus({ preventScroll: true });
    titulo.current?.scrollIntoView?.({ behavior: "smooth", block: "start" });
  }, []);

  const filtros = FILTROS.map((f) => ({
    ...f,
    total: opcoes.filter((o) => f.aceita(categoriaDaOpcao(o))).length,
  }));
  const aceita = FILTROS.find((f) => f.valor === filtro)?.aceita ?? (() => true);
  const visiveis = opcoes.filter((o) => aceita(categoriaDaOpcao(o)));
  const atual = visiveis.includes(escolhida) ? escolhida : escolherDestaque(visiveis, comHorario);
  const mostrarFiltros = filtros.filter((f) => f.valor !== "TODAS" && f.total > 0).length > 1;
  const mapas = linkComoChegar(dados.unidade);

  return (
    <section aria-labelledby="titulo-percurso" className="flex flex-col gap-6">
      <h2 id="titulo-percurso" ref={titulo} tabIndex={-1} className="sr-only">
        Percurso calculado
      </h2>

      {!opcoes.length ? (
        <Alert tom="aviso" titulo="Sem percurso para este horário">
          {dados.avisos?.[0] ?? "Não encontramos percurso de transporte público até esta unidade."}
        </Alert>
      ) : (
        <>
          {atual && <Destaque opcao={atual} dados={dados} />}

          <Mapa opcao={atual} dados={dados} origem={origem} />

          <section aria-labelledby="titulo-opcoes" className="flex flex-col gap-3">
            <div className="flex flex-col gap-3">
              <h3 id="titulo-opcoes" className="text-2xl font-bold">
                Escolha como ir
              </h3>
              {mostrarFiltros && (
                <div role="group" aria-label="Filtrar opções" className="flex flex-wrap gap-2">
                  {filtros
                    .filter((f) => f.total > 0)
                    .map((f) => (
                      <button
                        key={f.valor}
                        type="button"
                        aria-pressed={filtro === f.valor}
                        onClick={() => setFiltro(f.valor)}
                        className={cn(
                          "min-h-11 rounded-pill border px-4 text-sm font-semibold transition-colors",
                          filtro === f.valor
                            ? "border-pinho bg-pinho text-papel"
                            : "border-borda-campo bg-superficie text-grafite hover:bg-nevoa",
                        )}
                      >
                        {f.rotulo} <span className="font-normal opacity-80">({f.total})</span>
                      </button>
                    ))}
                </div>
              )}
            </div>
            <ul className="flex flex-col gap-2">
              {visiveis.map((opcao, i) => (
                <li key={`${opcao.saida}-${i}`}>
                  <CartaoOpcao
                    opcao={opcao}
                    comHorario={comHorario}
                    selecionada={opcao === atual}
                    aoEscolher={() => setEscolhida(opcao)}
                  />
                </li>
              ))}
            </ul>
          </section>

          {atual && (
            <section aria-labelledby="titulo-passos" className="flex flex-col gap-4">
              <h3 id="titulo-passos" className="text-2xl font-bold">
                Passo a passo
              </h3>
              <ListaTrechos opcao={atual} destino={dados.unidade?.nome} />
            </section>
          )}
        </>
      )}

      <details className="rounded-2xl border border-linha bg-superficie p-4 text-sm text-salvia">
        <summary className="cursor-pointer font-semibold text-grafite">Sobre estes horários</summary>
        <ul className="mt-3 flex flex-col gap-1">
          {(opcoes.length ? dados.avisos : dados.avisos?.slice(1))?.map((aviso) => (
            <li key={aviso} className="flex items-start gap-2">
              <Icon nome="info" className="mt-0.5 size-4 shrink-0" />
              {aviso}
            </li>
          ))}
        </ul>
        <p className="mt-3">
          Fontes: {dados.fontes?.rotas ?? "serviço de rotas"}
          {dados.fontes?.aoVivo && <> · previsão ao vivo: {dados.fontes.aoVivo}</>} · mapa: OpenStreetMap
        </p>
      </details>

      {mapas && (
        <Button
          href={mapas}
          target="_blank"
          rel="noopener noreferrer"
          variante="secundario"
          largo
          aria-label="Abrir o caminho no Google Maps (abre em nova aba)"
        >
          Abrir no Google Maps
        </Button>
      )}
    </section>
  );
}

function Destaque({ opcao, dados }) {
  const comHorario = Boolean(dados.horarioAtendimento);
  const sobra = comHorario ? minutosDeSobra(opcao.chegada, dados.horarioAtendimento) : null;
  const faltam = minutosEntre(dados.calculadoEm, opcao.saida);
  // Só destaca um ônibus acessível que passe perto do horário de embarque planejado.
  const acessivel = opcao.trechos
    ?.filter((t) => t.tipo === "ONIBUS")
    .map((t) => ({ linha: t.linha?.codigo, onibus: onibusAcessivelParaEmbarque(t) }))
    .find((x) => x.onibus);

  return (
    <article
      aria-labelledby="titulo-saida"
      className="flex flex-col gap-4 rounded-3xl bg-pinho p-5 text-papel shadow-sm sm:p-7"
    >
      <p className="font-mono text-label uppercase text-lima">
        {comHorario ? `Atendimento às ${horaDe(dados.horarioAtendimento)}` : "Saindo agora"}
      </p>
      <div className="flex flex-col gap-1">
        <h3 id="titulo-saida" className="font-display text-4xl leading-tight font-bold sm:text-5xl">
          {comHorario ? "Saia até" : "Saia às"} {horaDe(opcao.saida)}
        </h3>
        {faltam !== null && (
          <p className="text-lg text-lima">
            {faltam <= 0 ? "É hora de sair." : `Faltam ${formatarDuracao(faltam)} para sair.`}
          </p>
        )}
      </div>
      <p className="text-lg">
        Você chega às <strong>{horaDe(opcao.chegada)}</strong>
        {comHorario && sobra !== null
          ? sobra >= 0
            ? `, ${formatarDuracao(sobra) ?? "0 min"} antes do atendimento.`
            : `, ${formatarDuracao(-sobra)} depois do horário do atendimento.`
          : formatarDuracao(opcao.duracaoMinutos)
            ? ` · ${formatarDuracao(opcao.duracaoMinutos)} de viagem.`
            : "."}
      </p>
      <ResumoRota trechos={opcao.trechos} claro />
      {acessivel && (
        <p className="flex items-start gap-2 rounded-2xl bg-papel/10 p-3">
          <Icon nome="acessibilidade" className="mt-0.5 size-5 shrink-0 text-lima" />
          <span>
            Ônibus acessível{acessivel.linha && <> da linha {acessivel.linha}</>} previsto no ponto às{" "}
            <strong>{horaDe(acessivel.onibus.previsto)}</strong>, perto do seu embarque (SPTrans, ao vivo).
          </span>
        </p>
      )}
      {opcao.chegaATempo === false && (
        <span>
          <Badge tom="aviso">Nenhuma opção chega no horário desejado</Badge>
        </span>
      )}
      {faltam !== null && faltam > 0 && (
        <p className="text-sm text-papel/80">Calculado às {horaDe(dados.calculadoEm)}. Os horários podem mudar.</p>
      )}
    </article>
  );
}

function Mapa({ opcao, dados, origem }) {
  if (!opcao) return null;
  const linhas = linhasDoMapa(opcao.trechos);
  const lat = numero(dados.unidade?.latitude);
  const lon = numero(dados.unidade?.longitude);
  const destino = lat !== null && lon !== null ? { latitude: lat, longitude: lon, nome: dados.unidade?.nome } : null;
  const paradas = opcao.trechos
    .filter((t) => t.tipo !== "A_PE")
    .flatMap((t) => [t.embarque, t.desembarque])
    .filter((p) => numero(p?.latitude) !== null && numero(p?.longitude) !== null);

  return (
    <figure className="flex flex-col gap-2">
      <div className="isolate overflow-hidden rounded-3xl border border-linha">
        <MapaPercurso origem={origem} destino={destino} linhas={linhas} paradas={paradas} />
      </div>
      <figcaption className="flex flex-wrap gap-x-4 gap-y-1 text-sm text-salvia">
        <span className="flex items-center gap-1.5">
          <span aria-hidden="true" className="inline-block w-5 border-t-[3px] border-dotted border-grafite" /> a pé
        </span>
        <span className="flex items-center gap-1.5">
          <span aria-hidden="true" className="inline-block h-1.5 w-5 rounded bg-rota" /> ônibus
        </span>
        <span className="flex items-center gap-1.5">
          <span aria-hidden="true" className="inline-block h-1.5 w-5 rounded bg-grafite/40" /> metrô e trem na cor da
          linha
        </span>
        {!linhas.length && <span>O serviço de rotas não mandou o desenho do caminho; o mapa mostra só os pontos.</span>}
      </figcaption>
    </figure>
  );
}

function CartaoOpcao({ opcao, comHorario, selecionada, aoEscolher }) {
  const categoria = categoriaDaOpcao(opcao);
  return (
    <button
      type="button"
      aria-pressed={selecionada}
      onClick={aoEscolher}
      className={cn(
        "flex w-full flex-col gap-2 rounded-2xl border bg-superficie p-4 text-left transition-colors",
        selecionada ? "border-2 border-pinho shadow-sm" : "border-linha hover:border-rota",
      )}
    >
      <span className="flex w-full flex-wrap items-baseline justify-between gap-2">
        <span className="font-display text-xl font-bold text-pinho">
          {comHorario ? "Saia até" : "Saia às"} {horaDe(opcao.saida)}
        </span>
        <span className="text-salvia">
          chega {horaDe(opcao.chegada)}
          {formatarDuracao(opcao.duracaoMinutos) && <> · {formatarDuracao(opcao.duracaoMinutos)}</>}
        </span>
      </span>
      <ResumoRota trechos={opcao.trechos} />
      <span className="flex flex-wrap gap-2">
        {opcao.recomendada && <Badge tom="info">Recomendada</Badge>}
        {(categoria === "TRILHOS" || categoria === "MISTO") && <Badge tom="neutro">Com metrô ou trem</Badge>}
        {opcao.chegaATempo === false && <Badge tom="aviso">Chega depois do horário</Badge>}
        {selecionada && <span className="sr-only">(opção mostrada no mapa e no passo a passo)</span>}
      </span>
    </button>
  );
}
