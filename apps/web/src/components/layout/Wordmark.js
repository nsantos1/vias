/**
 * Wordmark do VIAS (mesmo desenho da landing, em public/brand).
 * Usa o SVG como máscara para herdar a cor do texto (currentColor),
 * já que um <img> não aceita mudar a cor do SVG.
 * É decorativo: o nome acessível fica no link que o envolve.
 */
export default function Wordmark({ className = "" }) {
  return (
    <span
      aria-hidden="true"
      className={`inline-block aspect-[1042/260] bg-current ${className}`}
      style={{
        maskImage: "url(/brand/vias-wordmark.svg)",
        WebkitMaskImage: "url(/brand/vias-wordmark.svg)",
        maskRepeat: "no-repeat",
        WebkitMaskRepeat: "no-repeat",
        maskSize: "contain",
        WebkitMaskSize: "contain",
      }}
    />
  );
}
