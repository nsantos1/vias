"use client";

import { useEffect, useState } from "react";

/**
 * Número que sobe de 0 até `valor` (≈0,9 s). É só visual: quem usa deve ter o
 * texto completo para leitor de tela (este span é aria-hidden). Com
 * prefers-reduced-motion, mostra o número final direto.
 */
export default function Contador({ valor, className }) {
  const [animar] = useState(
    () =>
      typeof window !== "undefined" &&
      Number.isFinite(valor) &&
      valor > 1 &&
      !window.matchMedia?.("(prefers-reduced-motion: reduce)").matches,
  );
  const [atual, setAtual] = useState(animar ? 0 : valor);

  useEffect(() => {
    if (!animar) return undefined;
    let quadro;
    const inicio = performance.now();
    const passo = (agora) => {
      const t = Math.min(1, (agora - inicio) / 900);
      setAtual(Math.round(valor * (1 - (1 - t) ** 3)));
      if (t < 1) quadro = requestAnimationFrame(passo);
    };
    quadro = requestAnimationFrame(passo);
    return () => cancelAnimationFrame(quadro);
  }, [animar, valor]);

  return (
    <span aria-hidden="true" className={className}>
      {Number.isFinite(atual) ? atual.toLocaleString("pt-BR") : valor}
    </span>
  );
}
