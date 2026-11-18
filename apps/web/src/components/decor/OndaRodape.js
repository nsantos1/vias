/**
 * Onda verde que liga o conteúdo ao rodapé, como nas referências de UI.
 * Decorativa (aria-hidden). A cor de baixo é a mesma do rodapé.
 */
export default function OndaRodape() {
  return (
    <svg
      aria-hidden="true"
      focusable="false"
      viewBox="0 0 1440 160"
      preserveAspectRatio="none"
      className="pointer-events-none block h-20 w-full select-none sm:h-28"
    >
      <path d="M0 120 C 360 150, 720 40, 1440 0 L1440 160 L0 160 Z" fill="var(--color-nevoa)" />
      <path d="M0 150 C 420 160, 820 70, 1440 30 L1440 160 L0 160 Z" fill="var(--color-rodape)" />
      <path
        d="M700 150 C 900 110, 1100 80, 1440 60"
        fill="none"
        stroke="var(--color-rodape-texto)"
        strokeOpacity="0.4"
        strokeWidth="2"
      />
      <circle cx="1040" cy="93" r="9" fill="var(--color-rodape)" stroke="var(--color-lima)" strokeWidth="4" />
    </svg>
  );
}
