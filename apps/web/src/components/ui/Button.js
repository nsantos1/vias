import Link from "next/link";
import { cn } from "@/lib/cn";
import Icon, { Spinner } from "./Icon";

const base =
  "inline-flex min-h-11 items-center justify-center gap-2 rounded-pill px-5 py-2 text-base font-semibold transition-colors disabled:cursor-not-allowed disabled:opacity-60 aria-disabled:cursor-not-allowed aria-disabled:opacity-60";

const variantes = {
  // Ação principal da tela. Use uma por bloco.
  primario: "bg-pinho text-papel hover:bg-pinho-escuro",
  // Ação alternativa.
  secundario: "border-2 border-pinho bg-transparent text-pinho hover:bg-nevoa",
  // Ação discreta, como "Limpar filtros".
  discreto: "bg-transparent text-pinho underline-offset-4 hover:bg-nevoa hover:underline",
  // Ação que apaga ou desfaz algo.
  perigo: "bg-erro text-white hover:brightness-90",
};

/**
 * Botão acessível.
 * - `carregando`: desabilita, mostra o spinner e marca aria-busy; o texto continua
 *   visível, e "carregando" é anunciado para leitor de tela.
 * - `href`: vira um link do Next com a mesma aparência (para navegar, não para agir).
 * - `largo`: ocupa a largura toda e fica mais alto (ação principal da tela).
 * - `seta`: seta "→" decorativa depois do texto, como nas referências de UI.
 */
export default function Button({
  variante = "primario",
  carregando = false,
  disabled = false,
  largo = false,
  seta = false,
  href,
  className,
  children,
  type = "button",
  ...resto
}) {
  const classes = cn(
    base,
    variantes[variante],
    largo && "min-h-14 w-full text-lg shadow-sm",
    className,
  );
  const iconeSeta = seta && !carregando && <Icon nome="seta" className="size-5" />;

  if (href) {
    return (
      <Link href={href} className={classes} {...resto}>
        {children}
        {iconeSeta}
      </Link>
    );
  }

  return (
    <button
      type={type}
      disabled={disabled || carregando}
      aria-busy={carregando || undefined}
      className={classes}
      {...resto}
    >
      {carregando && <Spinner />}
      {children}
      {iconeSeta}
      {carregando && <span className="sr-only">, carregando</span>}
    </button>
  );
}
