import { Suspense } from "react";
import EstadoCarregando from "@/components/estados/EstadoCarregando";
import DetalheUnidade from "@/components/unidades/DetalheUnidade";
import Etapas from "@/components/ui/Etapas";

export const metadata = { title: "Unidade de saúde" };

/** Tela 2 de 3, Unidade: detalhe (referência docs/referencias/02-unidade.webp). */
export default function PaginaUnidade({ params }) {
  return (
    <div className="mx-auto max-w-5xl px-4 pt-4 pb-10 sm:px-6 sm:pt-6">
      <div className="flex max-w-2xl flex-col gap-8">
        <Etapas atual={2} />
        <Suspense fallback={<EstadoCarregando rotulo="Carregando unidade…" />}>
          <Detalhe params={params} />
        </Suspense>
      </div>
    </div>
  );
}

async function Detalhe({ params }) {
  const { id } = await params;
  return <DetalheUnidade id={id} />;
}
