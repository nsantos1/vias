import { Suspense } from "react";
import FormularioBusca from "@/components/busca/FormularioBusca";
import MapaDecorativo from "@/components/decor/MapaDecorativo";
import Etapas from "@/components/ui/Etapas";
import Skeleton from "@/components/ui/Skeleton";

/**
 * Tela 1 de 3, Necessidade (referência docs/referencias/01-necessidade.webp).
 *
 * O campo sugere os serviços reais da API Java (GET /api/servicos). Não há
 * escolha manual de local: os resultados usam a localização do aparelho (D-18).
 * O seletor "Atendimento pelo" (SUS/plano) fica fora até D-12 ser decidido (R-02).
 */
export default function Home({ searchParams }) {
  return (
    <div className="relative isolate overflow-hidden">
      <MapaDecorativo className="absolute top-24 -right-12 -z-10 w-[min(72vw,28rem)] opacity-80 sm:top-20" />

      <div className="mx-auto max-w-5xl px-4 pt-4 pb-10 sm:px-6 sm:pt-6">
        <div className="flex max-w-xl flex-col gap-8">
          <Etapas atual={1} />

          <div className="flex flex-col gap-3">
            <h1 className="text-5xl leading-[1.02] font-bold sm:text-6xl">
              O que você
              <br />
              precisa?
            </h1>
            <p className="text-lead text-salvia">
              Busque por um exame, serviço ou especialidade.
            </p>
          </div>

          {/* O serviço da URL ("Alterar busca") só existe na requisição: com cacheComponents, fica em Suspense. */}
          <Suspense fallback={<Skeleton className="h-56 w-full" />}>
            <FormularioComServico searchParams={searchParams} />
          </Suspense>
        </div>
      </div>
    </div>
  );
}

async function FormularioComServico({ searchParams }) {
  const { servicoId = "" } = (await searchParams) ?? {};
  return <FormularioBusca servicoInicial={String(servicoId)} />;
}
