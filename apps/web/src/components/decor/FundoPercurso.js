import Image from "next/image";
import cidade from "@/assets/percurso-cidade.webp";

/*
 * Coordenadas no desenho original (1672 × 941). O que fica por cima da imagem
 * usa % dessas medidas e continua alinhado em qualquer tamanho de tela.
 */
const W = 1672;
const H = 941;
const em = (x, y) => ({ left: `${(x / W) * 100}%`, top: `${(y / H) * 100}%` });

// Trilha verde da imagem, do pin até a entrada do hospital (medida sobre ela).
const TRILHA =
  "M790 690 C870 678 940 660 985 620 C1000 600 1020 585 1080 578 C1160 572 1250 555 1290 520 C1315 495 1305 460 1260 440 C1225 425 1200 415 1198 400";

// O mesmo "sizes" nas duas cenas faz o navegador baixar a imagem uma vez só.
const TAMANHOS = "(min-width: 1024px) 150vh, 130vw";

function Cena({ className, prioridade = false, sizes }) {
  return (
    <div className={`cena-percurso ${className}`}>
      <Image
        src={cidade}
        alt=""
        fill
        placeholder="blur"
        loading={prioridade ? "eager" : undefined}
        fetchPriority={prioridade ? "high" : undefined}
        sizes={sizes}
        className="object-cover"
      />
      <svg viewBox={`0 0 ${W} ${H}`} className="absolute inset-0 size-full" fill="none">
        <path d={TRILHA} pathLength="1000" className="cena-percurso__brilho" stroke="#a6ffb8" strokeWidth="26" />
        <path d={TRILHA} pathLength="1000" className="cena-percurso__luz" stroke="#f4fff0" strokeWidth="8" />
      </svg>
      <span className="cena-percurso__pulso" style={em(757, 706)} />
      <span className="cena-percurso__cruz" style={em(1240, 238)} />
    </div>
  );
}

/**
 * Fundo da tela de percurso (D-24): cidade com a trilha até o hospital à
 * direita, recortada por uma curva clara, e a luz correndo do pin até a
 * entrada. Fixo enquanto o resultado rola. Só decoração (aria-hidden): não é o
 * mapa do percurso, que vem do Google e aparece no resultado.
 */
export default function FundoPercurso() {
  return (
    <div aria-hidden="true" className="fundo-percurso pointer-events-none fixed inset-0 -z-10 hidden select-none lg:block">
      <Cena className="fundo-percurso__cena" prioridade sizes={TAMANHOS} />
      <svg
        viewBox="0 0 600 1000"
        preserveAspectRatio="xMinYMid slice"
        className="absolute inset-y-0 left-0 h-full w-[45vw]"
        fill="none"
      >
        <path d="M-20 -10 C 160 120, 120 420, 330 640 S 560 940, 600 1010" stroke="#ffffff" strokeOpacity="0.8" strokeWidth="2" />
        <path d="M-40 260 C 120 330, 180 520, 380 700 S 520 900, 540 1010" stroke="#ffffff" strokeOpacity="0.5" strokeWidth="1.5" />
      </svg>
    </div>
  );
}

/** Celular e tablet: a cena numa faixa no topo, dissolvida no fundo. */
export function FaixaPercurso() {
  return (
    <div aria-hidden="true" className="faixa-percurso relative aspect-[16/10] overflow-hidden sm:aspect-[2/1] lg:hidden">
      <Cena className="absolute top-[-19%] right-[-11%] aspect-[1672/941] w-[130%] sm:top-[-28%] sm:right-[-6%] sm:w-[112%]" prioridade sizes={TAMANHOS} />
    </div>
  );
}
