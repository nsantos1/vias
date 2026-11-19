import Image from "next/image";
import predio from "@/assets/resultado-predio.webp";

// Curva branca da esquerda (viewBox 0 0 600 1000), por onde corre a luz.
const CURVA = "M-40 290 C 60 360, 120 400, 210 430 S 420 520, 600 760";

/**
 * Fundo da tela de resultados (D-22): prédio de saúde à direita e ondas verdes
 * com linhas brancas à esquerda, como na referência. Fica fixo enquanto a
 * lista rola. Só decoração (aria-hidden); não é a foto de nenhuma unidade.
 * No celular e no tablet, o prédio vira uma faixa no topo (FaixaPredio).
 */
export default function FundoResultados() {
  return (
    <div aria-hidden="true" className="pointer-events-none fixed inset-0 -z-10 hidden select-none lg:block">
      <div className="fundo-resultados__predio absolute inset-y-0 right-0 w-[64vw]">
        <Image
          src={predio}
          alt=""
          fill
          placeholder="blur"
          loading="eager"
          fetchPriority="high"
          sizes="64vw"
          className="object-cover object-[78%_50%]"
        />
      </div>

      <svg
        viewBox="0 0 600 1000"
        preserveAspectRatio="xMinYMid slice"
        className="absolute inset-y-0 left-0 h-full w-[38vw]"
        fill="none"
      >
        <defs>
          <radialGradient id="fundo-verde" cx="0" cy="0.55" r="0.9">
            <stop offset="0" stopColor="#3cc274" stopOpacity="0.38" />
            <stop offset="0.55" stopColor="#7fd6a0" stopOpacity="0.16" />
            <stop offset="1" stopColor="#f6f7f1" stopOpacity="0" />
          </radialGradient>
          <linearGradient id="fundo-faixa" x1="0" y1="0" x2="1" y2="1">
            <stop offset="0" stopColor="#ffffff" stopOpacity="0.9" />
            <stop offset="1" stopColor="#ffffff" stopOpacity="0" />
          </linearGradient>
        </defs>
        <rect width="600" height="1000" fill="url(#fundo-verde)" />
        <path d="M-60 0 C 120 160, 40 420, 260 620 S 520 900, 560 1000 L -60 1000 Z" fill="#2fae6e" fillOpacity="0.08" />
        <path d="M60 -20 C -10 200, 120 380, 330 520 S 560 780, 600 860" stroke="url(#fundo-faixa)" strokeWidth="2" />
        <path d="M20 -20 C 260 120, 120 320, 360 470" stroke="#ffffff" strokeOpacity="0.55" strokeWidth="1.5" />
        <path d={CURVA} stroke="#ffffff" strokeOpacity="0.8" strokeWidth="2" />
        <path d={CURVA} pathLength="1000" className="fundo-resultados__luz" stroke="#d9ffb8" strokeWidth="4" />
        {/* Anel brilhante sobre a curva, como na referência */}
        <circle cx="210" cy="430" r="15" stroke="#b8f28a" strokeWidth="3" className="fundo-resultados__anel" />
        <circle cx="210" cy="430" r="15" stroke="#e9ffd6" strokeWidth="2.5" fill="#ffffff" fillOpacity="0.25" />
        <circle cx="210" cy="430" r="5.5" fill="#d7f36a" />
      </svg>
    </div>
  );
}

/** Celular e tablet: o prédio numa faixa curta no topo, dissolvida no fundo. */
export function FaixaPredio() {
  return (
    <div aria-hidden="true" className="faixa-predio relative aspect-[5/2] overflow-hidden lg:hidden">
      <Image
        src={predio}
        alt=""
        fill
        placeholder="blur"
        sizes="100vw"
        className="fundo-resultados__imagem object-cover object-[80%_30%]"
      />
    </div>
  );
}
