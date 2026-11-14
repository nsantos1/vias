import { cn } from "@/lib/cn";
import Icon from "./Icon";

const ETAPAS = ["Necessidade", "Unidade", "Percurso"];

/**
 * Indicador "ETAPA N DE 3": Necessidade → Unidade → Percurso (referências de UI).
 * - Etapa concluída: círculo cheio com check e "(concluída)" para leitor de tela.
 * - Etapa atual: aria-current="step" e nome em negrito.
 * - Percurso: enquanto a rota não estiver integrada (D-05), aparece apagado com
 *   "em breve" escrito (decisão R-01). Não é clicável.
 * O estado nunca depende só da cor: há texto, check e peso da fonte.
 */
export default function Etapas({ atual, percursoDisponivel = false, className }) {
  return (
    <nav aria-label="Etapas da busca" className={cn("flex flex-col gap-3", className)}>
      <p className="font-mono text-label uppercase text-rota">
        Etapa {atual} de {ETAPAS.length}
      </p>
      <ol className="relative grid grid-cols-3">
        {/* Trilho entre os círculos (decorativo): cinza inteiro + parte concluída em verde */}
        <span aria-hidden="true" className="absolute top-[15px] right-4 left-4 h-0.5 bg-linha" />
        <span
          aria-hidden="true"
          className="absolute top-[15px] left-4 h-0.5 bg-rota"
          style={{ width: `calc((100% - 2rem) * ${(atual - 1) / (ETAPAS.length - 1)})` }}
        />
        {ETAPAS.map((nome, indice) => {
          const numero = indice + 1;
          const concluida = numero < atual;
          const ativa = numero === atual;
          const indisponivel = nome === "Percurso" && !percursoDisponivel && !ativa;
          const ultima = numero === ETAPAS.length;

          return (
            <li
              key={nome}
              aria-current={ativa ? "step" : undefined}
              className={cn(
                "relative flex flex-col gap-2",
                indice === 1 && "items-center text-center",
                ultima && "items-end text-right",
              )}
            >
              <span
                aria-hidden="true"
                className={cn(
                  "relative z-[1] flex size-8 items-center justify-center rounded-full border-2",
                  concluida && "border-rota bg-rota text-papel",
                  ativa && "border-rota bg-pinho",
                  !concluida && !ativa && "border-linha bg-papel",
                  indisponivel && "border-dashed",
                )}
              >
                {concluida && <Icon nome="check" className="size-4" />}
                {ativa && <span className="size-3 rounded-full bg-lima" />}
              </span>

              <span
                className={cn(
                  "text-sm sm:text-base",
                  ativa ? "font-semibold text-pinho" : "text-salvia",
                )}
              >
                {nome}
                {concluida && <span className="sr-only"> (concluída)</span>}
                {indisponivel && <span className="block text-xs text-salvia">em breve</span>}
              </span>
            </li>
          );
        })}
      </ol>
    </nav>
  );
}
