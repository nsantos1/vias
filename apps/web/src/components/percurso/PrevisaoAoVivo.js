import Icon from "@/components/ui/Icon";
import { horaDe } from "@/lib/percurso";

function textoAcessivel(acessivel) {
  if (acessivel === true) return "acessível";
  if (acessivel === false) return "não acessível";
  return "acessibilidade não informada";
}

/**
 * Previsão ao vivo da SPTrans (Olho Vivo) no ponto de embarque de um trecho de
 * ônibus. Mostra só o que a SPTrans informou: quando ela não informa se o
 * veículo é acessível, a tela diz isso, nunca presume.
 */
export default function PrevisaoAoVivo({ aoVivo }) {
  if (!aoVivo) return null;

  if (aoVivo.status !== "DISPONIVEL") {
    return (
      <p className="flex items-start gap-2 text-sm text-salvia">
        <Icon nome="info" className="mt-0.5 size-4 shrink-0" />
        <span>{aoVivo.mensagem ?? "Sem previsão ao vivo para este trecho."}</span>
      </p>
    );
  }

  const proximo = aoVivo.proximoAcessivel;
  return (
    <div className="flex flex-col gap-2 rounded-2xl border border-linha bg-nevoa p-3">
      <p className="font-mono text-label uppercase text-rota">
        Ao vivo · SPTrans{aoVivo.consultadoAs && <> às {aoVivo.consultadoAs}</>}
      </p>
      <p className="flex items-start gap-2 font-semibold text-pinho">
        <Icon nome="acessibilidade" className="mt-0.5 size-5 shrink-0" />
        {proximo ? (
          <span>
            Próximo ônibus acessível: {horaDe(proximo.previsto)}
            {proximo.prefixo && <span className="font-normal text-salvia"> (veículo {proximo.prefixo})</span>}
          </span>
        ) : (
          <span>Nenhum ônibus acessível com previsão para este ponto agora.</span>
        )}
      </p>
      <div>
        <p className="text-sm text-salvia">
          Próximos ônibus no ponto{aoVivo.parada && <> {aoVivo.parada}</>}:
        </p>
        <ul className="mt-1 flex flex-wrap gap-2">
          {aoVivo.onibus.map((o) => (
            <li
              key={`${o.prefixo}-${o.previsto}`}
              className="rounded-pill border border-borda-campo bg-superficie px-3 py-1 text-sm"
            >
              <span className="font-semibold">{horaDe(o.previsto)}</span>
              <span className="text-salvia"> · {textoAcessivel(o.acessivel)}</span>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}
