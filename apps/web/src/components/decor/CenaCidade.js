import Image from "next/image";
import { cn } from "@/lib/cn";
import Icon from "@/components/ui/Icon";
import cidade from "@/assets/inicio-cidade.webp";

/*
 * Coordenadas no desenho original (1672 × 941). Tudo por cima da imagem é
 * posicionado em % dessas medidas, então continua alinhado em qualquer tamanho.
 */
const W = 1672;
const H = 941;
const em = (x, y) => ({ left: `${(x / W) * 100}%`, top: `${(y / H) * 100}%` });

// Traçado da trilha verde da imagem, medido sobre ela.
const TRILHA =
  "M400 738 C560 712 700 700 800 640 C880 590 960 540 1028 523 C1150 490 1250 430 1290 350 C1305 320 1316 290 1318 266";

/**
 * Ilustração da tela inicial: cidade com a trilha até a unidade.
 * É só decoração (aria-hidden) e não representa nenhum lugar real: o cartão
 * "Hospital Central · 1,2 km" faz parte do desenho (decisão R-03: a
 * ilustração aparece só na busca, nunca perto de uma unidade de verdade).
 *
 * Animações só com transform/opacity (baratas) e desligadas com
 * prefers-reduced-motion (globals.css).
 */
export default function CenaCidade({ className }) {
  return (
    <div aria-hidden="true" className={cn("cena-cidade pointer-events-none select-none", className)}>
      <div className="cena-cidade__imagem absolute inset-0">
        <Image
          src={cidade}
          alt=""
          fill
          placeholder="blur"
          loading="eager"
          fetchPriority="high"
          sizes="(min-width: 1024px) 75vw, 100vw"
          className="object-cover"
        />
      </div>

      {/* Luz percorrendo a trilha até o pin da unidade */}
      <svg viewBox={`0 0 ${W} ${H}`} className="absolute inset-0 size-full" fill="none">
        <defs>
          <linearGradient id="cena-trilha" x1="400" y1="738" x2="1318" y2="266" gradientUnits="userSpaceOnUse">
            <stop offset="0" stopColor="#b9ff9e" stopOpacity="0" />
            <stop offset="0.3" stopColor="#c9ff8a" />
            <stop offset="1" stopColor="#ffffff" />
          </linearGradient>
        </defs>
        <path d={TRILHA} pathLength="1000" className="cena-cidade__brilho" stroke="#9dff7a" strokeWidth="22" />
        <path d={TRILHA} pathLength="1000" className="cena-cidade__cometa" stroke="url(#cena-trilha)" strokeWidth="7" />
      </svg>

      {/* Pulsos no chão: pins e o ponto do meio da trilha */}
      <span className="cena-cidade__pulso cena-cidade__pulso--grande" style={em(1318, 266)} />
      <span className="cena-cidade__pulso" style={{ ...em(708, 404), animationDelay: "2.4s" }} />
      <span className="cena-cidade__ponto" style={em(1028, 523)} />

      {/* Cartão do desenho, refeito em HTML por cima do original */}
      <div className="cena-cidade__cartao" style={{ ...em(808, 192), width: `${(426 / W) * 100}%`, height: `${(150 / H) * 100}%` }}>
        <Icon nome="hospital" className="size-[2.3em] text-rota" />
        <span className="flex min-w-0 flex-1 flex-col justify-center gap-[0.3em]">
          <span className="text-[0.74em] leading-none text-salvia">Unidade mais próxima</span>
          <span className="text-[1em] leading-tight font-bold whitespace-nowrap text-pinho">Hospital Central</span>
          <span className="flex items-center gap-[0.3em] text-[0.82em] leading-none text-salvia">
            <Icon nome="pin" className="size-[1.05em] text-pinho" />
            1,2 km
          </span>
        </span>
        <Icon nome="avancar" className="size-[1.1em] text-pinho" />
      </div>
    </div>
  );
}
