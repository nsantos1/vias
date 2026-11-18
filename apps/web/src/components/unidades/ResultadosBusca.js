"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import EstadoVazio from "@/components/estados/EstadoVazio";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import Chip from "@/components/ui/Chip";
import Skeleton from "@/components/ui/Skeleton";
import { ESTADOS, useConsulta } from "@/hooks/useConsulta";
import { obterRegiao } from "@/services/api/regioes";
import { obterServico } from "@/services/api/servicos";
import { listarUnidades } from "@/services/api/unidades";
import CardUnidade from "./CardUnidade";

const TAMANHO_PAGINA = 10;

function urlResultados({ servicoId, regiaoId, pagina }) {
  const params = new URLSearchParams();
  if (servicoId) params.set("servicoId", servicoId);
  if (regiaoId) params.set("regiaoId", regiaoId);
  if (pagina > 0) params.set("pagina", String(pagina));
  return `/unidades?${params}`;
}

function urlAlterarBusca({ servicoId, regiaoId }) {
  const params = new URLSearchParams();
  if (servicoId) params.set("servicoId", servicoId);
  if (regiaoId) params.set("regiaoId", regiaoId);
  const query = params.toString();
  return query ? `/?${query}` : "/";
}

/**
 * Tela 2 de 3, Resultados (FE-12). Os filtros vêm da URL (sitemap, regra 1),
 * então voltar e recarregar mantêm a busca. Falha nunca vira lista vazia.
 */
export default function ResultadosBusca({ servicoId, regiaoId, pagina }) {
  const router = useRouter();
  const filtros = { servicoId, regiaoId };

  const servico = useConsulta(`servico:${servicoId}`, (signal) => obterServico(servicoId, { signal }), {
    ativo: Boolean(servicoId),
  });
  const regiao = useConsulta(`regiao:${regiaoId}`, (signal) => obterRegiao(regiaoId, { signal }), {
    ativo: Boolean(regiaoId),
  });
  const unidades = useConsulta(
    `unidades?${servicoId}|${regiaoId}|${pagina}`,
    (signal) =>
      listarUnidades({ servicoId, regiaoId, pagina, tamanho: TAMANHO_PAGINA, signal }),
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

  const total = unidades.estado === ESTADOS.SUCESSO ? unidades.dados.total : null;
  const titulo =
    unidades.estado === ESTADOS.CARREGANDO
      ? "Buscando unidades"
      : total === 1
        ? "Encontramos uma unidade"
        : total
          ? `Encontramos ${total.toLocaleString("pt-BR")} unidades`
          : "Resultado da busca";

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-col gap-3">
        <h1 className="text-4xl leading-[1.05] font-bold sm:text-5xl" aria-live="polite">
          {titulo}
        </h1>
        <p className="text-lead text-salvia">
          Resultado para{" "}
          <strong className="text-grafite">
            {servico.dados?.nome ?? "o serviço escolhido"}
            {regiaoId && ` · ${regiao.dados?.nome ?? "região escolhida"}`}
          </strong>
        </p>

        <div className="flex flex-wrap items-center gap-2">
          {servico.dados && <Chip>{servico.dados.nome}</Chip>}
          {regiao.dados && (
            <Chip
              aoRemover={() => router.push(urlResultados({ servicoId, pagina: 0 }))}
              rotuloRemover={`Remover filtro de região: ${regiao.dados.nome}`}
            >
              {regiao.dados.nome}
            </Chip>
          )}
          <Button variante="discreto" href={urlAlterarBusca(filtros)}>
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
        consulta={unidades}
        rotuloCarregando="Carregando unidades…"
        esqueleto={
          <div className="flex flex-col gap-4">
            <Skeleton className="h-48 w-full" />
            <Skeleton className="h-48 w-full" />
          </div>
        }
        tituloErro="Não foi possível carregar as unidades"
        acaoErro={
          <Button variante="discreto" href={urlAlterarBusca(filtros)}>
            Voltar à busca
          </Button>
        }
        vazio={{
          titulo: "Nenhuma unidade encontrada para estes filtros",
          descricao: regiaoId
            ? "Tente buscar em todas as regiões."
            : "Tente outro serviço do catálogo.",
          acao: regiaoId ? (
            <Button variante="secundario" href={urlResultados({ servicoId, pagina: 0 })}>
              Buscar em todas as regiões
            </Button>
          ) : (
            <Button variante="secundario" href="/">
              Alterar busca
            </Button>
          ),
        }}
      >
        {(pag) => (
          <div className="flex flex-col gap-5">
            <Alert tom="info" titulo="O que esta lista mostra">
              Unidades com o serviço registrado no cadastro do CNES. O cadastro não garante vaga,
              agenda ou atendimento hoje.
            </Alert>

            <ol className="flex flex-col gap-4">
              {pag.items.map((u) => (
                <li key={u.id}>
                  <CardUnidade unidade={u} />
                </li>
              ))}
            </ol>

            {pag.totalPaginas > 1 && (
              <nav aria-label="Páginas de resultados" className="flex flex-wrap items-center justify-between gap-3">
                {pag.pagina > 0 ? (
                  <Button variante="secundario" href={urlResultados({ ...filtros, pagina: pag.pagina - 1 })}>
                    Anterior
                  </Button>
                ) : (
                  <span />
                )}
                <p className="text-sm text-salvia">
                  Página {pag.pagina + 1} de {pag.totalPaginas}
                </p>
                {pag.pagina + 1 < pag.totalPaginas ? (
                  <Button variante="secundario" seta href={urlResultados({ ...filtros, pagina: pag.pagina + 1 })}>
                    Próxima
                  </Button>
                ) : (
                  <span />
                )}
              </nav>
            )}
          </div>
        )}
      </EstadoConsulta>
    </div>
  );
}
