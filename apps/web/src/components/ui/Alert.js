import { cn } from "@/lib/cn";
import Icon from "./Icon";

const tons = {
  info: { classe: "border-linha bg-nevoa text-grafite", icone: "info", corIcone: "text-pinho" },
  aviso: { classe: "border-aviso/30 bg-aviso-fundo text-grafite", icone: "aviso", corIcone: "text-aviso" },
  erro: { classe: "border-erro/30 bg-erro-fundo text-grafite", icone: "erro", corIcone: "text-erro" },
};

/**
 * Mensagem em bloco.
 * - `erro` usa role="alert" (o leitor de tela anuncia na hora);
 * - `info` e `aviso` usam role="status" (anunciado sem interromper).
 * O título diz o que aconteceu; o corpo diz o que a pessoa pode fazer.
 * `acao` recebe, por exemplo, um <Button> de "Tentar novamente".
 */
export default function Alert({ tom = "info", titulo, acao, className, children }) {
  const { classe, icone, corIcone } = tons[tom];
  return (
    <div
      role={tom === "erro" ? "alert" : "status"}
      className={cn("flex gap-3 rounded-xl border p-4", classe, className)}
    >
      <Icon nome={icone} className={cn("mt-0.5", corIcone)} />
      <div className="flex flex-1 flex-col gap-1">
        {titulo && <p className="font-semibold">{titulo}</p>}
        {children && <div className="text-grafite">{children}</div>}
        {acao && <div className="mt-2">{acao}</div>}
      </div>
    </div>
  );
}
