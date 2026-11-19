"use client";

import Link from "next/link";
import { useState } from "react";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import EstadoVazio from "@/components/estados/EstadoVazio";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import Contador from "@/components/ui/Contador";
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
  const pronto = consulta.estado !== ESTADOS.CARREGANDO && total !== null;
  const titulo = !pronto
    ? "Buscando unidades"
    : total === 1
      ? "Encontramos 1 unidade"
      : `Encontramos ${total.toLocaleString("pt-BR")} unidades`;

  return (
    <div className="flex flex-col gap-7">
      <div className="surgir flex flex-col gap-2" style={{ "--atraso": "80ms" }}>
        <h1 className="text-[2.15rem] leading-[1.08] font-bold tracking-[-0.03em] sm:text-[2.6rem]" aria-live="polite">
          {/* O leitor de tela ouve a frase inteira; o número animado é só visual. */}
          <span className="sr-only">{titulo}</span>
          <span aria-hidden="true">
            {pronto ? (
              <>
                Encontramos <Contador key={total} valor={total} className="titulo-gradiente tabular-nums" />{" "}
                {total === 1 ? "unidade" : "unidades"}
              </>
            ) : (
              titulo
            )}
          </span>
        </h1>
        <p className="text-lg text-grafite">
          Resultado para{" "}
          <strong className="font-semibold text-rota">{nomeServico ?? "o serviço escolhido"}</strong>
          {comLocalizacao && <> - mais próximas de você.</>}{" "}
          <Link
            href={`/?servicoId=${encodeURIComponent(servicoId)}`}
            className="ml-1 inline py-3 text-base font-semibold whitespace-nowrap text-pinho underline decoration-linha underline-offset-4 hover:decoration-rota"
          >
            Alterar busca
          </Link>
        </p>
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
            <div className="flex flex-col gap-7">
              <StatusLocalizacao local={local} />

              <CardDestaque
                unidade={primeira}
                servicoNome={nomeServico}
                servicoDescricao={servico.dados?.descricao}
                comLocalizacao={comLocalizacao}
              />

              {demais.length > 0 && (
                <section aria-labelledby="titulo-outras" className="flex flex-col gap-3">
                  <h2
                    id="titulo-outras"
                    className="surgir text-[1.35rem] font-bold text-grafite"
                    style={{ "--atraso": "360ms" }}
                  >
                    {comLocalizacao ? "Outras unidades próximas:" : "Outras unidades:"}
                  </h2>
                  <ol className="flex flex-col gap-3">
                    {visiveis.map((u, i) => (
                      // Só as primeiras entram em sequência; as de "Mostrar mais" já aparecem prontas.
                      <li key={u.id} className={i < POR_VEZ ? "surgir" : undefined} style={{ "--atraso": `${420 + i * 60}ms` }}>
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

              {comLocalizacao && (
                <p className="rounded-2xl bg-papel/85 px-4 py-3 text-center text-sm text-salvia backdrop-blur-sm">
                  Distâncias em linha reta até a sua localização atual, que não sai do aparelho nem é salva.
                </p>
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

/**
 * Sem localização, avisa que a lista não está por proximidade e oferece pedir
 * de novo. Com localização, só fala quando ela é imprecisa (mais de 1 km); o
 * "em linha reta" e o "não é salva" ficam no cartão e no rodapé da lista.
 */
function StatusLocalizacao({ local }) {
  if (local.estado === ESTADOS_LOCAL.OK) {
    const precisaoKm = local.origem?.precisaoMetros ? local.origem.precisaoMetros / 1000 : null;
    if (!precisaoKm || precisaoKm < 1) return null;
    return (
      <p className="text-sm text-salvia">
        Sua localização é aproximada (cerca de{" "}
        {precisaoKm.toLocaleString("pt-BR", { maximumFractionDigits: 0 })} km), então as distâncias também são.
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
