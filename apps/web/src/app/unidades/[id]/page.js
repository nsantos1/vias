import { Suspense } from "react";
import FundoResultados, { FaixaPredio } from "@/components/decor/FundoResultados";
import EstadoCarregando from "@/components/estados/EstadoCarregando";
import DetalheUnidade from "@/components/unidades/DetalheUnidade";
import Etapas from "@/components/ui/Etapas";

export const metadata = { title: "Unidade de saúde" };

/**
 * Tela 2 de 3, Unidade: detalhe (D-23). Mesma estética do resultado (D-22):
 * prédio fixo à direita, ondas à esquerda e coluna única.
 */
export default function PaginaUnidade({ params }) {
  return (
    <div className="tela-resultados relative isolate">
      <FundoResultados />
      <FaixaPredio />

      <div className="tela-resultados__coluna flex flex-col gap-7 px-4 pb-14 sm:px-6 lg:pb-24">
        <Etapas atual={2} percursoDisponivel className="surgir" />
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
