import { Suspense } from "react";
import FormularioBusca from "@/components/busca/FormularioBusca";
import MapaDecorativo from "@/components/decor/MapaDecorativo";
import Etapas from "@/components/ui/Etapas";
import Skeleton from "@/components/ui/Skeleton";

/**
 * Tela 1 de 3, Necessidade (referência docs/referencias/01-necessidade.webp).
 *
 * Layout original do Victor. O campo agora sugere os serviços reais da API Java
 * (GET /api/servicos). "Alterar busca" volta para cá com os filtros na URL.
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

          {/* Os filtros da URL só existem na requisição: com cacheComponents, ficam em Suspense. */}
          <Suspense fallback={<Skeleton className="h-56 w-full" />}>
            <FormularioComFiltros searchParams={searchParams} />
          </Suspense>
        </div>
      </div>
    </div>
  );
}

async function FormularioComFiltros({ searchParams }) {
  const { servicoId = "", regiaoId = "" } = (await searchParams) ?? {};
  return <FormularioBusca servicoInicial={String(servicoId)} regiaoInicial={String(regiaoId)} />;
}
