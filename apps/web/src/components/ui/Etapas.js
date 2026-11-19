import { cn } from "@/lib/cn";
import Icon from "./Icon";

const ETAPAS = [
  { nome: "Necessidade", icone: "pin" },
  { nome: "Unidade", icone: "hospital" },
  { nome: "Percurso", icone: "check" },
];

/**
 * Indicador "ETAPA N DE 3": Necessidade → Unidade → Percurso (referências de UI).
 * - Etapa concluída: círculo verde com check e "(concluída)" para leitor de tela.
 * - Etapa atual: aria-current="step", círculo escuro com brilho e nome em negrito.
 * - Próximas etapas: círculo claro com o ícone da etapa.
 * - Percurso: com `percursoDisponivel` (D-20) aparece normal; sem ele, tracejado
 *   com "em breve" escrito (decisão R-01). Não é clicável.
 * O estado nunca depende só da cor: há texto, ícone e peso da fonte.
 */
export default function Etapas({ atual, percursoDisponivel = false, semRotulo = false, className }) {
  const progresso = (atual - 1) / (ETAPAS.length - 1);
  return (
    <nav aria-label="Etapas da busca" className={cn("flex flex-col gap-3", className)}>
      {/* `semRotulo`: o "Etapa N de 3" já aparece em outro lugar da tela (resultado do percurso). */}
      <p className={semRotulo ? "sr-only" : "font-mono text-label uppercase text-grafite"}>
        Etapa {atual} de {ETAPAS.length}
      </p>
      <ol className="relative grid grid-cols-3">
        {/* Trilho entre os círculos (decorativo): cinza inteiro + parte percorrida em verde */}
        <span aria-hidden="true" className="absolute top-[19px] right-5 left-5 h-0.5 rounded bg-linha" />
        <span
          aria-hidden="true"
          className="etapas-trilho absolute top-[19px] left-5 h-0.5 rounded"
          // Acende até a etapa atual e um pouco além, como um caminho em andamento.
          style={{ width: `min(calc((100% - 2.5rem) * ${progresso} + 4.5rem), calc(100% - 2.5rem))` }}
        />
        {ETAPAS.map(({ nome, icone }, indice) => {
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
                  "relative z-[1] flex size-10 items-center justify-center rounded-full transition-colors",
                  concluida && "bg-rota text-papel",
                  ativa && "etapa-ativa bg-pinho text-papel",
                  !concluida && !ativa && "border border-white bg-superficie text-rota shadow-[0_4px_14px_rgb(18_59_53/0.12)]",
                  indisponivel && "border-2 border-dashed border-linha text-salvia shadow-none",
                )}
              >
                {/* Na última etapa, a atual é um ponto lima: um check ali pareceria "concluída". */}
                {ativa && ultima ? (
                  <span className="size-3.5 rounded-full bg-lima shadow-[0_0_10px_rgb(215_243_106/0.8)]" />
                ) : (
                  <Icon nome={concluida ? "check" : icone} className="size-[18px]" />
                )}
              </span>

              <span
                className={cn(
                  "text-sm leading-tight sm:text-base",
                  ativa ? "font-semibold text-pinho" : "text-salvia",
                )}
              >
                {nome}
                {concluida && <span className="sr-only"> (concluída)</span>}
                {indisponivel && <span className="block">em breve</span>}
              </span>
            </li>
          );
        })}
      </ol>
    </nav>
  );
}
