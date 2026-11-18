import Alert from "@/components/ui/Alert";
import { formatarData } from "@/lib/formatos";

/**
 * Informação que pode estar desatualizada.
 *
 * O Front-end NÃO decide sozinho o que é "desatualizado": não há regra de
 * validade combinada. Este aviso aparece só quando a API indicar
 * (`desatualizado = true`). Se a data de referência faltar, isso é dito.
 */
export default function AvisoDesatualizado({ desatualizado, dataReferencia }) {
  if (!desatualizado) return null;
  const data = formatarData(dataReferencia);
  return (
    <Alert tom="aviso" titulo="Esta informação pode estar desatualizada">
      {data
        ? `Última informação disponível em ${data}.`
        : "A fonte não informa a data desta informação."}
    </Alert>
  );
}
