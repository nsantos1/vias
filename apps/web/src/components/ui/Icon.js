import { cn } from "@/lib/cn";

/*
 * Ícones de apoio. São sempre decorativos (aria-hidden): o significado
 * precisa estar no texto ao lado, nunca só no ícone ou na cor.
 */

const caminhos = {
  info: (
    <>
      <circle cx="12" cy="12" r="9" />
      <path d="M12 11v5" />
      <path d="M12 8h.01" />
    </>
  ),
  aviso: (
    <>
      <path d="M12 4 2.8 19.5h18.4L12 4Z" />
      <path d="M12 10v4" />
      <path d="M12 17h.01" />
    </>
  ),
  erro: (
    <>
      <circle cx="12" cy="12" r="9" />
      <path d="m9 9 6 6" />
      <path d="m15 9-6 6" />
    </>
  ),
  fechar: (
    <>
      <path d="m7 7 10 10" />
      <path d="M17 7 7 17" />
    </>
  ),
  busca: (
    <>
      <circle cx="11" cy="11" r="6.5" />
      <path d="m16 16 4 4" />
    </>
  ),
  vazio: (
    <>
      <circle cx="11" cy="11" r="6.5" />
      <path d="m16 16 4 4" />
      <path d="M8.5 11h5" />
    </>
  ),
  seta: (
    <>
      <path d="M5 12h14" />
      <path d="m13 6 6 6-6 6" />
    </>
  ),
  voltar: <path d="m15 5-7 7 7 7" />,
  check: <path d="m5 12.5 4.5 4.5L19 7.5" />,
  pin: (
    <>
      <path d="M12 21s-6.5-5.6-6.5-11a6.5 6.5 0 0 1 13 0c0 5.4-6.5 11-6.5 11Z" />
      <circle cx="12" cy="10" r="2.5" />
    </>
  ),
  lista: (
    <>
      <rect x="5" y="4" width="14" height="17" rx="2" />
      <path d="M9 4.5V3h6v1.5" />
      <path d="M9 10h6" />
      <path d="M9 14h6" />
      <path d="M9 18h3" />
    </>
  ),
  pessoa: (
    <>
      <circle cx="12" cy="8" r="3.5" />
      <path d="M5 20a7 7 0 0 1 14 0" />
    </>
  ),
  base: (
    <>
      <ellipse cx="12" cy="5.5" rx="7" ry="2.5" />
      <path d="M5 5.5v6c0 1.4 3.1 2.5 7 2.5s7-1.1 7-2.5v-6" />
      <path d="M5 11.5v6c0 1.4 3.1 2.5 7 2.5s7-1.1 7-2.5v-6" />
    </>
  ),
  onibus: (
    <>
      <rect x="5" y="3.5" width="14" height="14" rx="2.5" />
      <path d="M5 11h14" />
      <path d="M8 14.5h.01" />
      <path d="M16 14.5h.01" />
      <path d="M7.5 17.5V20" />
      <path d="M16.5 17.5V20" />
    </>
  ),
  trem: (
    <>
      <rect x="6" y="3.5" width="12" height="13" rx="3" />
      <path d="M6 10h12" />
      <path d="M9.5 13.5h.01" />
      <path d="M14.5 13.5h.01" />
      <path d="m8.5 16.5-2 4" />
      <path d="m15.5 16.5 2 4" />
    </>
  ),
  caminhar: (
    <>
      <circle cx="13" cy="4.5" r="1.75" />
      <path d="m10 21 2.5-6.5L15 17v4" />
      <path d="M12.5 14.5 13.5 9l-3 1.5-1.5 3" />
      <path d="m13.5 9 2 3 2.5 1" />
    </>
  ),
  relogio: (
    <>
      <circle cx="12" cy="12" r="8.5" />
      <path d="M12 7.5V12l3 2" />
    </>
  ),
  telefone: (
    <path d="M6.5 3.5h3l1.5 4-2 1.5a10 10 0 0 0 6 6l1.5-2 4 1.5v3a2 2 0 0 1-2 2A16 16 0 0 1 4.5 5.5a2 2 0 0 1 2-2Z" />
  ),
  acessibilidade: (
    <>
      <circle cx="12" cy="4.5" r="1.8" />
      <path d="M6 8.5l6 1.5 6-1.5" />
      <path d="M12 10v4.5l-3 5.5" />
      <path d="M12 14.5l3 5.5" />
    </>
  ),
  // Prédio com cruz (unidade de saúde).
  hospital: (
    <>
      <path d="M4 21V8.5L12 4l8 4.5V21" />
      <path d="M2.5 21h19" />
      <path d="M12 8.5v5M9.5 11h5" />
      <path d="M10 21v-3.5h4V21" />
    </>
  ),
  teclado: (
    <>
      <rect x="2.5" y="6" width="19" height="12" rx="2" />
      <path d="M6.5 10h.01M10 10h.01M13.5 10h.01M17 10h.01M7 14h10" />
    </>
  ),
  escudo: (
    <>
      <path d="M12 3 4.5 6v5.5c0 4.6 3.1 8.2 7.5 9.5 4.4-1.3 7.5-4.9 7.5-9.5V6L12 3Z" />
      <path d="m9 12 2.2 2.2L15.5 10" />
    </>
  ),
  avancar: <path d="m9 5 7 7-7 7" />,
  mapa: (
    <>
      <path d="M9 4.5 3.5 6.5v13L9 17.5l6 2 5.5-2v-13L15 6.5l-6-2Z" />
      <path d="M9 4.5v13M15 6.5v13" />
    </>
  ),
  alvo: (
    <>
      <circle cx="12" cy="12" r="7.5" />
      <circle cx="12" cy="12" r="2.5" />
      <path d="M12 2v2.5M12 19.5V22M2 12h2.5M19.5 12H22" />
    </>
  ),
};

export default function Icon({ nome, className }) {
  return (
    <svg
      aria-hidden="true"
      focusable="false"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      className={cn("size-5 shrink-0", className)}
    >
      {caminhos[nome]}
    </svg>
  );
}

/** Indicador de carregamento girando. Também decorativo. */
export function Spinner({ className }) {
  return (
    <svg
      aria-hidden="true"
      focusable="false"
      viewBox="0 0 24 24"
      fill="none"
      className={cn("size-5 shrink-0 animate-spin", className)}
    >
      <circle cx="12" cy="12" r="9" stroke="currentColor" strokeOpacity="0.25" strokeWidth="3" />
      <path d="M21 12a9 9 0 0 0-9-9" stroke="currentColor" strokeWidth="3" strokeLinecap="round" />
    </svg>
  );
}
