"use client";

import "leaflet/dist/leaflet.css";
import { useEffect } from "react";
import { CircleMarker, MapContainer, Polyline, TileLayer, Tooltip, useMap } from "react-leaflet";

// Cores dos tokens (docs/tokens.md); o Leaflet precisa do valor, não da variável CSS.
const COR = { pinho: "#123b35", rota: "#2d7c60", grafite: "#1a2925", papel: "#f6f7f1", lima: "#d7f36a" };

/**
 * Mapa do percurso (D-20). Desenha só a geometria real que o Google mandou
 * (regra: sem geometria, sem linha). A pé fica tracejado; ônibus em verde;
 * metrô e trem na cor oficial da linha quando o Google informa.
 * É um complemento: o passo a passo em texto tem todas as informações.
 *
 * Carregado só no navegador (o Leaflet usa `window`), via next/dynamic.
 */
export default function MapaPercurso({ origem, destino, linhas, paradas }) {
  const pontos = [
    ...linhas.flatMap((l) => l.pontos),
    ...(origem ? [[origem.latitude, origem.longitude]] : []),
    ...(destino ? [[destino.latitude, destino.longitude]] : []),
  ];
  if (!pontos.length) return null;

  return (
    <MapContainer
      bounds={pontos}
      boundsOptions={{ padding: [28, 28] }}
      scrollWheelZoom={false}
      className="h-72 w-full sm:h-96"
      attributionControl
    >
      <TileLayer
        url="https://tile.openstreetmap.org/{z}/{x}/{y}.png"
        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        maxZoom={19}
      />
      <Enquadrar pontos={pontos} />

      {linhas.map((l) =>
        l.tipo === "A_PE" ? (
          <Polyline
            key={l.indice}
            positions={l.pontos}
            pathOptions={{ color: COR.grafite, weight: 4, opacity: 0.75, dashArray: "2 9", lineCap: "round" }}
          />
        ) : (
          <Polyline
            key={l.indice}
            positions={l.pontos}
            pathOptions={{
              color: l.tipo === "ONIBUS" || !l.cor ? COR.rota : l.cor,
              weight: 7,
              opacity: 0.95,
              lineCap: "round",
            }}
          />
        ),
      )}

      {paradas.map((p, i) => (
        <CircleMarker
          key={`${p.nome}-${i}`}
          center={[p.latitude, p.longitude]}
          radius={6}
          pathOptions={{ color: COR.pinho, weight: 3, fillColor: COR.papel, fillOpacity: 1 }}
        >
          <Tooltip>{p.nome}</Tooltip>
        </CircleMarker>
      ))}

      {origem && (
        <CircleMarker
          center={[origem.latitude, origem.longitude]}
          radius={9}
          pathOptions={{ color: COR.papel, weight: 3, fillColor: COR.pinho, fillOpacity: 1 }}
        >
          <Tooltip permanent direction="top" offset={[0, -8]}>
            Você
          </Tooltip>
        </CircleMarker>
      )}
      {destino && (
        <CircleMarker
          center={[destino.latitude, destino.longitude]}
          radius={10}
          pathOptions={{ color: COR.pinho, weight: 4, fillColor: COR.lima, fillOpacity: 1 }}
        >
          <Tooltip permanent direction="top" offset={[0, -10]}>
            Unidade
          </Tooltip>
        </CircleMarker>
      )}
    </MapContainer>
  );
}

/** Reenquadra quando a opção escolhida muda (o `bounds` do MapContainer só vale na montagem). */
function Enquadrar({ pontos }) {
  const mapa = useMap();
  const chave = JSON.stringify(pontos);
  useEffect(() => {
    mapa.fitBounds(JSON.parse(chave), { padding: [28, 28] });
  }, [mapa, chave]);
  return null;
}
