"use client";

import { useId, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import AvisoDemora from "@/components/estados/AvisoDemora";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import { TextField } from "@/components/ui/Field";
import Icon from "@/components/ui/Icon";
import { ESTADOS, useConsulta } from "@/hooks/useConsulta";
import { agruparPorCategoria, filtrarCatalogo, normalizar, temCategorias } from "@/lib/catalogo";
import { listarServicos } from "@/services/api/servicos";

const MAX_SUGESTOES = 12;

/**
 * Formulário da tela 1 (FE-11), no layout original: um campo "Exame, serviço ou
 * especialidade". As sugestões vêm só do catálogo GET /api/servicos (nunca
 * inventadas). A busca envia o ID real do serviço na URL; texto que não bate com
 * nenhum serviço do catálogo não vira busca.
 *
 * O campo é um combobox (ARIA 1.2): setas sobem e descem, Enter escolhe, Esc fecha.
 *
 * Não há escolha manual de local (decisão do Victor, 18/11, D-18): a tela de
 * resultados usa a localização do aparelho para ordenar pelas mais próximas.
 *
 * `visual="inicio"`: campo em pílula e botão com brilho da tela inicial (D-21).
 * O rótulo do campo fica só para leitor de tela, porque o título e o texto da
 * tela já dizem o que digitar; o comportamento é o mesmo.
 */
export default function FormularioBusca({ servicoInicial = "", visual }) {
  const inicio = visual === "inicio";
  const router = useRouter();
  const listaId = useId();
  const servicos = useConsulta("servicos", (signal) => listarServicos({ signal }));
  const catalogo = Array.isArray(servicos.dados) ? servicos.dados : [];

  const [servicoId, setServicoId] = useState(servicoInicial);
  // null = a pessoa ainda não digitou; o campo mostra o nome do serviço da URL.
  const [texto, setTexto] = useState(null);
  const [aberto, setAberto] = useState(false);
  const [ativo, setAtivo] = useState(-1);
  const [erro, setErro] = useState(null);
  // useTransition (e não um useState) porque o Next preserva o estado da tela ao
  // voltar; o pending termina sozinho quando a navegação acaba.
  const [enviando, iniciarEnvio] = useTransition();

  const nomeInicial = catalogo.find((s) => String(s.id) === String(servicoInicial))?.nome ?? "";
  const valor = texto ?? nomeInicial;
  const termo = normalizar(valor);
  // D-19: quando a API mandar `categoria`, as sugestões aparecem em grupos
  // (Exames, Especialidades, Atendimento). Sem categoria, lista simples.
  const sugestoes = filtrarCatalogo(catalogo, termo, MAX_SUGESTOES);
  const grupos = agruparPorCategoria(sugestoes, temCategorias(catalogo));
  const mostrarLista = aberto && servicos.estado === "sucesso" && sugestoes.length > 0;
  const semResultado = aberto && servicos.estado === "sucesso" && termo && sugestoes.length === 0;

  function escolher(servico) {
    setServicoId(String(servico.id));
    setTexto(servico.nome);
    setAberto(false);
    setAtivo(-1);
    setErro(null);
  }

  function aoDigitar(evento) {
    setTexto(evento.target.value);
    setServicoId("");
    setAberto(true);
    setAtivo(-1);
    setErro(null);
  }

  function aoTeclar(evento) {
    if (evento.key === "ArrowDown") {
      evento.preventDefault();
      setAberto(true);
      setAtivo((i) => Math.min(i + 1, sugestoes.length - 1));
    } else if (evento.key === "ArrowUp") {
      evento.preventDefault();
      setAtivo((i) => Math.max(i - 1, 0));
    } else if (evento.key === "Enter" && mostrarLista && ativo >= 0) {
      evento.preventDefault();
      escolher(sugestoes[ativo]);
    } else if (evento.key === "Escape") {
      setAberto(false);
      setAtivo(-1);
    }
  }

  function enviar(evento) {
    evento.preventDefault();
    let id = servicoId;
    if (!id) {
      // Aceita o texto digitado se ele bate com um único serviço do catálogo.
      const exato = catalogo.find((s) => normalizar(s.nome) === termo);
      const unico = sugestoes.length === 1 ? sugestoes[0] : null;
      id = String((exato ?? unico)?.id ?? "");
    }
    if (!id) {
      setErro(
        termo
          ? "Não encontramos esse serviço no catálogo. Escolha uma das sugestões."
          : "Digite o exame, serviço ou especialidade de que você precisa.",
      );
      setAberto(true);
      return;
    }
    const params = new URLSearchParams({ servicoId: id });
    iniciarEnvio(() => router.push(`/unidades?${params}`));
  }

  const indisponivel = servicos.estado === "erro";

  return (
    <>
      <form onSubmit={enviar} noValidate className="flex flex-col gap-5">
        <div className="relative">
          <TextField
            rotulo="Exame, serviço ou especialidade"
            icone="busca"
            destaque={!inicio}
            pilula={inicio}
            rotuloOculto={inicio}
            adorno={inicio ? "teclado" : undefined}
            name="servico"
            autoComplete="off"
            placeholder={
              servicos.estado === "carregando"
                ? "Carregando serviços…"
                : inicio
                  ? "Exame, serviço ou especialidade"
                  : undefined
            }
            disabled={indisponivel}
            erro={erro}
            value={valor}
            onChange={aoDigitar}
            onKeyDown={aoTeclar}
            onFocus={() => setAberto(true)}
            onBlur={() => setAberto(false)}
            aoLimpar={() => {
              setTexto("");
              setServicoId("");
              setAberto(true);
            }}
            role="combobox"
            aria-autocomplete="list"
            aria-expanded={mostrarLista}
            aria-controls={listaId}
            aria-activedescendant={mostrarLista && ativo >= 0 ? `${listaId}-${ativo}` : undefined}
          />

          <ul
            id={listaId}
            role="listbox"
            aria-label="Serviços do catálogo"
            hidden={!mostrarLista}
            // Fica no fluxo (não absolute): o contêiner da página tem overflow-hidden
            // por causa do mapa decorativo e cortaria uma lista flutuante.
            className="mt-2 max-h-96 overflow-auto rounded-xl border border-borda-campo bg-superficie py-1 shadow-lg"
          >
            {grupos.map((grupo) => {
              const itens = grupo.itens.map(({ servico: s, indice: i }) => (
                <li
                  key={s.id}
                  id={`${listaId}-${i}`}
                  role="option"
                  aria-selected={i === ativo}
                  // mousedown (e não click) para escolher antes do blur fechar a lista.
                  onMouseDown={(e) => {
                    e.preventDefault();
                    escolher(s);
                  }}
                  onMouseEnter={() => setAtivo(i)}
                  className={`flex cursor-pointer items-baseline justify-between gap-3 px-4 py-2.5 ${
                    i === ativo ? "bg-nevoa" : ""
                  }`}
                >
                  <span className="text-grafite">{s.nome}</span>
                  <span className="shrink-0 text-sm text-salvia">{s.totalUnidades} unidades</span>
                </li>
              ));
              if (!grupo.rotulo) return itens;
              const tituloId = `${listaId}-grupo-${grupo.chave}`;
              return (
                <li key={grupo.chave} role="presentation">
                  <p
                    id={tituloId}
                    role="presentation"
                    className="px-4 pt-3 pb-1 font-mono text-label uppercase text-rota"
                  >
                    {grupo.rotulo}
                  </p>
                  <ul role="group" aria-labelledby={tituloId}>
                    {itens}
                  </ul>
                </li>
              );
            })}
          </ul>

          {semResultado && (
            <p role="status" className="mt-2 text-sm text-salvia">
              Nenhum item do catálogo com “{valor.trim()}”. Tente outra palavra ou apague o campo
              para ver todas as opções.
            </p>
          )}
        </div>

        {servicos.estado === ESTADOS.CARREGANDO && (
          <div role="status">
            <AvisoDemora />
          </div>
        )}

        <div className="flex flex-col items-center gap-3">
          <Button
            type="submit"
            largo
            seta
            carregando={enviando}
            disabled={servicos.estado !== "sucesso"}
            className={inicio ? "botao-brilho min-h-15 sm:min-h-16" : undefined}
          >
            Buscar unidades
          </Button>
          <p className="text-center text-salvia">Encontre unidades com o serviço procurado.</p>
          <p className="flex items-start gap-2 text-sm text-salvia">
            <Icon nome={inicio ? "info" : "pin"} className="mt-0.5 size-4 text-rota" />
            <span>
              Para mostrar as unidades mais perto de você, o VIAS vai pedir sua localização. Ela
              fica só no seu aparelho: não é enviada nem salva.
            </span>
          </p>
        </div>
      </form>

      {indisponivel && (
        <Alert tom="aviso" titulo="Busca indisponível agora">
          Não foi possível carregar a lista de serviços. Tente de novo em alguns instantes.
        </Alert>
      )}
    </>
  );
}
