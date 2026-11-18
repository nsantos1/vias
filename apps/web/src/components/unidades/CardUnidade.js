import Badge from "@/components/ui/Badge";
import Button from "@/components/ui/Button";
import ValorInformado from "@/components/estados/ValorInformado";
import { textoAcessibilidade, textoAtendeSus } from "@/lib/unidade";

/**
 * Card de uma unidade na lista de resultados (FE-12, referência 02-unidade).
 * Mostra só o que a API devolveu; campo ausente aparece como "Não informado pela fonte".
 */
export default function CardUnidade({ unidade }) {
  const acess = textoAcessibilidade(unidade.acessibilidade);
  const tituloId = `unidade-${unidade.id}`;

  return (
    <article
      aria-labelledby={tituloId}
      className="flex flex-col gap-4 rounded-2xl border border-linha bg-superficie p-5 shadow-sm"
    >
      <div className="flex flex-col gap-1">
        <p className="font-mono text-label uppercase text-rota">
          <ValorInformado valor={unidade.tipoUnidade} />
        </p>
        <h2 id={tituloId} className="font-display text-xl font-semibold text-pinho">
          {unidade.nome}
        </h2>
      </div>

      <dl className="grid grid-cols-1 gap-x-4 gap-y-2 text-sm sm:grid-cols-[auto_1fr]">
        <dt className="font-mono uppercase text-salvia">Bairro</dt>
        <dd>
          <ValorInformado valor={unidade.bairro} />
        </dd>
        <dt className="font-mono uppercase text-salvia">Atende SUS</dt>
        <dd>{textoAtendeSus(unidade.atendeSus)}</dd>
        <dt className="font-mono uppercase text-salvia">Acessibilidade</dt>
        <dd>
          <Badge tom={acess.tom} comIcone={false}>
            {acess.rotulo}
          </Badge>
        </dd>
      </dl>

      {unidade.servicos?.length > 0 && (
        <div className="flex flex-col gap-2">
          <p className="font-mono text-sm uppercase text-salvia">Serviços no cadastro</p>
          <ul className="flex flex-wrap gap-2">
            {unidade.servicos.map((nome) => (
              <li key={nome}>
                <Badge tom="neutro">{nome}</Badge>
              </li>
            ))}
          </ul>
        </div>
      )}

      <div>
        <Button
          variante="secundario"
          seta
          href={`/unidades/${encodeURIComponent(unidade.id)}`}
          aria-label={`Ver detalhes de ${unidade.nome}`}
        >
          Ver unidade
        </Button>
      </div>
    </article>
  );
}
