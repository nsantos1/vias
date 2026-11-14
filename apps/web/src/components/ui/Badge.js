import { cn } from "@/lib/cn";
import Icon from "./Icon";

const tons = {
  neutro: { classe: "border-borda-campo bg-superficie text-grafite", icone: null },
  marca: { classe: "border-pinho bg-pinho text-papel", icone: null },
  info: { classe: "border-linha bg-nevoa text-pinho", icone: "info" },
  aviso: { classe: "border-aviso/30 bg-aviso-fundo text-aviso", icone: "aviso" },
  erro: { classe: "border-erro/30 bg-erro-fundo text-erro", icone: "erro" },
};

/**
 * Selo curto de estado ou categoria. O texto é obrigatório e carrega o
 * significado; tom e ícone só reforçam. Os selos de acessibilidade e
 * proveniência (FE-16) vão usar este componente.
 */
export default function Badge({ tom = "neutro", comIcone = true, className, children }) {
  const { classe, icone } = tons[tom];
  return (
    <span
      className={cn(
        "inline-flex items-center gap-1 rounded-pill border px-2.5 py-0.5 text-sm font-medium",
        classe,
        className,
      )}
    >
      {comIcone && icone && <Icon nome={icone} className="size-4" />}
      {children}
    </span>
  );
}
