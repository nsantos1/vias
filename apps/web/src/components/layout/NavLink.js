"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

/**
 * Item de navegação interna. Marca a página atual com aria-current="page",
 * para o leitor de tela anunciar onde a pessoa está, e com estilo visível
 * (não depende só da cor: o item ativo ganha fundo).
 */
export default function NavLink({ href, children }) {
  const pathname = usePathname();
  const ativo = href === "/" ? pathname === "/" : pathname.startsWith(href);

  return (
    <Link
      href={href}
      aria-current={ativo ? "page" : undefined}
      className={`inline-flex min-h-11 items-center rounded-pill px-4 text-base font-semibold transition-colors ${
        ativo
          ? "bg-pinho text-papel"
          : "text-pinho hover:bg-nevoa"
      }`}
    >
      {children}
    </Link>
  );
}
