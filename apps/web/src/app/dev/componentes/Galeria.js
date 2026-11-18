"use client";

import { useState } from "react";
import Alert from "@/components/ui/Alert";
import Badge from "@/components/ui/Badge";
import Button from "@/components/ui/Button";
import Chip from "@/components/ui/Chip";
import EmptyState from "@/components/ui/EmptyState";
import Etapas from "@/components/ui/Etapas";
import { SelectField, TextField } from "@/components/ui/Field";
import Skeleton from "@/components/ui/Skeleton";
import SimuladorEstados from "./SimuladorEstados";

/*
 * Os textos e opções abaixo são EXEMPLOS DE INTERFACE, não dados do VIAS.
 * Nenhum serviço, região ou unidade daqui pode aparecer fora desta página.
 */
const OPCOES_EXEMPLO = [
  { valor: "a", rotulo: "Opção de exemplo A" },
  { valor: "b", rotulo: "Opção de exemplo B" },
];

function Secao({ titulo, children }) {
  return (
    <section className="flex flex-col gap-4 border-t border-linha pt-6">
      <h2 className="text-2xl font-bold">{titulo}</h2>
      {children}
    </section>
  );
}

export default function Galeria() {
  const [carregando, setCarregando] = useState(false);
  const [filtros, setFiltros] = useState(["Filtro de exemplo 1", "Filtro de exemplo 2"]);
  const [texto, setTexto] = useState("");
  const [busca, setBusca] = useState("Texto de exemplo");
  const [enviado, setEnviado] = useState(false);
  const erroTexto = enviado && !texto.trim() ? "Preencha este campo para continuar." : undefined;

  return (
    <div className="mx-auto flex max-w-5xl flex-col gap-10 px-4 py-10 sm:px-6">
      <header className="flex flex-col gap-3">
        <h1 className="text-4xl font-bold">Componentes de interface</h1>
        <Alert tom="aviso" titulo="Página de desenvolvimento">
          Vitrine dos componentes do FE-07. Todo texto aqui é exemplo de interface, não
          dado real. Esta página não existe na versão de produção.
        </Alert>
      </header>

      <Secao titulo="Estados de consulta (FE-09)">
        <SimuladorEstados />
      </Secao>

      <Secao titulo="Etapas">
        <div className="grid max-w-xl gap-8">
          <Etapas atual={1} />
          <Etapas atual={2} />
          <Etapas atual={3} percursoDisponivel />
        </div>
      </Secao>

      <Secao titulo="Botão largo com seta">
        <div className="max-w-xl">
          <Button largo seta>
            Ação principal
          </Button>
        </div>
      </Secao>

      <Secao titulo="Botões">
        <div className="flex flex-wrap items-center gap-3">
          <Button>Principal</Button>
          <Button variante="secundario">Secundário</Button>
          <Button variante="discreto">Discreto</Button>
          <Button variante="perigo">Perigo</Button>
          <Button disabled>Desabilitado</Button>
          <Button href="/">Link com cara de botão</Button>
        </div>
        <div className="flex flex-wrap items-center gap-3">
          <Button carregando={carregando} onClick={() => setCarregando(true)}>
            Buscar
          </Button>
          <Button variante="discreto" onClick={() => setCarregando(false)}>
            Parar carregamento
          </Button>
        </div>
      </Secao>

      <Secao titulo="Campos">
        <form
          noValidate
          className="grid max-w-xl gap-5"
          onSubmit={(evento) => {
            evento.preventDefault();
            setEnviado(true);
          }}
        >
          <TextField
            rotulo="Campo de texto"
            dica="Dica que explica o que preencher."
            obrigatorio
            value={texto}
            onChange={(evento) => setTexto(evento.target.value)}
            erro={erroTexto}
          />
          <TextField
            rotulo="Campo de busca em destaque"
            icone="busca"
            destaque
            value={busca}
            onChange={(evento) => setBusca(evento.target.value)}
            aoLimpar={() => setBusca("")}
          />
          <SelectField rotulo="Campo de seleção" opcoes={OPCOES_EXEMPLO} />
          <SelectField
            rotulo="Seleção com erro"
            opcoes={OPCOES_EXEMPLO}
            erro="Escolha uma opção da lista."
          />
          <TextField rotulo="Campo desabilitado" disabled defaultValue="Não editável" />
          <div>
            <Button type="submit">Enviar (valida o primeiro campo)</Button>
          </div>
        </form>
      </Secao>

      <Secao titulo="Filtros ativos (chips)">
        <div className="flex flex-wrap gap-2">
          {filtros.map((filtro) => (
            <Chip key={filtro} aoRemover={() => setFiltros(filtros.filter((f) => f !== filtro))}>
              {filtro}
            </Chip>
          ))}
          <Chip>Chip só de leitura</Chip>
        </div>
        {filtros.length === 0 && (
          <Button
            variante="discreto"
            className="self-start"
            onClick={() => setFiltros(["Filtro de exemplo 1", "Filtro de exemplo 2"])}
          >
            Restaurar exemplos
          </Button>
        )}
      </Secao>

      <Secao titulo="Selos">
        <div className="flex flex-wrap gap-2">
          <Badge>Neutro</Badge>
          <Badge tom="marca">Marca</Badge>
          <Badge tom="info">Informação</Badge>
          <Badge tom="aviso">Atenção</Badge>
          <Badge tom="erro">Erro</Badge>
        </div>
      </Secao>

      <Secao titulo="Alertas">
        <Alert tom="info" titulo="Informação">
          Texto de apoio do alerta.
        </Alert>
        <Alert tom="aviso" titulo="Atenção">
          Texto de apoio do alerta.
        </Alert>
        <Alert
          tom="erro"
          titulo="Não foi possível concluir"
          acao={<Button variante="secundario">Tentar novamente</Button>}
        >
          Explique o que a pessoa pode fazer agora.
        </Alert>
      </Secao>

      <Secao titulo="Carregando (skeleton)">
        <div role="status" className="flex max-w-xl flex-col gap-3">
          <span className="sr-only">Carregando exemplo…</span>
          <Skeleton className="h-6 w-2/3" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-5/6" />
        </div>
      </Secao>

      <Secao titulo="Estado vazio">
        <EmptyState titulo="Nada encontrado" acao={<Button variante="secundario">Limpar filtros</Button>}>
          A consulta funcionou, mas não há resultados para esta combinação.
        </EmptyState>
      </Secao>
    </div>
  );
}
