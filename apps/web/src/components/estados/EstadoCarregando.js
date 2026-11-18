import Skeleton from "@/components/ui/Skeleton";
import AvisoDemora from "./AvisoDemora";

/**
 * Consulta em andamento. O texto aparece na tela (ajuda quem não reconhece o
 * skeleton) e é anunciado pelo leitor de tela (role="status").
 * `children` substitui o skeleton padrão pelo formato da tela (cards, detalhe…).
 * Se demorar, AvisoDemora explica que o serviço pode estar iniciando.
 */
export default function EstadoCarregando({ rotulo = "Carregando…", children }) {
  return (
    <div role="status" aria-live="polite" className="flex flex-col gap-3">
      <p className="text-sm text-salvia">{rotulo}</p>
      <AvisoDemora />
      {children ?? (
        <div className="flex flex-col gap-3">
          <Skeleton className="h-6 w-2/3" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-5/6" />
        </div>
      )}
    </div>
  );
}
