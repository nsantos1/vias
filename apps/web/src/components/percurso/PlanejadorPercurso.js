"use client";

import { useState } from "react";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import { SelectField, TextField } from "@/components/ui/Field";
import Icon from "@/components/ui/Icon";
import Skeleton from "@/components/ui/Skeleton";
import { ESTADOS, useConsulta } from "@/hooks/useConsulta";
import { ESTADOS_LOCAL, useLocalizacao } from "@/hooks/useLocalizacao";
import { FOLGAS, FOLGA_PADRAO, dataLocal, linkComoChegar, montarHorario } from "@/lib/percurso";
import { enderecoEmTexto } from "@/lib/unidade";
import { calcularPercurso } from "@/services/api/percursos";
import { obterUnidade } from "@/services/api/unidades";
import ResultadoPercurso from "./ResultadoPercurso";

/**
 * Tela 3 de 3, Percurso (D-20): a pessoa diz quando precisa estar na unidade e
 * o VIAS sugere a hora de sair, as linhas e, nos ônibus da SPTrans, quais
 * veículos acessíveis vão passar. A localização só sai do aparelho quando a
 * pessoa toca em "Ver percurso".
 */
export default function PlanejadorPercurso({ id }) {
  const unidade = useConsulta(`unidade:${id}`, (signal) => obterUnidade(id, { signal }));
  const local = useLocalizacao();

  const [modo, setModo] = useState("horario");
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

  function aoEnviar(evento) {
    evento.preventDefault();
    if (!temLocal) return;
    let horarioAtendimento = null;
    if (modo === "horario") {
      // Sem dia escolhido, vale hoje.
      horarioAtendimento = montarHorario(data || dataLocal(), hora);
      if (!horarioAtendimento) {
        setErroHora("Informe o horário do atendimento.");
        return;
      }
    }
    setErroHora(null);
    setPedido({
      chave: `${horarioAtendimento ?? "agora"}|${folga}|${Date.now()}`,
      unidadeId: id,
      origem: local.origem,
      horarioAtendimento,
      folgaMinutos: Number(folga),
    });
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
        className="flex flex-col gap-5 rounded-3xl border border-linha bg-superficie p-5 shadow-sm sm:p-7"
      >
        <fieldset className="flex flex-col gap-3">
          <legend className="mb-3 font-display text-xl font-semibold text-pinho">
            Quando você precisa estar lá?
          </legend>
          <div className="flex flex-wrap gap-3">
            {[
              { valor: "horario", rotulo: "Tenho horário marcado" },
              { valor: "agora", rotulo: "Quero sair agora" },
            ].map((opcao) => (
              <label
                key={opcao.valor}
                className="flex min-h-12 cursor-pointer items-center gap-3 rounded-pill border border-borda-campo bg-papel px-4 has-[:checked]:border-rota has-[:checked]:bg-nevoa has-[:focus-visible]:outline-2 has-[:focus-visible]:outline-rota"
              >
                <input
                  type="radio"
                  name="modo"
                  value={opcao.valor}
                  checked={modo === opcao.valor}
                  onChange={() => setModo(opcao.valor)}
                  className="size-5 accent-[var(--color-rota)]"
                />
                <span className="font-semibold">{opcao.rotulo}</span>
              </label>
            ))}
          </div>
        </fieldset>

        {modo === "horario" && (
          <div className="grid gap-4 sm:grid-cols-2">
            <TextField rotulo="Dia" type="date" value={data} onChange={(e) => setData(e.target.value)} />
            <TextField
              rotulo="Horário"
              type="time"
              obrigatorio
              value={hora}
              onChange={(e) => setHora(e.target.value)}
              erro={erroHora}
            />
            <SelectField
              className="sm:col-span-2"
              rotulo="Chegar com antecedência"
              dica="Sem dia escolhido, vale hoje. A antecedência dá tempo para a recepção."
              opcoes={FOLGAS}
              textoVazio="Escolha"
              value={folga}
              onChange={(e) => setFolga(e.target.value || FOLGA_PADRAO)}
            />
          </div>
        )}

        <StatusLocal local={local} unidade={u} />

        <p className="flex items-start gap-2 text-sm text-salvia">
          <Icon nome="info" className="mt-0.5 size-4 shrink-0" />
          Ao tocar em “Ver percurso”, sua localização vai para o serviço do VIAS e para o Google só para
          calcular o caminho. Ela não é salva.
        </p>

        <Button
          type="submit"
          largo
          seta
          disabled={!temLocal}
          carregando={percurso.estado === ESTADOS.CARREGANDO}
        >
          Ver percurso
        </Button>
      </form>

      <div aria-live="polite">
        <EstadoConsulta
          consulta={percurso}
          rotuloCarregando="Calculando o percurso…"
          esqueleto={
            <div className="flex flex-col gap-4">
              <Skeleton className="h-48 w-full rounded-3xl" />
              <Skeleton className="h-64 w-full rounded-3xl" />
            </div>
          }
          tituloErro="Não foi possível calcular o percurso"
        >
          {(dados) => <ResultadoPercurso dados={dados} />}
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
        Vamos partir da sua localização atual.
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
