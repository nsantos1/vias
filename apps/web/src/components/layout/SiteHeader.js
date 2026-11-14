import Link from "next/link";
import NavLink from "./NavLink";
import Wordmark from "./Wordmark";

// Endereço da landing institucional (projeto separado).
const SITE_INSTITUCIONAL = "https://vias-viainteligentedeacessoasaude.vercel.app";

/**
 * Cabeçalho comum a todas as páginas.
 * Itens de navegação seguem docs/sitemap.md: só "Buscar" no P0.
 * "Rota" e "Gestão" entram apenas quando os contratos forem aprovados (D-05, D-07).
 */
export default function SiteHeader() {
  return (
    <header className="border-b border-linha bg-papel">
      <div className="mx-auto flex max-w-5xl flex-wrap items-center justify-between gap-x-6 gap-y-2 px-4 py-3 sm:px-6">
        <Link
          href="/"
          aria-label="VIAS, página inicial"
          className="inline-flex min-h-11 items-center rounded-md text-pinho"
        >
          <Wordmark className="h-7 sm:h-8" />
        </Link>

        <nav aria-label="Principal">
          <ul className="flex flex-wrap items-center gap-1">
            <li>
              <NavLink href="/">Buscar</NavLink>
            </li>
            <li>
              <a
                href={SITE_INSTITUCIONAL}
                className="inline-flex min-h-11 items-center rounded-pill px-4 text-base font-semibold text-pinho transition-colors hover:bg-nevoa"
              >
                Sobre o VIAS
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </header>
  );
}
