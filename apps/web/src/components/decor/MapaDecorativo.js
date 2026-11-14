/**
 * Ilustração de fundo da tela de busca: ruas estilizadas, um traço de rota e
 * um pin. É só decoração (aria-hidden) e NÃO representa nenhum lugar real.
 * Por decisão R-03 aparece só na tela de busca, nunca perto de uma unidade.
 */
export default function MapaDecorativo({ className = "" }) {
  return (
    <svg
      aria-hidden="true"
      focusable="false"
      viewBox="0 0 400 420"
      className={`pointer-events-none select-none ${className}`}
      style={{
        maskImage: "radial-gradient(circle at 70% 35%, #000 35%, transparent 72%)",
        WebkitMaskImage: "radial-gradient(circle at 70% 35%, #000 35%, transparent 72%)",
      }}
    >
      {/* quarteirões */}
      <g fill="var(--color-nevoa)">
        <rect x="40" y="40" width="90" height="70" rx="6" transform="rotate(-18 85 75)" />
        <rect x="170" y="10" width="110" height="80" rx="6" transform="rotate(-18 225 50)" />
        <rect x="300" y="60" width="90" height="90" rx="6" transform="rotate(-18 345 105)" />
        <rect x="90" y="160" width="120" height="80" rx="6" transform="rotate(-18 150 200)" />
        <rect x="250" y="190" width="100" height="90" rx="6" transform="rotate(-18 300 235)" />
        <rect x="140" y="300" width="110" height="80" rx="6" transform="rotate(-18 195 340)" />
      </g>
      {/* ruas */}
      <g stroke="var(--color-linha)" strokeWidth="6" strokeLinecap="round" fill="none">
        <path d="M0 160 L400 30" />
        <path d="M0 300 L400 170" />
        <path d="M30 420 L400 300" />
        <path d="M120 0 L230 420" />
        <path d="M260 0 L370 420" />
      </g>
      {/* traço de rota ilustrativo */}
      <path
        d="M10 400 C 120 360, 170 300, 230 270 S 330 210, 320 120"
        fill="none"
        stroke="var(--color-rota)"
        strokeWidth="4"
        strokeLinecap="round"
      />
      <circle cx="230" cy="270" r="9" fill="var(--color-papel)" stroke="var(--color-rota)" strokeWidth="4" />
      {/* pin */}
      <circle cx="320" cy="112" r="34" fill="var(--color-lima)" opacity="0.35" />
      <path
        d="M320 118 c-14-16-22-27-22-38 a22 22 0 0 1 44 0 c0 11-8 22-22 38z"
        fill="var(--color-pinho)"
      />
      <circle cx="320" cy="80" r="8" fill="var(--color-papel)" />
    </svg>
  );
}
