import { act, renderHook, waitFor } from "@testing-library/react";
import { ESTADOS, ehVazioPadrao, useConsulta } from "@/hooks/useConsulta";
import { ErroApi, TIPOS_ERRO } from "@/services/api/client";
import { LISTA_FICTICIA, LISTA_VAZIA } from "../fixtures/respostas";

/** Promessa controlada pelo teste: resolve/rejeita quando o teste mandar. */
function adiada() {
  let resolver;
  let rejeitar;
  const promessa = new Promise((res, rej) => {
    resolver = res;
    rejeitar = rej;
  });
  return { promessa, resolver, rejeitar };
}

test("começa carregando e termina em sucesso", async () => {
  const p = adiada();
  const { result } = renderHook(() => useConsulta("a", () => p.promessa));
  expect(result.current.estado).toBe(ESTADOS.CARREGANDO);

  await act(async () => p.resolver(LISTA_FICTICIA));
  expect(result.current.estado).toBe(ESTADOS.SUCESSO);
  expect(result.current.dados).toEqual(LISTA_FICTICIA);
});

test("lista vazia vira VAZIO, não ERRO", async () => {
  const { result } = renderHook(() => useConsulta("a", () => Promise.resolve(LISTA_VAZIA)));
  await waitFor(() => expect(result.current.estado).toBe(ESTADOS.VAZIO));
  expect(result.current.erro).toBeNull();
});

test("falha vira ERRO, nunca VAZIO", async () => {
  const erro = new ErroApi({ tipo: TIPOS_ERRO.REDE, mensagem: "sem conexão" });
  const { result } = renderHook(() => useConsulta("a", () => Promise.reject(erro)));
  await waitFor(() => expect(result.current.estado).toBe(ESTADOS.ERRO));
  expect(result.current.erro).toBe(erro);
  expect(result.current.dados).toBeNull();
});

test("inativo não consulta", () => {
  const buscar = jest.fn();
  const { result } = renderHook(() => useConsulta("a", buscar, { ativo: false }));
  expect(result.current.estado).toBe(ESTADOS.INATIVO);
  expect(buscar).not.toHaveBeenCalled();
});

test("ao trocar a chave, cancela a anterior e a resposta antiga não vence", async () => {
  const antiga = adiada();
  const nova = adiada();
  const sinais = [];
  const respostas = { velha: antiga, nova };

  const { result, rerender } = renderHook(
    ({ chave }) =>
      useConsulta(chave, (signal) => {
        sinais.push(signal);
        return respostas[chave].promessa;
      }),
    { initialProps: { chave: "velha" } },
  );
  await act(async () => {}); // a busca começa numa microtarefa
  expect(sinais).toHaveLength(1);

  rerender({ chave: "nova" });
  expect(sinais[0].aborted).toBe(true); // a consulta antiga foi cancelada

  await act(async () => nova.resolver(LISTA_FICTICIA));
  await act(async () => antiga.resolver(LISTA_VAZIA)); // chega depois: deve ser ignorada

  expect(result.current.estado).toBe(ESTADOS.SUCESSO);
  expect(result.current.dados).toEqual(LISTA_FICTICIA);
});

test("cancelamento não vira erro", async () => {
  const cancelado = new ErroApi({ tipo: TIPOS_ERRO.CANCELADO, mensagem: "cancelado" });
  const nova = adiada();
  const { result, rerender } = renderHook(
    ({ chave }) => useConsulta(chave, () => (chave === "a" ? Promise.reject(cancelado) : nova.promessa)),
    { initialProps: { chave: "a" } },
  );
  rerender({ chave: "b" });
  await act(async () => nova.resolver(LISTA_FICTICIA));
  expect(result.current.estado).toBe(ESTADOS.SUCESSO);
});

test("tentarDeNovo repete a consulta", async () => {
  const buscar = jest
    .fn()
    .mockRejectedValueOnce(new ErroApi({ tipo: TIPOS_ERRO.REDE, mensagem: "sem conexão" }))
    .mockResolvedValue(LISTA_FICTICIA);

  const { result } = renderHook(() => useConsulta("a", buscar));
  await waitFor(() => expect(result.current.estado).toBe(ESTADOS.ERRO));

  act(() => result.current.tentarDeNovo());
  expect(result.current.estado).toBe(ESTADOS.CARREGANDO);
  await waitFor(() => expect(result.current.estado).toBe(ESTADOS.SUCESSO));
  expect(buscar).toHaveBeenCalledTimes(2);
});

test("ehVazioPadrao", () => {
  expect(ehVazioPadrao(null)).toBe(true);
  expect(ehVazioPadrao([])).toBe(true);
  expect(ehVazioPadrao({ items: [] })).toBe(true);
  expect(ehVazioPadrao({ items: [{}] })).toBe(false);
  expect(ehVazioPadrao({ id: "ficticio" })).toBe(false);
});
