"use client";

import { useState } from "react";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import ValorInformado from "@/components/estados/ValorInformado";
import Badge from "@/components/ui/Badge";
import Button from "@/components/ui/Button";
import Icon from "@/components/ui/Icon";
import Skeleton from "@/components/ui/Skeleton";
import { useConsulta } from "@/hooks/useConsulta";
import { formatarData } from "@/lib/formatos";
import { numero } from "@/lib/percurso";
import {
  formatarCep,
  formatarTelefone,
  linkMapas,
  nomeProprio,
  textoAcessibilidade,
  textoAtendeSus,
  textoLegivel,
} from "@/lib/unidade";
import { obterUnidade } from "@/services/api/unidades";
import LinhaInfo from "./LinhaInfo";

const SERVICOS_VISIVEIS = 12;

/**
 * Tela de detalhe (FE-13), na estética final do resultado (D-22, D-23).
 * Busca a unidade pelo id na API (sitemap, regra 4), nunca reaproveita dados
 * da lista. Os avisos são os que a API escreveu; o que faltar aparece como
 * "Não informado pela fonte".
 */
export default function DetalheUnidade({ id }) {
  const consulta = useConsulta(`unidade:${id}`, (signal) => obterUnidade(id, { signal }));

  return (
    <EstadoConsulta
      consulta={consulta}
      rotuloCarregando="Carregando unidade…"
      esqueleto={
        <div className="flex flex-col gap-4">
          <Skeleton className="h-10 w-3/4" />
          <Skeleton className="h-48 w-full rounded-[1.75rem]" />
          <Skeleton className="h-96 w-full rounded-[1.75rem]" />
        </div>
      }
      tituloErro={
        consulta.erro?.status === 404 ? "Unidade não encontrada" : "Não foi possível carregar a unidade"
      }
      acaoErro={
        <Button variante="discreto" href="/">
          Voltar à busca
        </Button>
      }
    >
      {(u) => <Conteudo unidade={u} />}
    </EstadoConsulta>
  );
}

