"use client";

import EstadoConsulta from "@/components/estados/EstadoConsulta";
import ValorInformado from "@/components/estados/ValorInformado";
import Alert from "@/components/ui/Alert";
import Badge from "@/components/ui/Badge";
import Button from "@/components/ui/Button";
import Skeleton from "@/components/ui/Skeleton";
import { useConsulta } from "@/hooks/useConsulta";
import { formatarData } from "@/lib/formatos";
import {
  enderecoEmTexto,
  formatarTelefone,
  linkMapas,
  textoAcessibilidade,
  textoAtendeSus,
} from "@/lib/unidade";
import { obterUnidade } from "@/services/api/unidades";

function Linha({ rotulo, children }) {
  return (
    <div className="grid grid-cols-1 gap-1 border-b border-linha py-3 last:border-b-0 sm:grid-cols-[11rem_1fr] sm:gap-4">
      <dt className="font-mono text-sm uppercase text-salvia">{rotulo}</dt>
      <dd className="text-grafite">{children}</dd>
    </div>
  );
}

/**
 * Tela de detalhe (FE-13). Busca a unidade pelo id no servidor (sitemap, regra 4),
 * nunca reaproveita dados da lista. Os avisos são os que a API escreveu.
 */
export default function DetalheUnidade({ id }) {
  const consulta = useConsulta(`unidade:${id}`, (signal) => obterUnidade(id, { signal }));

  return (
    <EstadoConsulta
      consulta={consulta}
      rotuloCarregando="Carregando unidade…"
      esqueleto={
        <div className="flex flex-col gap-4">
          <Skeleton className="h-10 w-3/4" />
          <Skeleton className="h-72 w-full" />
        </div>
      }
      tituloErro={
        consulta.erro?.status === 404 ? "Unidade não encontrada" : "Não foi possível carregar a unidade"
      }
      acaoErro={
        <Button variante="discreto" href="/">
          Voltar à busca
        </Button>
      }
    >
      {(u) => <Conteudo unidade={u} />}
    </EstadoConsulta>
  );
}

function Conteudo({ unidade: u }) {
  const acess = textoAcessibilidade(u.acessibilidade?.status);
  const verificada = ["ACESSIVEL", "NAO_ACESSIVEL"].includes(u.acessibilidade?.status);
  const mapas = linkMapas(u);
  const telefone = formatarTelefone(u.telefone);
  const prov = u.proveniencia;

  return (
    <div className="flex flex-col gap-6">
      <section
        aria-labelledby="nome-unidade"
        className="flex flex-col gap-4 rounded-2xl border border-linha bg-superficie p-5 shadow-sm sm:p-6"
      >
        <div className="flex flex-col gap-1">
          <p className="font-mono text-label uppercase text-rota">Unidade de saúde</p>
          <h1 id="nome-unidade" className="font-display text-3xl leading-tight font-bold text-pinho">
            {u.nome}
          </h1>
          <p className="text-salvia">
            <ValorInformado valor={u.tipoUnidade} />
            {u.codigoCnes && <> · CNES {u.codigoCnes}</>}
          </p>
        </div>

        <dl>
          <Linha rotulo="Serviços">
            {u.servicos?.length ? (
              <ul className="flex flex-wrap gap-2">
                {u.servicos.map((s) => (
                  <li key={s.id}>
                    <Badge tom="neutro">{s.nome}</Badge>
                  </li>
                ))}
              </ul>
            ) : (
              <ValorInformado valor={null} />
            )}
          </Linha>
          <Linha rotulo="Atendimento SUS">{textoAtendeSus(u.atendeSus)}</Linha>
          <Linha rotulo="Endereço">
            <ValorInformado valor={enderecoEmTexto(u.endereco)} />
          </Linha>
          <Linha rotulo="Telefone">
            {telefone ? (
              <a href={`tel:${String(u.telefone).replace(/\D/g, "")}`} className="font-semibold text-pinho underline">
                {telefone}
              </a>
            ) : (
              <ValorInformado valor={null} />
            )}
          </Linha>
          <Linha rotulo="Horário">
            <ValorInformado valor={u.horarioFuncionamento} />
          </Linha>
          <Linha rotulo="Acessibilidade">
            <div className="flex flex-col gap-1">
              <span>
                <Badge tom={acess.tom} comIcone={false}>
                  {acess.rotulo}
                </Badge>
              </span>
              {verificada && (
                <span className="text-sm text-salvia">
                  Fonte: {u.acessibilidade.fonte ?? "não informada"}
                  {formatarData(u.acessibilidade.dataVerificacao) &&
                    ` · verificada em ${formatarData(u.acessibilidade.dataVerificacao)}`}
                </span>
              )}
            </div>
          </Linha>
          <Linha rotulo="Região">
            <ValorInformado valor={u.regiao?.nome} />
          </Linha>
          <Linha rotulo="Fonte">
            {prov ? (
              <span className="flex flex-col gap-0.5">
                <span>{prov.nomeFonte ?? prov.fonte}</span>
                <span className="text-sm text-salvia">
                  {formatarData(prov.dataReferencia)
                    ? `Cadastro atualizado na fonte em ${formatarData(prov.dataReferencia)}`
                    : "A fonte não informa a data desta informação."}
                </span>
              </span>
            ) : (
              <ValorInformado valor={null} />
            )}
          </Linha>
        </dl>
      </section>

      {u.avisos?.length > 0 && (
        <Alert tom="info" titulo="Antes de ir">
          <ul className="flex list-disc flex-col gap-1 pl-5">
            {u.avisos.map((aviso) => (
              <li key={aviso}>{aviso}</li>
            ))}
          </ul>
        </Alert>
      )}

      <div className="flex flex-col gap-3 sm:flex-row">
        {mapas && (
          <Button
            href={mapas}
            target="_blank"
            rel="noopener noreferrer"
            largo
            seta
            aria-label={`Abrir ${u.nome} no app de mapas (abre em nova aba)`}
          >
            Abrir no app de mapas
          </Button>
        )}
      </div>
      {!mapas && (
        <p className="text-sm text-salvia">
          A fonte não informa coordenadas nem endereço desta unidade, então não há link para o mapa.
        </p>
      )}
    </div>
  );
}
