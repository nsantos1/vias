import { IBM_Plex_Mono, Inter, Space_Grotesk } from "next/font/google";
import SiteFooter from "@/components/layout/SiteFooter";
import SiteHeader from "@/components/layout/SiteHeader";
import "./globals.css";

// Mesmas famílias da landing: Inter no texto, Space Grotesk nos títulos,
// IBM Plex Mono em rótulos curtos.
const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
});

const spaceGrotesk = Space_Grotesk({
  variable: "--font-space-grotesk",
  subsets: ["latin"],
  weight: ["600", "700"],
});

const plexMono = IBM_Plex_Mono({
  variable: "--font-plex-mono",
  subsets: ["latin"],
  weight: ["400", "500"],
});

export const metadata = {
  title: {
    default: "VIAS — Via Inteligente de Acesso à Saúde",
    template: "%s · VIAS",
  },
  description:
    "Encontre a unidade de saúde para a sua necessidade e entenda como chegar até ela.",
};

export default function RootLayout({ children }) {
  return (
    <html
      lang="pt-BR"
      className={`${inter.variable} ${spaceGrotesk.variable} ${plexMono.variable} h-full antialiased`}
    >
      <body className="flex min-h-full flex-col">
        {/* Primeiro item do Tab: leva direto ao conteúdo, pulando o menu */}
        <a
          href="#conteudo"
          className="sr-only rounded-pill bg-pinho px-5 py-3 font-semibold text-papel focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-50"
        >
          Pular para o conteúdo
        </a>
        <SiteHeader />
        <main id="conteudo" tabIndex={-1} className="flex-1 focus:outline-none">
          {children}
        </main>
        <SiteFooter />
      </body>
    </html>
  );
}
