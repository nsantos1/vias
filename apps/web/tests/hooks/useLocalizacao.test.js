import { act, renderHook, waitFor } from "@testing-library/react";
import { ESTADOS_LOCAL, obterPosicao, useLocalizacao } from "@/hooks/useLocalizacao";

// Posição FICTÍCIA de teste.
const POSICAO = { coords: { latitude: -23.5, longitude: -46.6, accuracy: 25 } };

function geoQue(responde) {
  return { getCurrentPosition: jest.fn((ok, falha) => responde(ok, falha)) };
}

describe("obterPosicao", () => {
  test("permitida: devolve a origem", async () => {
    const r = await obterPosicao(geoQue((ok) => ok(POSICAO)));
    expect(r).toEqual({
      estado: ESTADOS_LOCAL.OK,
      origem: { latitude: -23.5, longitude: -46.6, precisaoMetros: 25 },
    });
  });

  test.each([
    [1, ESTADOS_LOCAL.NEGADA],
    [2, ESTADOS_LOCAL.INDISPONIVEL],
    [3, ESTADOS_LOCAL.ERRO],
  ])("erro código %p vira %p, sem origem inventada", async (code, estado) => {
    const r = await obterPosicao(geoQue((_ok, falha) => falha({ code })));
    expect(r).toEqual({ estado, origem: null });
  });

  test("sem suporte a geolocalização: INDISPONIVEL", async () => {
    await expect(obterPosicao(undefined)).resolves.toEqual({
      estado: ESTADOS_LOCAL.INDISPONIVEL,
      origem: null,
    });
  });
});

describe("useLocalizacao", () => {
  const original = Object.getOwnPropertyDescriptor(globalThis.navigator, "geolocation");
  afterEach(() => {
    if (original) Object.defineProperty(globalThis.navigator, "geolocation", original);
    else delete globalThis.navigator.geolocation;
  });

  function definirGeo(geo) {
    Object.defineProperty(globalThis.navigator, "geolocation", { configurable: true, value: geo });
  }

  test("começa pedindo e termina com a origem", async () => {
    definirGeo(geoQue((ok) => ok(POSICAO)));
    const { result } = renderHook(() => useLocalizacao());
    expect(result.current.estado).toBe(ESTADOS_LOCAL.PEDINDO);
    await waitFor(() => expect(result.current.estado).toBe(ESTADOS_LOCAL.OK));
    expect(result.current.origem).toMatchObject({ latitude: -23.5, longitude: -46.6 });
  });

  test("negada e depois liberada: pedirDeNovo funciona", async () => {
    let permitir = false;
    definirGeo(geoQue((ok, falha) => (permitir ? ok(POSICAO) : falha({ code: 1 }))));
    const { result } = renderHook(() => useLocalizacao());
    await waitFor(() => expect(result.current.estado).toBe(ESTADOS_LOCAL.NEGADA));
    expect(result.current.origem).toBeNull();

    permitir = true;
    act(() => result.current.pedirDeNovo());
    await waitFor(() => expect(result.current.estado).toBe(ESTADOS_LOCAL.OK));
  });
});
