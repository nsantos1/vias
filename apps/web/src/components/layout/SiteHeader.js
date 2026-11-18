import Link from "next/link";
import { Suspense } from "react";
import CabecalhoTela from "./CabecalhoTela";
import Wordmark from "./Wordmark";

/**
 * Cabeçalho comum: [Voltar] VIAS │ RÓTULO DA TELA (referências de UI).
 * O link "Sobre o VIAS" foi para o rodapé. "Rota" e "Gestão" não aparecem
 * enquanto os contratos D-05 e D-07 não forem aprovados.
 *
 * CabecalhoTela lê a URL (usePathname). Com cacheComponents, isso precisa de
 * <Suspense> em rotas dinâmicas como /unidades/[id]; o fallback é só o logo.
 */
export default function SiteHeader() {
  return (
    <header className="relative z-10">
      <div className="mx-auto flex max-w-5xl items-center px-4 py-3 sm:px-6 sm:py-4">
        <Suspense
          fallback={
            <Link
              href="/"
              aria-label="VIAS, página inicial"
              className="inline-flex min-h-11 shrink-0 items-center rounded-md text-pinho"
            >
              <Wordmark className="h-7 sm:h-8" />
            </Link>
          }
        >
          <CabecalhoTela />
        </Suspense>
      </div>
    </header>
  );
}
