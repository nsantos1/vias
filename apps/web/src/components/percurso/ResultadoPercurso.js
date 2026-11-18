import Alert from "@/components/ui/Alert";
import Badge from "@/components/ui/Badge";
import Button from "@/components/ui/Button";
import Icon from "@/components/ui/Icon";
import { formatarDuracao, horaDe, linkComoChegar, minutosDeSobra, resumoLinhas } from "@/lib/percurso";
import ListaTrechos from "./ListaTrechos";

/**
 * Resultado do POST /api/percursos: a opção recomendada em destaque, com o
 * horário de sair, o passo a passo e as outras opções recolhidas.
 * Tudo vem da API (Google Routes + SPTrans); a tela só formata.
 */
export default function ResultadoPercurso({ dados }) {
  const [recomendada, ...outras] = dados.opcoes ?? [];
  const mapas = linkComoChegar(dados.unidade);

  return (
    <section aria-labelledby="titulo-percurso" className="flex flex-col gap-6">
      <h2 id="titulo-percurso" className="sr-only">
        Percurso calculado
      </h2>

      {recomendada ? (
        <>
          <Destaque opcao={recomendada} dados={dados} />

          <section aria-labelledby="titulo-passos" className="flex flex-col gap-4">
            <h3 id="titulo-passos" className="text-2xl font-bold">
              Passo a passo
            </h3>
            <ListaTrechos trechos={recomendada.trechos} />
          </section>

          {outras.length > 0 && (
            <section aria-labelledby="titulo-outras-opcoes" className="flex flex-col gap-3">
              <h3 id="titulo-outras-opcoes" className="text-2xl font-bold">
                Outras opções
              </h3>
              <ul className="flex flex-col gap-3">
                {outras.map((opcao, indice) => (
                  <li key={indice}>
                    <details className="group rounded-2xl border border-linha bg-superficie">
                      <summary className="flex cursor-pointer list-none items-center justify-between gap-3 p-4">
                        <span className="flex flex-col">
                          <span className="font-semibold text-pinho">
                            Saia às {horaDe(opcao.saida)} · chegada às {horaDe(opcao.chegada)}
                          </span>
                          <span className="text-sm text-salvia">
                            {resumoLinhas(opcao.trechos)} · {formatarDuracao(opcao.duracaoMinutos)}
                            {opcao.chegaATempo === false && " · chega depois do horário"}
                          </span>
                        </span>
                        <Icon nome="seta" className="size-5 shrink-0 text-rota transition-transform group-open:rotate-90" />
                      </summary>
                      <div className="border-t border-linha p-4">
                        <ListaTrechos trechos={opcao.trechos} />
                      </div>
                    </details>
                  </li>
                ))}
              </ul>
            </section>
          )}
        </>
      ) : (
        <Alert tom="aviso" titulo="Sem percurso para este horário">
          {dados.avisos?.[0] ?? "Não encontramos percurso de transporte público até esta unidade."}
        </Alert>
      )}

      <div className="flex flex-col gap-2 text-sm text-salvia">
        <ul className="flex flex-col gap-1">
          {(recomendada ? dados.avisos : dados.avisos?.slice(1))?.map((aviso) => (
            <li key={aviso} className="flex items-start gap-2">
              <Icon nome="info" className="mt-0.5 size-4 shrink-0" />
              {aviso}
            </li>
          ))}
        </ul>
        <p>
          Fontes: {dados.fontes?.rotas ?? "serviço de rotas"}
          {dados.fontes?.aoVivo && <> · previsão ao vivo: {dados.fontes.aoVivo}</>}
        </p>
      </div>

      {mapas && (
        <Button
          href={mapas}
          target="_blank"
          rel="noopener noreferrer"
          variante="secundario"
          largo
          aria-label="Abrir o caminho no Google Maps (abre em nova aba)"
        >
          Abrir no Google Maps
        </Button>
      )}
    </section>
  );
}

function Destaque({ opcao, dados }) {
  const sobra = dados.horarioAtendimento ? minutosDeSobra(opcao.chegada, dados.horarioAtendimento) : null;
  return (
    <article
      aria-labelledby="titulo-saida"
      className="flex flex-col gap-4 rounded-3xl bg-pinho p-5 text-papel shadow-sm sm:p-7"
    >
      <p className="font-mono text-label uppercase text-lima">
        {dados.horarioAtendimento ? "Para chegar a tempo" : "Saindo agora"}
      </p>
      <h3 id="titulo-saida" className="font-display text-4xl leading-tight font-bold sm:text-5xl">
        Saia às {horaDe(opcao.saida)}
      </h3>
      <p className="text-lg">
        Chegada prevista às <strong>{horaDe(opcao.chegada)}</strong>
        {formatarDuracao(opcao.duracaoMinutos) && <> · {formatarDuracao(opcao.duracaoMinutos)} no total</>}
      </p>
      {dados.horarioAtendimento && (
        <p>
          Atendimento às {horaDe(dados.horarioAtendimento)}
          {sobra !== null &&
            (sobra >= 0
              ? ` — você chega ${formatarDuracao(sobra) ?? "0 min"} antes.`
              : ` — a chegada prevista é ${formatarDuracao(-sobra)} depois.`)}
        </p>
      )}
      <p className="flex items-center gap-2 text-papel/85">
        <Icon nome="lista" className="size-5 shrink-0" />
        {resumoLinhas(opcao.trechos)}
      </p>
      {opcao.chegaATempo === false && (
        <span>
          <Badge tom="aviso">Nenhuma opção chega no horário desejado</Badge>
        </span>
      )}
    </article>
  );
}
