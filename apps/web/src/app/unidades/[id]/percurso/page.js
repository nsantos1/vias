import { Suspense } from "react";
import EstadoCarregando from "@/components/estados/EstadoCarregando";
import PlanejadorPercurso from "@/components/percurso/PlanejadorPercurso";

export const metadata = { title: "Percurso" };

/**
 * Tela 3 de 3, Percurso: transporte público até a unidade (D-20).
 * Dois momentos (D-24, D-25): o formulário, com a cidade à direita, e o
 * resultado em tela cheia (cartão "Faltam X para sair", mapa, opções e passo a
 * passo lado a lado). Quem troca um pelo outro é o PlanejadorPercurso.
 */
export default function PaginaPercurso({ params }) {
  return (
    <Suspense fallback={<EstadoCarregando rotulo="Carregando…" />}>
      <Planejador params={params} />
    </Suspense>
  );
}

async function Planejador({ params }) {
  const { id } = await params;
  return <PlanejadorPercurso id={id} />;
}
