/**
 * Onda verde que liga o conteúdo ao rodapé, como na referência da tela inicial:
 * véu claro, faixa verde com reflexo e o verde-escuro do rodapé subindo para a
 * direita. O ponto lima pulsa devagar (desligado com prefers-reduced-motion).
 * Decorativa (aria-hidden).
 */
export default function OndaRodape() {
  return (
    <div aria-hidden="true" className="onda-rodape pointer-events-none relative h-24 select-none sm:h-32 lg:h-36">
      <svg viewBox="0 0 1440 200" preserveAspectRatio="none" className="absolute inset-0 size-full" focusable="false">
        <defs>
          <linearGradient id="onda-faixa" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0" stopColor="#7fd6a0" stopOpacity="0.12" />
            <stop offset="0.6" stopColor="#4cc47e" stopOpacity="0.45" />
            <stop offset="1" stopColor="#2fae6e" stopOpacity="0.75" />
          </linearGradient>
          <linearGradient id="onda-fundo" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0" stopColor="var(--color-rodape)" />
            <stop offset="1" stopColor="#0f4a3a" />
          </linearGradient>
          <linearGradient id="onda-reflexo" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0.35" stopColor="#d7f36a" stopOpacity="0" />
            <stop offset="0.8" stopColor="#b8f28a" stopOpacity="0.9" />
            <stop offset="1" stopColor="#d7f36a" stopOpacity="0.5" />
          </linearGradient>
        </defs>
        {/* véu claro */}
        <path d="M0 90 C 300 150, 700 150, 1000 95 S 1320 20, 1440 10 L1440 200 L0 200 Z" fill="#ffffff" fillOpacity="0.55" />
        {/* faixa verde */}
        <path d="M0 140 C 380 175, 760 160, 1060 110 S 1340 45, 1440 35 L1440 200 L0 200 Z" fill="url(#onda-faixa)" />
        {/* verde-escuro do rodapé */}
        <path d="M0 165 C 420 195, 800 175, 1090 128 S 1350 62, 1440 55 L1440 200 L0 200 Z" fill="url(#onda-fundo)" />
        {/* reflexo na borda */}
        <path
          d="M560 182 C 800 172, 960 150, 1090 128 S 1350 62, 1440 55"
          stroke="url(#onda-reflexo)"
          strokeWidth="2.5"
          fill="none"
          vectorEffect="non-scaling-stroke"
        />
      </svg>
      {/* O ponto fica fora do SVG para não ser achatado pela onda esticada. */}
      <span className="onda-rodape__ponto" />
    </div>
  );
}
