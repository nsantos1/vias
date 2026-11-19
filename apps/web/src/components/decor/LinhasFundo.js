/**
 * Linhas curvas claras no canto esquerdo da tela inicial, como na referência.
 * Só decoração (aria-hidden).
 */
export default function LinhasFundo() {
  return (
    <svg
      aria-hidden="true"
      focusable="false"
      viewBox="0 0 160 900"
      preserveAspectRatio="none"
      className="pointer-events-none absolute inset-y-0 left-0 -z-10 hidden h-full w-40 select-none lg:block"
      fill="none"
    >
      {[0, 14, 28, 42, 56].map((d) => (
        <path
          key={d}
          d={`M${-40 + d} 0 C ${90 + d} 260, ${-30 + d} 560, ${70 + d} 900`}
          stroke="var(--color-salvia)"
          strokeOpacity={0.09 - d / 1200}
          strokeWidth="1.2"
        />
      ))}
    </svg>
  );
}
