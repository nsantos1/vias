/**
 * Distância em LINHA RETA entre dois pontos (fórmula de Haversine).
 * Não é o caminho nem o tempo de deslocamento: a tela sempre diz “em linha reta”.
 */
const RAIO_TERRA_KM = 6371;

function temCoordenadas(p) {
  return (
    p != null &&
    Number.isFinite(Number(p.latitude)) &&
    Number.isFinite(Number(p.longitude)) &&
    p.latitude !== null &&
    p.longitude !== null
  );
}

export function distanciaKm(a, b) {
  if (!temCoordenadas(a) || !temCoordenadas(b)) return null;
  const rad = (g) => (Number(g) * Math.PI) / 180;
  const dLat = rad(b.latitude - a.latitude);
  const dLon = rad(b.longitude - a.longitude);
  const h =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(rad(a.latitude)) * Math.cos(rad(b.latitude)) * Math.sin(dLon / 2) ** 2;
  return 2 * RAIO_TERRA_KM * Math.asin(Math.min(1, Math.sqrt(h)));
}

/**
 * Ordena as unidades da mais próxima para a mais distante e acrescenta
 * `distanciaKm`. Unidades sem coordenadas na fonte vão para o fim, com
 * `distanciaKm: null` (nunca recebem uma posição inventada).
 * Sem origem, devolve a lista em ordem alfabética, sem distância.
 */
export function ordenarPorDistancia(unidades, origem) {
  const lista = Array.isArray(unidades) ? unidades : [];
  if (!temCoordenadas(origem)) {
    return [...lista]
      .map((u) => ({ ...u, distanciaKm: null }))
      .sort((x, y) => String(x.nome).localeCompare(String(y.nome), "pt-BR"));
  }
  const comDistancia = lista.map((u) => ({ ...u, distanciaKm: distanciaKm(origem, u) }));
  return comDistancia.sort((x, y) => {
    if (x.distanciaKm === null && y.distanciaKm === null) {
      return String(x.nome).localeCompare(String(y.nome), "pt-BR");
    }
    if (x.distanciaKm === null) return 1;
    if (y.distanciaKm === null) return -1;
    return x.distanciaKm - y.distanciaKm;
  });
}

/** "≈ 850 m" ou "≈ 2,3 km" (em linha reta). null quando não há distância. */
export function formatarDistancia(km) {
  if (km === null || km === undefined || !Number.isFinite(km)) return null;
  const metros = Math.max(50, Math.round((km * 1000) / 50) * 50);
  if (metros < 1000) {
    return `≈ ${metros} m`;
  }
  // 0,98 km arredonda para 1.000 m: daí em diante, mostra em km.
  km = Math.max(km, 1);
  const casas = km < 10 ? 1 : 0;
  return `≈ ${km.toLocaleString("pt-BR", { minimumFractionDigits: casas, maximumFractionDigits: casas })} km`;
}
