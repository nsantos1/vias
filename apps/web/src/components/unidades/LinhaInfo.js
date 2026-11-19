import Icon from "@/components/ui/Icon";
import { cn } from "@/lib/cn";

/**
 * Linha "ícone · rótulo · valor" dos cartões de unidade. Usar dentro de um <dl>.
 * - padrão: rótulo em mono maiúsculo (página da unidade);
 * - `variante="cartao"`: rótulo em texto normal e linhas mais baixas, como no
 *   cartão em destaque do resultado (referência final de 19/11, D-22).
 */
export default function LinhaInfo({ icone, rotulo, variante, children }) {
  const cartao = variante === "cartao";
  return (
    <div
      className={cn(
        "grid grid-cols-[1.75rem_1fr] items-start gap-x-3 gap-y-0.5 border-b border-linha last:border-b-0",
        cartao ? "linha-info py-2.5 sm:grid-cols-[1.75rem_11rem_1fr]" : "py-3 sm:grid-cols-[1.75rem_9.5rem_1fr]",
      )}
    >
      <Icon nome={icone} className={cn("text-rota", cartao ? "mt-px size-5" : "mt-0.5 size-6")} />
      <dt className={cartao ? "font-medium text-grafite" : "font-mono text-sm uppercase tracking-wide text-salvia"}>
        {rotulo}
      </dt>
      <dd className={cn("col-start-2 text-grafite sm:col-start-3", cartao && "text-[0.95rem]")}>{children}</dd>
    </div>
  );
}
