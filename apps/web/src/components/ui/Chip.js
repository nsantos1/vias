import { cn } from "@/lib/cn";
import Icon from "./Icon";

/**
 * Etiqueta de filtro ativo.
 * Com `aoRemover`, vira um botão cujo nome acessível diz o que será removido
 * ("Remover filtro: Pediatria"). Sem `aoRemover`, é só texto.
 * Componentes que passam `aoRemover` precisam ser Client Components.
 */
export default function Chip({ children, aoRemover, rotuloRemover, className }) {
  const estilo = cn(
    "inline-flex min-h-9 items-center gap-1.5 rounded-pill border border-borda-campo bg-superficie px-3 text-sm font-medium text-grafite",
    className,
  );

  if (!aoRemover) {
    return <span className={estilo}>{children}</span>;
  }

  return (
    <button
      type="button"
      onClick={aoRemover}
      aria-label={rotuloRemover ?? `Remover filtro: ${typeof children === "string" ? children : ""}`}
      className={cn(estilo, "min-h-11 hover:bg-nevoa")}
    >
      {children}
      <Icon nome="fechar" className="size-4" />
    </button>
  );
}
