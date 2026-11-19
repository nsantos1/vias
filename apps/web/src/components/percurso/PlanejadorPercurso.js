"use client";

import { useState } from "react";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import { TextField } from "@/components/ui/Field";
import Icon from "@/components/ui/Icon";
import Skeleton from "@/components/ui/Skeleton";
import { ESTADOS, useConsulta } from "@/hooks/useConsulta";
import { ESTADOS_LOCAL, useLocalizacao } from "@/hooks/useLocalizacao";
import { cn } from "@/lib/cn";
import { FOLGAS, FOLGA_PADRAO, dataLocal, linkComoChegar, montarHorario } from "@/lib/percurso";
import { enderecoEmTexto } from "@/lib/unidade";
import { calcularPercurso } from "@/services/api/percursos";
import { obterUnidade } from "@/services/api/unidades";
import ResultadoPercurso from "./ResultadoPercurso";

/**
 * Tela 3 de 3, Percurso (D-20): a pessoa diz a hora do atendimento e o VIAS
 * responde "saia até HH:MM", com o mapa, as opções de ônibus, metrô e trem e,
 * nos ônibus da SPTrans, quais veículos acessíveis vão passar.
 * A localização só sai do aparelho quando a pessoa pede o percurso.
 */
export default function PlanejadorPercurso({ id }) {
  const unidade = useConsulta(`unidade:${id}`, (signal) => obterUnidade(id, { signal }));
  const local = useLocalizacao();

  const [data, setData] = useState("");
  const [hora, setHora] = useState("");
  const [folga, setFolga] = useState(FOLGA_PADRAO);
  const [erroHora, setErroHora] = useState(null);
  const [pedido, setPedido] = useState(null);

  const percurso = useConsulta(
    pedido ? `percurso:${pedido.chave}` : "percurso:nenhum",
    (signal) => calcularPercurso({ ...pedido, signal }),
    { ativo: Boolean(pedido), ehVazio: () => false },
  );

  const u = unidade.dados;
  const temLocal = local.estado === ESTADOS_LOCAL.OK && Boolean(local.origem);
  const calculando = percurso.estado === ESTADOS.CARREGANDO;

  function pedir(horarioAtendimento) {
    setPedido({
      chave: `${horarioAtendimento ?? "agora"}|${folga}|${Date.now()}`,
      unidadeId: id,
      origem: local.origem,
      horarioAtendimento,
      folgaMinutos: Number(folga),
    });
  }

  function aoEnviar(evento) {
    evento.preventDefault();
    if (!temLocal) return;
    // Sem dia escolhido, vale hoje.
    const horario = montarHorario(data || dataLocal(), hora);
    if (!horario) {
      setErroHora("Informe a hora do atendimento, ou use “Sair agora”.");
      return;
    }
    setErroHora(null);
    pedir(horario);
  }

  function sairAgora() {
    if (!temLocal) return;
    setErroHora(null);
    pedir(null);
  }

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-col gap-1">
        <p className="font-mono text-label uppercase text-rota">Como chegar</p>
        <h1 className="font-display text-3xl leading-tight font-bold text-pinho sm:text-4xl">
          {u?.nome ?? (unidade.estado === ESTADOS.CARREGANDO ? "Carregando unidade…" : "Unidade de saúde")}
        </h1>
        {u && enderecoEmTexto(u.endereco) && <p className="text-salvia">{enderecoEmTexto(u.endereco)}</p>}
      </div>

      <form
        onSubmit={aoEnviar}
        noValidate
        aria-labelledby="titulo-quando"
        className="flex flex-col gap-5 rounded-3xl border border-linha bg-superficie p-5 shadow-sm sm:p-7"
      >
        <h2 id="titulo-quando" className="font-display text-2xl font-semibold text-pinho">
          A que horas é o seu atendimento?
        </h2>

        <div className="grid gap-4 sm:grid-cols-2">
          <TextField
            rotulo="Horário"
            type="time"
            destaque
            value={hora}
            onChange={(e) => setHora(e.target.value)}
            erro={erroHora}
          />
          <TextField
            rotulo="Dia"
            type="date"
            value={data}
            onChange={(e) => setData(e.target.value)}
            dica="Em branco, vale hoje."
          />
        </div>

        <fieldset className="flex flex-col gap-2">
          <legend className="mb-2 font-semibold text-grafite">Quero chegar</legend>
          <div className="flex flex-wrap gap-2">
            {FOLGAS.map((opcao) => (
              <label
                key={opcao.valor}
                className={cn(
                  "flex min-h-11 cursor-pointer items-center rounded-pill border px-4 text-sm font-semibold",
                  "has-[:focus-visible]:outline-2 has-[:focus-visible]:outline-offset-2 has-[:focus-visible]:outline-rota",
                  folga === opcao.valor
                    ? "border-pinho bg-pinho text-papel"
                    : "border-borda-campo bg-papel text-grafite hover:bg-nevoa",
                )}
              >
                <input
                  type="radio"
                  name="folga"
                  value={opcao.valor}
                  checked={folga === opcao.valor}
                  onChange={() => setFolga(opcao.valor)}
                  className="sr-only"
                />
                {opcao.rotulo}
              </label>
            ))}
          </div>
        </fieldset>

        <StatusLocal local={local} unidade={u} />

        <div className="flex flex-col gap-3">
          <Button type="submit" largo seta disabled={!temLocal} carregando={calculando && Boolean(pedido?.horarioAtendimento)}>
            Ver quando sair
          </Button>
          <Button
            variante="secundario"
            largo
            disabled={!temLocal}
            carregando={calculando && !pedido?.horarioAtendimento}
            onClick={sairAgora}
          >
            Não tenho horário: sair agora
          </Button>
        </div>

        <p className="flex items-start gap-2 text-sm text-salvia">
          <Icon nome="info" className="mt-0.5 size-4 shrink-0" />
          Para calcular, sua localização vai para o serviço do VIAS e para o Google, só nesta consulta. Ela não é
          salva. O mapa usa o OpenStreetMap.
        </p>
      </form>

      <div aria-live="polite">
        <EstadoConsulta
          consulta={percurso}
          rotuloCarregando="Calculando o percurso…"
          esqueleto={
            <div className="flex flex-col gap-4">
              <Skeleton className="h-48 w-full rounded-3xl" />
              <Skeleton className="h-72 w-full rounded-3xl" />
            </div>
          }
          tituloErro="Não foi possível calcular o percurso"
        >
          {(dados) => <ResultadoPercurso key={dados.calculadoEm} dados={dados} origem={pedido?.origem} />}
        </EstadoConsulta>
      </div>
    </div>
  );
}

