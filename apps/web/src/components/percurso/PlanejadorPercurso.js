"use client";

import { useState } from "react";
import FundoPercurso, { FaixaPercurso } from "@/components/decor/FundoPercurso";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import Etapas from "@/components/ui/Etapas";
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

  // Com o percurso calculado, a tela inteira vira o resultado (D-25).
  if (percurso.estado === ESTADOS.SUCESSO) {
    return (
      <ResultadoPercurso
        key={percurso.dados.calculadoEm}
        dados={percurso.dados}
        origem={pedido?.origem}
        aoAlterar={() => setPedido(null)}
      />
    );
  }

  return (
    <div className="tela-percurso relative isolate">
      <FundoPercurso />
      <FaixaPercurso />

      <div className="tela-percurso__coluna flex flex-col gap-7 px-4 pb-14 sm:px-6 lg:pb-24">
        <Etapas atual={3} percursoDisponivel className="surgir" />
        <div className="flex flex-col gap-6">
      <div className="surgir flex flex-col gap-1.5" style={{ "--atraso": "80ms" }}>
        <p className="font-mono text-label font-medium uppercase text-rota">Como chegar</p>
        <h1 className="text-[2rem] leading-[1.08] font-bold tracking-[-0.03em] sm:text-[2.4rem]">
          {u?.nome ?? (unidade.estado === ESTADOS.CARREGANDO ? "Carregando unidade…" : "Unidade de saúde")}
        </h1>
        {u && enderecoEmTexto(u.endereco) && (
          <p className="text-lg text-salvia">{enderecoEmTexto(u.endereco)}</p>
        )}
      </div>

      <form
        onSubmit={aoEnviar}
        noValidate
        aria-labelledby="titulo-quando"
        className="cartao-destaque surgir flex flex-col gap-5 rounded-[1.75rem] bg-superficie p-5 sm:p-7"
        style={{ "--atraso": "160ms" }}
      >
        <h2 id="titulo-quando" className="text-[1.6rem] leading-tight font-bold">
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
            dica="Hora marcada do atendimento."
          />
          <TextField
            rotulo="Dia"
            type="date"
            alto
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
                  "pilula-folga flex min-h-11 cursor-pointer items-center rounded-pill border px-5 text-sm font-semibold",
                  "has-[:focus-visible]:outline-2 has-[:focus-visible]:outline-offset-2 has-[:focus-visible]:outline-rota",
                  folga === opcao.valor
                    ? "border-pinho bg-pinho text-papel shadow-[0_6px_16px_rgb(18_59_53/0.25)]"
                    : "border-borda-campo bg-papel text-grafite hover:border-rota hover:bg-nevoa",
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
          <Button
            type="submit"
            largo
            seta
            disabled={!temLocal}
            carregando={calculando && Boolean(pedido?.horarioAtendimento)}
            className="botao-brilho"
          >
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
          {() => null}
        </EstadoConsulta>
      </div>
        </div>
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
