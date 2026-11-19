import { Suspense } from "react";
import FormularioBusca from "@/components/busca/FormularioBusca";
import CenaCidade from "@/components/decor/CenaCidade";
import LinhasFundo from "@/components/decor/LinhasFundo";
import Etapas from "@/components/ui/Etapas";
import Icon from "@/components/ui/Icon";
import Skeleton from "@/components/ui/Skeleton";
import { SITE_INSTITUCIONAL } from "@/lib/site";

/**
 * Tela 1 de 3, Necessidade (referência final de 19/11, docs/decisoes.md D-21).
 *
 * O campo sugere os serviços reais da API Java (GET /api/servicos). Não há
 * escolha manual de local: os resultados usam a localização do aparelho (D-18).
 * A ilustração da cidade fica à direita no computador e no topo no celular.
 */
export default function Home({ searchParams }) {
  return (
    <div className="tela-inicio relative isolate overflow-hidden">
      <LinhasFundo />
      <CenaCidade className="absolute top-10 right-0 -z-10 hidden aspect-[1672/941] w-[max(46rem,66vw)] lg:block" />

      {/*
        Celular e tablet: a cidade vira uma faixa no topo, recortada na parte da
        trilha e dos pins, que se dissolve no fundo antes das etapas. O cabeçalho
        fica por cima, com um véu claro para o logo continuar legível.
      */}
      <div aria-hidden="true" className="faixa-cidade relative aspect-[3/2] overflow-hidden sm:aspect-[2/1] lg:hidden">
        <CenaCidade className="absolute top-[4%] right-[-6%] aspect-[1672/941] w-[150%] sm:top-[-6%] sm:right-[-4%] sm:w-[118%]" />
      </div>

      <div className="tela-inicio__conteudo relative mx-auto w-full max-w-[90rem] px-4 pb-8 sm:px-6 lg:pb-28">
        <div className="flex max-w-[37.5rem] flex-col gap-8 md:mx-auto lg:mx-0 lg:gap-9">
          <Etapas atual={1} percursoDisponivel className="surgir" />

          <div className="flex flex-col gap-4">
            <h1 className="surgir text-[3.25rem] leading-[0.98] font-bold tracking-[-0.035em] sm:text-7xl lg:text-[4.9rem]">
              O que você
              <br />
              <span className="titulo-gradiente">precisa?</span>
            </h1>
            <p className="surgir text-lead font-medium text-salvia" style={{ "--atraso": "120ms" }}>
              Busque por um exame, serviço ou especialidade.
            </p>
          </div>

          {/* O serviço da URL ("Alterar busca") só existe na requisição: com cacheComponents, fica em Suspense. */}
          <div className="surgir" style={{ "--atraso": "220ms" }}>
            <Suspense fallback={<Skeleton className="h-56 w-full rounded-3xl" />}>
              <FormularioComServico searchParams={searchParams} />
            </Suspense>
          </div>

          {/* No celular e no tablet o cabeçalho não tem espaço: o link fica no fim da busca. */}
          <a
            href={SITE_INSTITUCIONAL}
            className="-mt-3 inline-flex min-h-11 items-center justify-center gap-2 self-center rounded-pill px-4 text-sm font-semibold text-pinho underline decoration-linha underline-offset-4 hover:decoration-rota lg:hidden"
          >
            <Icon nome="voltar" className="size-4 text-rota" />
            Voltar para landing page
          </a>
        </div>
      </div>
    </div>
  );
}

async function FormularioComServico({ searchParams }) {
  const { servicoId = "" } = (await searchParams) ?? {};
  return <FormularioBusca servicoInicial={String(servicoId)} visual="inicio" />;
}
