import { cn } from "@/lib/cn";

/** Textos para dado ausente (documento de contexto §7.4 e §11). */
export const TEXTOS_AUSENCIA = Object.freeze({
  NAO_INFORMADO: "Não informado pela fonte",
  NAO_VERIFICADO: "Informação não verificada",
});

function ausente(valor) {
  return (
    valor === null ||
    valor === undefined ||
    (typeof valor === "string" && valor.trim() === "") ||
    (Array.isArray(valor) && valor.length === 0)
  );
}

/**
 * Mostra um campo da API ou, se ele faltar, diz que a fonte não informou.
 * Ausência NUNCA vira "não possui", "fechado" ou "não acessível".
 *
 * @param valor   o valor vindo da API
 * @param estado  "NAO_INFORMADO" (padrão) ou "NAO_VERIFICADO", quando a API disser
 * @param children  como exibir o valor presente (padrão: o próprio valor)
 */
export default function ValorInformado({ valor, estado = "NAO_INFORMADO", className, children }) {
  if (estado === "NAO_VERIFICADO" || ausente(valor)) {
    return (
      <span className={cn("text-salvia", className)}>
        {TEXTOS_AUSENCIA[estado] ?? TEXTOS_AUSENCIA.NAO_INFORMADO}
      </span>
    );
  }
  return <span className={className}>{children ?? String(valor)}</span>;
}
