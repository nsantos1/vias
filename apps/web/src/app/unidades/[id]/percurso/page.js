import { Suspense } from "react";
import FundoPercurso, { FaixaPercurso } from "@/components/decor/FundoPercurso";
import EstadoCarregando from "@/components/estados/EstadoCarregando";
import PlanejadorPercurso from "@/components/percurso/PlanejadorPercurso";
import Etapas from "@/components/ui/Etapas";

export const metadata = { title: "Percurso" };

/**
 * Tela 3 de 3, Percurso: transporte público até a unidade (D-20).
 * Visual final de 19/11 (D-24): coluna à esquerda e a cidade com a trilha até
 * o hospital à direita (no celular, numa faixa no topo).
 */
export default function PaginaPercurso({ params }) {
  return (
    <div className="tela-percurso relative isolate">
      <FundoPercurso />
      <FaixaPercurso />

      <div className="tela-percurso__coluna flex flex-col gap-7 px-4 pb-14 sm:px-6 lg:pb-24">
        <Etapas atual={3} percursoDisponivel className="surgir" />
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
