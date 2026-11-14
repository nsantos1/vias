"use client";

import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import Icon from "@/components/ui/Icon";
import { dadosDaTela } from "@/lib/telas";
import Wordmark from "./Wordmark";

/**
 * Parte do cabeçalho que muda por tela: botão "Voltar" (etapas 2 e 3),
 * logo e rótulo da tela em mono, como nas referências de UI.
 * O "Voltar" usa o histórico do navegador para preservar os filtros da busca;
 * sem histórico (link aberto direto), vai para a tela anterior do fluxo.
 */
export default function CabecalhoTela() {
  const pathname = usePathname();
  const router = useRouter();
  const { rotulo, voltarPara } = dadosDaTela(pathname);

  function voltar() {
    if (window.history.length > 1) {
      router.back();
    } else {
      router.push(voltarPara);
    }
  }

  return (
    <div className="flex min-w-0 items-center gap-2 sm:gap-3">
      {voltarPara && (
        <button
          type="button"
          onClick={voltar}
          aria-label="Voltar"
          className="-ml-2 inline-flex size-11 shrink-0 items-center justify-center rounded-pill text-pinho hover:bg-nevoa"
        >
          <Icon nome="voltar" className="size-6" />
        </button>
      )}

      <Link
        href="/"
        aria-label="VIAS, página inicial"
        className="inline-flex min-h-11 shrink-0 items-center rounded-md text-pinho"
      >
        <Wordmark className="h-7 sm:h-8" />
      </Link>

      {rotulo && (
        <>
          <span aria-hidden="true" className="h-8 w-px shrink-0 bg-pinho/60" />
          <p className="truncate font-mono text-label uppercase text-grafite">{rotulo}</p>
        </>
      )}
    </div>
  );
}
