import { cn } from "@/lib/cn";
import Icon from "./Icon";

/**
 * Estado vazio: a consulta funcionou, mas não encontrou nada.
 * Não usar para falha de rede ou de API; para isso existe <Alert tom="erro">.
 * `acao` costuma ser "Limpar filtros" ou "Voltar à busca".
 */
export default function EmptyState({ titulo, acao, className, children }) {
  return (
    <div
      className={cn(
        "flex flex-col items-center gap-3 rounded-xl border border-dashed border-borda-campo bg-superficie px-6 py-10 text-center",
        className,
      )}
    >
      <Icon nome="vazio" className="size-8 text-salvia" />
      <p className="font-display text-xl font-semibold text-pinho">{titulo}</p>
      {children && <div className="max-w-md text-salvia">{children}</div>}
      {acao && <div className="mt-1">{acao}</div>}
    </div>
  );
}
