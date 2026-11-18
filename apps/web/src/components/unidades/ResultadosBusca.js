"use client";

import Link from "next/link";
import { useState } from "react";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import EstadoVazio from "@/components/estados/EstadoVazio";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import Icon from "@/components/ui/Icon";
import Skeleton from "@/components/ui/Skeleton";
import { ESTADOS, useConsulta } from "@/hooks/useConsulta";
import { ESTADOS_LOCAL, useLocalizacao } from "@/hooks/useLocalizacao";
import { ordenarPorDistancia } from "@/lib/distancia";
import { obterServico } from "@/services/api/servicos";
import { listarTodasUnidadesDoServico } from "@/services/api/unidades";
import CardDestaque from "./CardDestaque";
import CardUnidade from "./CardUnidade";

const POR_VEZ = 10;

/**
 * Tela 2 de 3, Resultados (referência docs/referencias/02-unidade.webp).
 *
 * D-18 (Victor, 18/11): o local da pessoa vem da localização do aparelho, sem
 * escolha manual. O navegador busca todas as unidades do serviço na API Java e
 * ordena pela distância em linha reta. A localização não sai do aparelho.
 * Sem localização, a lista aparece em ordem alfabética, sem falar em proximidade.
 */
export default function ResultadosBusca({ servicoId }) {
  const local = useLocalizacao();
  const [quantas, setQuantas] = useState(POR_VEZ);

  const servico = useConsulta(`servico:${servicoId}`, (signal) => obterServico(servicoId, { signal }), {
    ativo: Boolean(servicoId),
  });
  const unidades = useConsulta(
    `unidades-do-servico:${servicoId}`,
    (signal) => listarTodasUnidadesDoServico({ servicoId, signal }),
    { ativo: Boolean(servicoId) },
  );

  if (!servicoId) {
    return (
      <EstadoVazio
        titulo="Escolha um serviço para buscar"
        acao={
          <Button href="/" seta>
            Ir para a busca
          </Button>
        }
      >
        A busca precisa de um serviço do catálogo.
      </EstadoVazio>
    );
  }

  const pedindoLocal = local.estado === ESTADOS_LOCAL.PEDINDO;
  const comLocalizacao = local.estado === ESTADOS_LOCAL.OK;
  // Só mostra a lista depois de saber se há localização, para ela não "pular" de ordem.
  const consulta =
    unidades.estado === ESTADOS.SUCESSO && pedindoLocal
      ? { ...unidades, estado: ESTADOS.CARREGANDO }
      : unidades;

  const nomeServico = servico.dados?.nome ?? null;
  const total = unidades.estado === ESTADOS.SUCESSO ? unidades.dados.items.length : null;
  const titulo =
    consulta.estado === ESTADOS.CARREGANDO || total === null
      ? "Buscando unidades"
      : total === 1
        ? "Encontramos uma unidade"
        : `Encontramos ${total.toLocaleString("pt-BR")} unidades`;

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-col gap-3">
        <h1 className="text-4xl leading-[1.05] font-bold sm:text-5xl" aria-live="polite">
          {titulo}
        </h1>
        <p className="text-lead text-salvia">
          Resultado para <strong className="text-grafite">{nomeServico ?? "o serviço escolhido"}</strong>
          {comLocalizacao && <> · mais próximas de você</>}
        </p>
        <div>
          <Button variante="discreto" href={`/?servicoId=${encodeURIComponent(servicoId)}`}>
            Alterar busca
          </Button>
        </div>
      </div>

      {servico.estado === ESTADOS.ERRO && (
        <Alert tom="erro" titulo="Serviço não encontrado">
          O serviço desta busca não existe no catálogo.{" "}
          <Link href="/" className="font-semibold text-pinho underline">
            Voltar à busca
          </Link>
        </Alert>
      )}

      <EstadoConsulta
        consulta={consulta}
        rotuloCarregando={
          unidades.estado === ESTADOS.SUCESSO && pedindoLocal
            ? "Obtendo sua localização para mostrar as mais próximas…"
            : "Buscando unidades…"
        }
        esqueleto={
          <div className="flex flex-col gap-4">
            <Skeleton className="h-96 w-full rounded-3xl" />
            <Skeleton className="h-20 w-full" />
            <Skeleton className="h-20 w-full" />
          </div>
        }
        tituloErro="Não foi possível carregar as unidades"
        acaoErro={
          <Button variante="discreto" href="/">
            Voltar à busca
          </Button>
        }
        vazio={{
          titulo: "Nenhuma unidade com este serviço",
          descricao: "O cadastro consultado não tem unidades com este serviço. Tente outro serviço do catálogo.",
          acao: (
            <Button variante="secundario" href="/">
              Alterar busca
            </Button>
          ),
        }}
      >
        {(dados) => {
          const ordenadas = ordenarPorDistancia(dados.items, local.origem);
          const [primeira, ...demais] = ordenadas;
          const visiveis = demais.slice(0, quantas);

          return (
            <div className="flex flex-col gap-6">
              <StatusLocalizacao local={local} />

              <CardDestaque
                unidade={primeira}
                servicoNome={nomeServico}
                servicoDescricao={servico.dados?.descricao}
                comLocalizacao={comLocalizacao}
              />

              {demais.length > 0 && (
                <section aria-labelledby="titulo-outras" className="flex flex-col gap-3">
                  <h2 id="titulo-outras" className="text-2xl font-bold">
                    {comLocalizacao ? "Outras unidades próximas" : "Outras unidades"}
                  </h2>
                  <ol className="flex flex-col gap-3">
                    {visiveis.map((u) => (
                      <li key={u.id}>
                        <CardUnidade unidade={u} comLocalizacao={comLocalizacao} />
                      </li>
                    ))}
                  </ol>
                  {demais.length > quantas && (
                    <div className="flex flex-col items-center gap-2">
                      <p className="text-sm text-salvia">
                        Mostrando {visiveis.length + 1} de {ordenadas.length.toLocaleString("pt-BR")} unidades
                      </p>
                      <Button variante="secundario" onClick={() => setQuantas((q) => q + POR_VEZ)}>
                        Mostrar mais unidades
                      </Button>
                    </div>
                  )}
                </section>
              )}

              {!dados.completo && (
                <p className="text-sm text-salvia">
                  A lista foi limitada às primeiras {dados.items.length.toLocaleString("pt-BR")} unidades
                  de {dados.total.toLocaleString("pt-BR")}.
                </p>
              )}
            </div>
          );
        }}
      </EstadoConsulta>
    </div>
  );
}

