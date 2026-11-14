import EmptyState from "@/components/ui/EmptyState";

/**
 * A consulta funcionou, mas não há registros. Fica num role="status" para o
 * leitor de tela anunciar quando a resposta chega.
 * Só usar quando a API respondeu com sucesso; falha usa <EstadoErro>.
 */
export default function EstadoVazio({ titulo = "Nenhum resultado encontrado", acao, children }) {
  return (
    <div role="status" aria-live="polite">
      <EmptyState titulo={titulo} acao={acao}>
        {children}
      </EmptyState>
    </div>
  );
}
