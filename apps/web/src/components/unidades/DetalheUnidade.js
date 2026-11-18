"use client";

import EstadoConsulta from "@/components/estados/EstadoConsulta";
import ValorInformado from "@/components/estados/ValorInformado";
import Badge from "@/components/ui/Badge";
import Button from "@/components/ui/Button";
import Icon from "@/components/ui/Icon";
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
import LinhaInfo from "./LinhaInfo";

/**
 * Tela de detalhe (FE-13), no estilo de card da referência 2. Busca a unidade
 * pelo id na API (sitemap, regra 4), nunca reaproveita dados da lista.
 * Os avisos são os que a API escreveu.
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
          <Skeleton className="h-96 w-full rounded-3xl" />
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
      <article
        aria-labelledby="nome-unidade"
        className="flex flex-col gap-5 rounded-3xl border border-linha bg-superficie p-5 shadow-sm sm:p-7"
      >
        <div className="flex flex-col gap-1">
          <p className="font-mono text-label uppercase text-rota">Unidade de saúde</p>
          <h1 id="nome-unidade" className="font-display text-3xl leading-tight font-bold text-pinho sm:text-4xl">
            {u.nome}
          </h1>
          <p className="text-salvia">
            <ValorInformado valor={u.tipoUnidade} />
            {u.codigoCnes && <> · CNES {u.codigoCnes}</>}
          </p>
        </div>

        <div className="flex flex-col gap-3 rounded-2xl bg-nevoa p-4">
          <p className="flex items-center gap-3">
            <span className="flex size-9 shrink-0 items-center justify-center rounded-full bg-rota text-papel">
              <Icon nome="check" className="size-5" />
            </span>
            <span className="font-display text-lg font-semibold text-pinho">Serviços no cadastro</span>
          </p>
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
        </div>

        <dl>
          <LinhaInfo icone="pessoa" rotulo="Atendimento SUS">
            {textoAtendeSus(u.atendeSus)}
          </LinhaInfo>
          <LinhaInfo icone="pin" rotulo="Endereço">
            <ValorInformado valor={enderecoEmTexto(u.endereco)} />
          </LinhaInfo>
          <LinhaInfo icone="telefone" rotulo="Telefone">
            {telefone ? (
              <a
                href={`tel:${String(u.telefone).replace(/\D/g, "")}`}
                className="font-semibold text-pinho underline underline-offset-4"
              >
                {telefone}
              </a>
            ) : (
              <ValorInformado valor={null} />
            )}
          </LinhaInfo>
          <LinhaInfo icone="relogio" rotulo="Horário">
            <ValorInformado valor={u.horarioFuncionamento} />
          </LinhaInfo>
          <LinhaInfo icone="acessibilidade" rotulo="Acessibilidade">
            <span className="flex flex-col gap-1">
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
            </span>
          </LinhaInfo>
          <LinhaInfo icone="alvo" rotulo="Bairro">
            <ValorInformado valor={u.regiao?.nome ?? u.endereco?.bairro} />
          </LinhaInfo>
          <LinhaInfo icone="base" rotulo="Fonte">
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
          </LinhaInfo>
        </dl>

        {u.avisos?.length > 0 && (
          <div className="flex items-start gap-3 text-salvia">
            <Icon nome="info" className="mt-0.5 size-6 shrink-0" />
            <div className="flex flex-col gap-1">
              <p className="font-semibold text-grafite">Antes de ir</p>
              <ul className="flex flex-col gap-1">
                {u.avisos.map((aviso) => (
                  <li key={aviso}>{aviso}</li>
                ))}
              </ul>
            </div>
          </div>
        )}

        {mapas ? (
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
        ) : (
          <p className="text-sm text-salvia">
            A fonte não informa coordenadas nem endereço desta unidade, então não há link para o mapa.
          </p>
        )}
      </article>
    </div>
  );
}
