import Link from "next/link";
import { Suspense } from "react";
import Icon from "@/components/ui/Icon";
import { SITE_INSTITUCIONAL } from "@/lib/site";
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
    <header className="cabecalho relative z-10">
      <div className="cabecalho__conteudo mx-auto flex max-w-5xl items-center justify-between gap-4 px-4 py-3 sm:px-6 sm:py-4">
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
        <div className="flex shrink-0 items-center gap-3">
          {/* Só na tela inicial (globals.css): a saída da demonstração fica no canto, longe da busca. */}
          <a href={SITE_INSTITUCIONAL} className="link-landing selo-vidro hidden items-center gap-2 rounded-pill px-5 py-2.5 text-sm font-semibold text-pinho">
            <Icon nome="voltar" className="size-4 text-rota transition-transform" />
            Voltar para landing page
          </a>
          <p className="selo-vidro hidden shrink-0 items-center gap-2 rounded-pill px-5 py-2.5 text-sm font-medium text-pinho md:flex">
            <Icon nome="escudo" className="size-5 text-rota" />
            Projeto FIAP · 2026
          </p>
        </div>
      </div>
    </header>
  );
}