function Conteudo({ unidade: u }) {
  const acess = textoAcessibilidade(u.acessibilidade?.status);
  const verificada = ["ACESSIVEL", "NAO_ACESSIVEL"].includes(u.acessibilidade?.status);
  const mapas = linkMapas(u);
  const telefone = formatarTelefone(u.telefone);
  const prov = u.proveniencia;
  // O percurso precisa das coordenadas da unidade (a API responde 422 sem elas).
  const temCoordenadas = numero(u.latitude) !== null && numero(u.longitude) !== null;

  const rua = [nomeProprio(u.endereco?.logradouro), u.endereco?.numero].filter(Boolean).join(", ");
  const cep = formatarCep(u.endereco?.cep);
  const endereco = rua || null;
  const complemento = [u.endereco?.uf, cep && `CEP ${cep}`].filter(Boolean).join(" · ");

  return (
    <div className="flex flex-col gap-6">
      {/* Cabeçalho da unidade */}
      <div className="surgir flex flex-col gap-3" style={{ "--atraso": "80ms" }}>
        <p className="font-mono text-label uppercase text-rota">
          Unidade de saúde{u.codigoCnes && <> · CNES {u.codigoCnes}</>}
        </p>
        <h1 id="nome-unidade" className="text-[2.1rem] leading-[1.08] font-bold tracking-[-0.03em] sm:text-[2.6rem]">
          {u.nome}
        </h1>
        <ul className="flex flex-wrap gap-2" aria-label="Resumo">
          {u.tipoUnidade && (
            <li className="rounded-pill bg-nevoa px-3 py-1 text-sm font-semibold text-rota">
              {textoLegivel(u.tipoUnidade)}
            </li>
          )}
          {u.atendeSus === "SIM" && (
            <li className="flex items-center gap-1.5 rounded-pill bg-superficie px-3 py-1 text-sm font-semibold text-pinho shadow-sm">
              <Icon nome="check" className="size-4 text-rota" />
              Atende SUS
            </li>
          )}
          {verificada && (
            <li className="flex items-center gap-1.5 rounded-pill bg-superficie px-3 py-1 text-sm font-semibold text-pinho shadow-sm">
              <Icon nome="acessibilidade" className="size-4 text-rota" />
              {acess.rotulo}
            </li>
          )}
        </ul>
      </div>

      {/* Como chegar: a ação principal da tela */}
      {(temCoordenadas || mapas) && (
        <section
          aria-labelledby="titulo-chegar"
          className="cartao-chegar surgir relative flex flex-col gap-4 overflow-hidden rounded-[1.75rem] p-6 text-papel sm:p-7"
          style={{ "--atraso": "160ms" }}
        >
          <TrilhaDecorativa />
          <div className="relative flex flex-col gap-1.5">
            <p className="font-mono text-label uppercase text-lima">Como chegar</p>
            <h2 id="titulo-chegar" className="text-2xl font-bold text-papel sm:text-[1.7rem]">
              {temCoordenadas ? "Saiba que horas sair para chegar a tempo" : "Abra o caminho no mapa"}
            </h2>
            {temCoordenadas && (
              <p className="max-w-md text-papel/85">
                Linhas de ônibus, metrô e trem até aqui, com o horário de saída e a previsão ao vivo da SPTrans.
              </p>
            )}
          </div>
          <div className="relative flex flex-col gap-3 sm:flex-row">
            {temCoordenadas && (
              <Button
                href={`/unidades/${encodeURIComponent(u.id)}/percurso`}
                seta
                className="botao-lima min-h-14 flex-1 text-lg"
              >
                Ver como chegar
              </Button>
            )}
            {mapas && (
              <Button
                href={mapas}
                target="_blank"
                rel="noopener noreferrer"
                variante="secundario"
                className="min-h-14 flex-1 border-papel/40! text-papel! hover:bg-papel/10!"
                aria-label={`Abrir ${u.nome} no Google Maps (abre em nova aba)`}
              >
                <Icon nome="pin" className="size-5" />
                Abrir no Google Maps
              </Button>
            )}
          </div>
        </section>
      )}

      {/* Informações */}
      <section
        aria-labelledby="titulo-info"
        className="cartao-destaque surgir flex flex-col gap-3 rounded-[1.75rem] bg-superficie p-5 sm:p-7"
        style={{ "--atraso": "240ms" }}
      >
        <h2 id="titulo-info" className="text-xl font-bold">
          Informações da unidade
        </h2>
        <dl>
          <LinhaInfo icone="hospital" rotulo="Endereço" variante="cartao">
            <ValorInformado valor={endereco}>
              {endereco}
              {complemento && <span className="block text-sm text-salvia">{complemento}</span>}
            </ValorInformado>
          </LinhaInfo>
          <LinhaInfo icone="mapa" rotulo="Bairro" variante="cartao">
            <ValorInformado valor={nomeProprio(u.regiao?.nome ?? u.endereco?.bairro)} />
          </LinhaInfo>
          <LinhaInfo icone="relogio" rotulo="Atendimento" variante="cartao">
            <ValorInformado valor={textoLegivel(u.horarioFuncionamento)} />
          </LinhaInfo>
          <LinhaInfo icone="telefone" rotulo="Telefone" variante="cartao">
            {telefone ? (
              <a
                href={`tel:${String(u.telefone).replace(/\D/g, "")}`}
                className="font-semibold text-pinho underline decoration-linha underline-offset-4 hover:decoration-rota"
              >
                {telefone}
              </a>
            ) : (
              <ValorInformado valor={null} />
            )}
          </LinhaInfo>
          <LinhaInfo icone="pessoa" rotulo="Atendimento SUS" variante="cartao">
            {textoAtendeSus(u.atendeSus)}
          </LinhaInfo>
          <LinhaInfo icone="acessibilidade" rotulo="Acessibilidade" variante="cartao">
            <span className="flex flex-col gap-1">
              <span>
                <Badge tom={acess.tom} comIcone={false}>
                  {acess.rotulo}
                </Badge>
              </span>
              {verificada && (
                <span className="text-sm text-salvia">
                  Fonte: {u.acessibilidade.fonte ?? "não informada"}
                  {formatarData(u.acessibilidade.dataVerificacao) &&
                    ` · verificada em ${formatarData(u.acessibilidade.dataVerificacao)}`}
                </span>
              )}
            </span>
          </LinhaInfo>
        </dl>
      </section>

      <Servicos servicos={u.servicos} />

      {u.avisos?.length > 0 && (
        <section
          aria-labelledby="titulo-avisos"
          className="caixa-servico surgir flex items-start gap-4 rounded-[1.75rem] p-5 sm:p-6"
          style={{ "--atraso": "400ms" }}
        >
          <span className="flex size-10 shrink-0 items-center justify-center rounded-full bg-superficie text-rota shadow-sm">
            <Icon nome="info" className="size-5" />
          </span>
          <div className="flex flex-col gap-1.5">
            <h2 id="titulo-avisos" className="text-lg font-bold">
              Antes de ir
            </h2>
            <ul className="flex list-disc flex-col gap-1 pl-4 text-grafite/85 marker:text-rota">
              {u.avisos.map((aviso) => (
                <li key={aviso}>{aviso}</li>
              ))}
            </ul>
          </div>
        </section>
      )}

      <p className="rounded-2xl bg-papel/85 px-4 py-3 text-center text-sm text-salvia backdrop-blur-sm">
        {prov ? (
          <>
            Fonte: {prov.nomeFonte ?? prov.fonte}.{" "}
            {formatarData(prov.dataReferencia)
              ? `Cadastro atualizado na fonte em ${formatarData(prov.dataReferencia)}.`
              : "A fonte não informa a data desta informação."}
          </>
        ) : (
          "A fonte desta informação não foi informada."
        )}
        {!mapas && " A fonte não informa coordenadas nem endereço desta unidade, então não há link para o mapa."}
      </p>
    </div>
  );
}