function StatusLocal({ local, unidade }) {
  if (local.estado === ESTADOS_LOCAL.PEDINDO) {
    return (
      <p className="flex items-center gap-2 text-salvia">
        <Icon nome="pin" className="size-5 shrink-0 text-rota" />
        Obtendo sua localização…
      </p>
    );
  }
  if (local.estado === ESTADOS_LOCAL.OK) {
    return (
      <p className="flex items-center gap-2 text-salvia">
        <Icon nome="pin" className="size-5 shrink-0 text-rota" />
        Saindo da sua localização atual.
      </p>
    );
  }
  const mapas = linkComoChegar(unidade);
  return (
    <Alert
      tom="aviso"
      titulo="Precisamos da sua localização"
      acao={
        <div className="flex flex-wrap gap-2">
          <Button variante="secundario" onClick={local.pedirDeNovo}>
            Usar minha localização
          </Button>
          {mapas && (
            <Button
              variante="discreto"
              href={mapas}
              target="_blank"
              rel="noopener noreferrer"
              aria-label="Abrir o caminho no Google Maps (abre em nova aba)"
            >
              Abrir no Google Maps
            </Button>
          )}
        </div>
      }
    >
      {local.estado === ESTADOS_LOCAL.NEGADA
        ? "A permissão de localização foi negada. Libere nas configurações do navegador e toque em “Usar minha localização”."
        : "Não conseguimos obter sua localização neste aparelho."}{" "}
      O percurso sai do lugar onde você está.
    </Alert>
  );
}
