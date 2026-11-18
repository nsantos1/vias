import { Suspense } from "react";
import EstadoCarregando from "@/components/estados/EstadoCarregando";
import ResultadosBusca from "@/components/unidades/ResultadosBusca";
import Etapas from "@/components/ui/Etapas";

export const metadata = { title: "Resultado da busca" };

/** Tela 2 de 3, Unidade: resultados (referência docs/referencias/02-unidade.webp). */
export default function PaginaUnidades({ searchParams }) {
  return (
    <div className="mx-auto max-w-5xl px-4 pt-4 pb-10 sm:px-6 sm:pt-6">
      <div className="flex max-w-2xl flex-col gap-8">
        <Etapas atual={2} />
        <Suspense fallback={<EstadoCarregando rotulo="Buscando unidades…" />}>
          <Resultados searchParams={searchParams} />
        </Suspense>
      </div>
    </div>
  );
}

async function Resultados({ searchParams }) {
  const params = (await searchParams) ?? {};
  const servicoId = typeof params.servicoId === "string" ? params.servicoId : "";
  return <ResultadosBusca servicoId={servicoId} />;
}
