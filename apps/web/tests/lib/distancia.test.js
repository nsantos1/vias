import { distanciaKm, formatarDistancia, ordenarPorDistancia } from "@/lib/distancia";

// Pontos FICTÍCIOS de teste (coordenadas genéricas, não são unidades reais).
const ORIGEM = { latitude: -23.5, longitude: -46.6 };
const PERTO = { id: "ficticio-perto", nome: "Fictícia B", latitude: -23.501, longitude: -46.6 };
const LONGE = { id: "ficticio-longe", nome: "Fictícia A", latitude: -23.6, longitude: -46.6 };
const SEM_COORD = { id: "ficticio-sem", nome: "Fictícia C", latitude: null, longitude: null };

describe("distanciaKm", () => {
  test("0,001 grau de latitude ≈ 111 m", () => {
    expect(distanciaKm(ORIGEM, PERTO)).toBeCloseTo(0.111, 2);
  });

  test("sem coordenadas devolve null (nunca inventa)", () => {
    expect(distanciaKm(ORIGEM, SEM_COORD)).toBeNull();
    expect(distanciaKm(null, PERTO)).toBeNull();
  });
});

describe("ordenarPorDistancia", () => {
  test("mais próxima primeiro e sem coordenadas no fim", () => {
    const r = ordenarPorDistancia([LONGE, SEM_COORD, PERTO], ORIGEM);
    expect(r.map((u) => u.id)).toEqual(["ficticio-perto", "ficticio-longe", "ficticio-sem"]);
    expect(r[2].distanciaKm).toBeNull();
  });

  test("sem origem: ordem alfabética e nenhuma distância", () => {
    const r = ordenarPorDistancia([PERTO, SEM_COORD, LONGE], null);
    expect(r.map((u) => u.nome)).toEqual(["Fictícia A", "Fictícia B", "Fictícia C"]);
    expect(r.every((u) => u.distanciaKm === null)).toBe(true);
  });

  test("não altera a lista original", () => {
    const original = [LONGE, PERTO];
    ordenarPorDistancia(original, ORIGEM);
    expect(original).toEqual([LONGE, PERTO]);
    expect(original[0]).not.toHaveProperty("distanciaKm");
  });
});

describe("formatarDistancia", () => {
  test.each([
    [0.012, "≈ 50 m"],
    [0.234, "≈ 250 m"],
    [0.98, "≈ 1,0 km"],
    [1.26, "≈ 1,3 km"],
    [12.4, "≈ 12 km"],
  ])("%p km → %p", (km, texto) => {
    expect(formatarDistancia(km)).toBe(texto);
  });

  test("sem distância devolve null", () => {
    expect(formatarDistancia(null)).toBeNull();
    expect(formatarDistancia(Number.NaN)).toBeNull();
  });
});
