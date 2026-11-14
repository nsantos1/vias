import { notFound } from "next/navigation";
import Galeria from "./Galeria";

export const metadata = {
  title: "Componentes (desenvolvimento)",
  robots: { index: false, follow: false },
};

/**
 * Vitrine dos componentes de UI (FE-07), só para desenvolvimento.
 * Em produção (npm run build && npm run start) esta rota responde 404.
 */
export default function PaginaComponentes() {
  if (process.env.NODE_ENV === "production") {
    notFound();
  }
  return <Galeria />;
}
