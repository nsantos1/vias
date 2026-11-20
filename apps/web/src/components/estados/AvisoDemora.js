"use client";

import { useEffect, useState } from "react";

export const ATRASO_AVISO_MS = 5_000;

/**
 * Aparece quando uma consulta passa de alguns segundos. A API roda no plano
 * gratuito do Render, que pode levar até 3 minutos para "acordar" na primeira
 * consulta; sem este aviso, a pessoa acharia que o app travou.
 * Vai dentro de um elemento role="status", que o leitor de tela anuncia.
 */
export default function AvisoDemora({ atrasoMs = ATRASO_AVISO_MS }) {
  const [visivel, setVisivel] = useState(false);

  useEffect(() => {
    const timer = setTimeout(() => setVisivel(true), atrasoMs);
    return () => clearTimeout(timer);
  }, [atrasoMs]);

  if (!visivel) return null;
  return (
    <p className="text-sm text-salvia">
      A primeira consulta pode levar até 3 minutos, e a tela avisa enquanto espera. Caso não carregue,
      execute um recarregamento da página com a tecla “F5”.
    </p>
  );
}
