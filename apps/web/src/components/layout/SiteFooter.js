import OndaRodape from "@/components/decor/OndaRodape";

// Endereço da landing institucional (projeto separado).
const SITE_INSTITUCIONAL = "https://vias-viainteligentedeacessoasaude.vercel.app";

/**
 * Rodapé comum, escuro como o da landing, com a onda das referências de UI.
 * Só informações institucionais verdadeiras: nada de telefone, horário ou
 * promessa de atendimento.
 */
export default function SiteFooter() {
  return (
    <footer className="mt-auto">
      <OndaRodape />
      <div className="bg-rodape text-rodape-texto">
        <div className="mx-auto flex max-w-5xl flex-col gap-3 px-4 pt-2 pb-8 text-sm sm:px-6">
          <p>
            <span className="font-semibold text-papel">VIAS</span> — Via Inteligente de
            Acesso à Saúde
          </p>
          <p>
            Projeto acadêmico da FIAP Global Solution 2026. O VIAS não substitui a
            orientação de um profissional de saúde.
          </p>
          <p>
            <a
              href={SITE_INSTITUCIONAL}
              className="inline-flex min-h-11 items-center font-semibold text-lima underline underline-offset-4 focus-visible:outline-lima"
            >
              Sobre o VIAS
            </a>
          </p>
        </div>
      </div>
    </footer>
  );
}
