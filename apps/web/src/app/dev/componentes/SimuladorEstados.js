"use client";

import { useState } from "react";
import AvisoDesatualizado from "@/components/estados/AvisoDesatualizado";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import ValorInformado from "@/components/estados/ValorInformado";
import { useConsulta } from "@/hooks/useConsulta";
import { ErroApi, mensagemDeErro, TIPOS_ERRO } from "@/services/api/client";
import { listarServicos } from "@/services/api/servicos";

/*
 * SIMULAÇÃO DE DESENVOLVIMENTO (FE-09). As respostas abaixo são FICTÍCIAS e
 * existem só nesta vitrine, que responde 404 em produção. O cenário
 * "API configurada" chama a API de verdade (NEXT_PUBLIC_API_URL).
 */

function esperar(ms, signal) {
  return new Promise((resolver, rejeitar) => {
    const timer = setTimeout(resolver, ms);
    signal.addEventListener("abort", () => {
      clearTimeout(timer);
      rejeitar(new ErroApi({ tipo: TIPOS_ERRO.CANCELADO, mensagem: "cancelado" }));
    });
  });
}

function erroHttp(status) {
  return new ErroApi({
    tipo: TIPOS_ERRO.HTTP,
    status,
    mensagem: mensagemDeErro({ tipo: TIPOS_ERRO.HTTP, status }),
  });
}

const CENARIOS = {
  sucesso: {
    rotulo: "Sucesso (fictício)",
    buscar: (signal) =>
      esperar(900, signal).then(() => ({
        items: [
          { id: "ficticio-1", nome: "Registro fictício 1" },
          { id: "ficticio-2", nome: "Registro fictício 2" },
        ],
      })),
  },
  vazio: {
    rotulo: "Lista vazia (fictício)",
    buscar: (signal) => esperar(900, signal).then(() => ({ items: [] })),
  },
  naoEncontrado: {
    rotulo: "404 (fictício)",
    buscar: (signal) => esperar(600, signal).then(() => Promise.reject(erroHttp(404))),
  },
  servidor: {
    rotulo: "Erro 500 (fictício)",
    buscar: (signal) => esperar(600, signal).then(() => Promise.reject(erroHttp(500))),
  },
  apiReal: {
    rotulo: "API configurada (real)",
    buscar: (signal) => listarServicos({ signal }),
  },
};

export default function SimuladorEstados() {
  const [cenario, setCenario] = useState("sucesso");
  const consulta = useConsulta(cenario, (signal) => CENARIOS[cenario].buscar(signal));

  return (
    <div className="flex flex-col gap-5">
      <fieldset className="flex flex-col gap-2">
        <legend className="mb-2 font-semibold">Cenário da consulta</legend>
        <div className="flex flex-wrap gap-2">
          {Object.entries(CENARIOS).map(([chave, { rotulo }]) => (
            <label
              key={chave}
              className="inline-flex min-h-11 cursor-pointer items-center gap-2 rounded-pill border border-borda-campo bg-superficie px-4 has-[:checked]:border-pinho has-[:checked]:bg-nevoa"
            >
              <input
                type="radio"
                name="cenario"
                value={chave}
                checked={cenario === chave}
                onChange={() => setCenario(chave)}
                className="accent-pinho"
              />
              {rotulo}
            </label>
          ))}
        </div>
      </fieldset>

      <p className="text-sm text-salvia">
        Estado atual: <span className="font-mono">{consulta.estado}</span>
      </p>

      <div className="max-w-xl">
        <EstadoConsulta
          consulta={consulta}
          rotuloCarregando="Carregando registros…"
          vazio={{
            titulo: "Nenhum registro encontrado",
            descricao: "A consulta funcionou, mas não há registros para esta combinação.",
          }}
        >
          {(dados) => (
            <ul className="flex flex-col gap-2">
              {(dados.items ?? dados).map((item) => (
                <li key={item.id} className="rounded-xl border border-linha bg-superficie p-4">
                  {item.nome}
                </li>
              ))}
            </ul>
          )}
        </EstadoConsulta>
      </div>

      <div className="grid max-w-xl gap-3">
        <h3 className="text-xl font-bold">Dado ausente e desatualizado</h3>
        <dl className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-2 rounded-xl border border-linha bg-superficie p-4">
          <dt className="font-mono text-label uppercase text-salvia">Campo presente</dt>
          <dd>
            <ValorInformado valor="Valor fictício" />
          </dd>
          <dt className="font-mono text-label uppercase text-salvia">Campo nulo</dt>
          <dd>
            <ValorInformado valor={null} />
          </dd>
          <dt className="font-mono text-label uppercase text-salvia">Não verificado</dt>
          <dd>
            <ValorInformado valor="ignorado" estado="NAO_VERIFICADO" />
          </dd>
        </dl>
        <AvisoDesatualizado desatualizado dataReferencia="2026-03-01" />
        <AvisoDesatualizado desatualizado dataReferencia={null} />
      </div>
    </div>
  );
}