/** Serviços do cadastro em selos; com muitos, mostra os primeiros e um botão para ver todos. */
function Servicos({ servicos = [] }) {
  const [todos, setTodos] = useState(false);
  const lista = todos ? servicos : servicos.slice(0, SERVICOS_VISIVEIS);

  return (
    <section
      aria-labelledby="titulo-servicos"
      className="cartao-destaque surgir flex flex-col gap-4 rounded-[1.75rem] bg-superficie p-5 sm:p-7"
      style={{ "--atraso": "320ms" }}
    >
      <div className="flex items-center gap-3">
        <span className="flex size-10 shrink-0 items-center justify-center rounded-full bg-rota text-papel shadow-[0_6px_16px_rgb(45_124_96/0.35)]">
          <Icon nome="check" className="size-5" />
        </span>
        <h2 id="titulo-servicos" className="text-xl font-bold">
          Serviços no cadastro
          {servicos.length > 0 && <span className="font-normal text-salvia"> ({servicos.length})</span>}
        </h2>
      </div>
      {servicos.length ? (
        <>
          <ul className="flex flex-wrap gap-2">
            {lista.map((s, i) => (
              <li
                key={s.id}
                className="selo-servico rounded-pill px-3.5 py-1.5 text-sm font-medium text-pinho"
                style={{ "--atraso": `${Math.min(i, SERVICOS_VISIVEIS) * 35}ms` }}
              >
                {s.nome}
              </li>
            ))}
          </ul>
          {servicos.length > SERVICOS_VISIVEIS && (
            <div>
              <Button variante="discreto" onClick={() => setTodos((v) => !v)} aria-expanded={todos}>
                {todos ? "Mostrar menos" : `Ver todos os ${servicos.length} serviços`}
              </Button>
            </div>
          )}
          <p className="text-sm text-salvia">Vínculos do cadastro: não garantem vaga, agenda ou atendimento hoje.</p>
        </>
      ) : (
        <ValorInformado valor={null} />
      )}
    </section>
  );
}

/** Trilha com luz correndo no canto do cartão "Como chegar" (decorativa). */
function TrilhaDecorativa() {
  const d = "M-10 150 C 80 140, 120 60, 200 70 S 300 20, 340 -10";
  return (
    <svg
      aria-hidden="true"
      viewBox="0 0 330 160"
      className="pointer-events-none absolute right-0 bottom-0 hidden h-full w-[70%] opacity-70 sm:block"
      fill="none"
      preserveAspectRatio="xMaxYMax meet"
    >
      <path d={d} stroke="#3cc274" strokeOpacity="0.35" strokeWidth="2" strokeDasharray="2 8" strokeLinecap="round" />
      <path d={d} pathLength="1000" className="cartao-chegar__luz" stroke="#d7f36a" strokeWidth="3.5" />
      <circle cx="200" cy="70" r="5" fill="#d7f36a" className="cartao-chegar__ponto" />
    </svg>
  );
}
