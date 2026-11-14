import { useId } from "react";
import { cn } from "@/lib/cn";
import Icon from "./Icon";

const controle =
  "block min-h-11 w-full rounded-xl border bg-superficie px-4 py-2 text-base text-grafite placeholder:text-salvia disabled:cursor-not-allowed disabled:opacity-60";

/**
 * Monta rótulo, dica e erro em volta de um controle e liga tudo por id:
 * o rótulo usa htmlFor, e a dica e o erro entram em aria-describedby.
 * O erro aparece em texto com ícone, não só pela cor da borda.
 */
function useCampo({ id, dica, erro }) {
  const gerado = useId();
  const campoId = id ?? gerado;
  const dicaId = dica ? `${campoId}-dica` : undefined;
  const erroId = erro ? `${campoId}-erro` : undefined;
  const descricao = [dicaId, erroId].filter(Boolean).join(" ") || undefined;
  return { campoId, dicaId, erroId, descricao };
}

function Moldura({ campoId, rotulo, obrigatorio, dica, dicaId, erro, erroId, className, children }) {
  return (
    <div className={cn("flex flex-col gap-1.5", className)}>
      <label htmlFor={campoId} className="font-semibold text-grafite">
        {rotulo}
        {obrigatorio && <span className="font-normal text-salvia"> (obrigatório)</span>}
      </label>
      {dica && (
        <p id={dicaId} className="text-sm text-salvia">
          {dica}
        </p>
      )}
      {children}
      {erro && (
        <p id={erroId} className="flex items-start gap-1.5 text-sm font-medium text-erro">
          <Icon nome="erro" className="mt-px size-4" />
          {erro}
        </p>
      )}
    </div>
  );
}

/**
 * Campo de texto com rótulo visível (nunca só placeholder).
 * - `icone`: ícone decorativo à esquerda (ex.: "busca").
 * - `aoLimpar`: mostra o botão "Limpar campo" quando há texto. Precisa de
 *   Client Component, porque recebe uma função.
 * - `destaque`: borda verde mais grossa, como o campo principal da busca.
 */
export function TextField({
  id,
  rotulo,
  dica,
  erro,
  obrigatorio = false,
  icone,
  aoLimpar,
  destaque = false,
  className,
  ...inputProps
}) {
  const { campoId, dicaId, erroId, descricao } = useCampo({ id, dica, erro });
  const temTexto = Boolean(inputProps.value);
  return (
    <Moldura {...{ campoId, rotulo, obrigatorio, dica, dicaId, erro, erroId, className }}>
      <div className="relative">
        {icone && (
          <Icon
            nome={icone}
            className="pointer-events-none absolute top-1/2 left-4 size-6 -translate-y-1/2 text-rota"
          />
        )}
        <input
          id={campoId}
          required={obrigatorio}
          aria-invalid={erro ? true : undefined}
          aria-describedby={descricao}
          className={cn(
            controle,
            destaque && "min-h-14 border-2 text-lg",
            icone && "pl-13",
            aoLimpar && "pr-13",
            erro ? "border-erro" : destaque ? "border-rota" : "border-borda-campo",
          )}
          {...inputProps}
        />
        {aoLimpar && temTexto && !inputProps.disabled && (
          <button
            type="button"
            onClick={(evento) => {
              // O botão some depois de limpar; devolve o foco ao campo para o
              // teclado não se perder.
              const campo = evento.currentTarget.parentElement.querySelector("input");
              aoLimpar(evento);
              campo?.focus();
            }}
            aria-label="Limpar campo"
            className="absolute top-1/2 right-1.5 inline-flex size-11 -translate-y-1/2 items-center justify-center rounded-pill text-salvia hover:bg-nevoa hover:text-pinho"
          >
            <Icon nome="fechar" className="size-5" />
          </button>
        )}
      </div>
    </Moldura>
  );
}

/**
 * Seleção nativa (<select>): funciona com teclado, leitor de tela e celular sem
 * código extra. `opcoes` = [{ valor, rotulo }], vindas da API, nunca inventadas.
 */
export function SelectField({
  id,
  rotulo,
  dica,
  erro,
  obrigatorio = false,
  opcoes = [],
  textoVazio = "Selecione",
  className,
  ...selectProps
}) {
  const { campoId, dicaId, erroId, descricao } = useCampo({ id, dica, erro });
  return (
    <Moldura {...{ campoId, rotulo, obrigatorio, dica, dicaId, erro, erroId, className }}>
      <select
        id={campoId}
        required={obrigatorio}
        aria-invalid={erro ? true : undefined}
        aria-describedby={descricao}
        className={cn(controle, "pr-10", erro ? "border-erro" : "border-borda-campo")}
        {...selectProps}
      >
        <option value="">{textoVazio}</option>
        {opcoes.map((opcao) => (
          <option key={opcao.valor} value={opcao.valor}>
            {opcao.rotulo}
          </option>
        ))}
      </select>
    </Moldura>
  );
}
