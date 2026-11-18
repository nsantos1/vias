import { Suspense } from "react";
import EstadoCarregando from "@/components/estados/EstadoCarregando";
import PlanejadorPercurso from "@/components/percurso/PlanejadorPercurso";
import Etapas from "@/components/ui/Etapas";

export const metadata = { title: "Percurso" };

/** Tela 3 de 3, Percurso: transporte público até a unidade (D-20). */
export default function PaginaPercurso({ params }) {
  return (
    <div className="mx-auto max-w-5xl px-4 pt-4 pb-10 sm:px-6 sm:pt-6">
      <div className="flex max-w-2xl flex-col gap-8">
        <Etapas atual={3} percursoDisponivel />
        <Suspense fallback={<EstadoCarregando rotulo="Carregando…" />}>
          <Planejador params={params} />
        </Suspense>
      </div>
    </div>
  );
}

async function Planejador({ params }) {
  const { id } = await params;
  return <PlanejadorPercurso id={id} />;
}
