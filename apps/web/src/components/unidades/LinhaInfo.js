import Icon from "@/components/ui/Icon";

/**
 * Linha "ícone · RÓTULO · valor" dos cards da referência 2
 * (docs/referencias/02-unidade.webp). Usar dentro de um <dl>.
 */
export default function LinhaInfo({ icone, rotulo, children }) {
  return (
    <div className="grid grid-cols-[1.75rem_1fr] items-start gap-x-3 gap-y-0.5 border-b border-linha py-3 last:border-b-0 sm:grid-cols-[1.75rem_9.5rem_1fr]">
      <Icon nome={icone} className="mt-0.5 size-6 text-rota" />
      <dt className="font-mono text-sm uppercase tracking-wide text-salvia">{rotulo}</dt>
      <dd className="col-start-2 text-grafite sm:col-start-3">{children}</dd>
    </div>
  );
}