/** Diz como a lista foi ordenada e, sem localização, oferece pedir de novo. */
function StatusLocalizacao({ local }) {
  if (local.estado === ESTADOS_LOCAL.OK) {
    const precisaoKm = local.origem?.precisaoMetros ? local.origem.precisaoMetros / 1000 : null;
    return (
      <p className="flex items-start gap-2 text-sm text-salvia">
        <Icon nome="pin" className="mt-0.5 size-4 shrink-0 text-rota" />
        <span>
          Ordenado pela distância em linha reta até a sua localização atual, que não é salva.
          {precisaoKm && precisaoKm >= 1 && (
            <>
              {" "}
              Sua localização é aproximada (cerca de{" "}
              {precisaoKm.toLocaleString("pt-BR", { maximumFractionDigits: 0 })} km).
            </>
          )}
        </span>
      </p>
    );
  }

  const motivo =
    local.estado === ESTADOS_LOCAL.NEGADA
      ? "O acesso à localização foi bloqueado. Para liberar, toque no cadeado ao lado do endereço do site, permita a localização e use o botão abaixo."
      : local.estado === ESTADOS_LOCAL.INDISPONIVEL
        ? "Este aparelho não informou a localização."
        : "Não foi possível obter a localização a tempo.";

  return (
    <Alert
      tom="aviso"
      titulo="Sem sua localização, a lista não está ordenada por proximidade"
      acao={
        <Button variante="secundario" onClick={local.pedirDeNovo}>
          Usar minha localização
        </Button>
      }
    >
      {motivo} Enquanto isso, as unidades aparecem em ordem alfabética.
    </Alert>
  );
}
