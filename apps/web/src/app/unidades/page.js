import { Suspense } from "react";
import FundoResultados, { FaixaPredio } from "@/components/decor/FundoResultados";
import EstadoCarregando from "@/components/estados/EstadoCarregando";
import ResultadosBusca from "@/components/unidades/ResultadosBusca";
import Etapas from "@/components/ui/Etapas";

export const metadata = { title: "Resultado da busca" };

/**
 * Tela 2 de 3, Unidade: resultados (referência final de 19/11, D-22).
 * Coluna única à esquerda do centro, com o prédio de fundo à direita no
 * computador e numa faixa no topo no celular.
 */
export default function PaginaUnidades({ searchParams }) {
  return (
    <div className="tela-resultados relative isolate">
      <FundoResultados />
      <FaixaPredio />

      <div className="tela-resultados__coluna flex flex-col gap-7 px-4 pb-14 sm:px-6 lg:pb-24">
        <Etapas atual={2} percursoDisponivel className="surgir" />
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
