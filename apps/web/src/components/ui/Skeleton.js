import { cn } from "@/lib/cn";

/**
 * Bloco cinza que ocupa o lugar do conteúdo enquanto ele carrega.
 * É invisível para leitor de tela (aria-hidden). Quem usa deve envolver os
 * skeletons num elemento role="status" com um texto como "Carregando unidades…"
 * (o FE-09 vai padronizar isso). A animação some com prefers-reduced-motion.
 */
export default function Skeleton({ className }) {
  return <div aria-hidden="true" className={cn("animate-pulse rounded-lg bg-linha", className)} />;
}
