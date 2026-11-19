import OndaRodape from "@/components/decor/OndaRodape";
import { SITE_INSTITUCIONAL } from "@/lib/site";

/**
 * Rodapé comum, escuro como o da landing, com a onda das referências de UI.
 * Só informações institucionais verdadeiras: nada de telefone, horário ou
 * promessa de atendimento.
 */
export default function SiteFooter() {
  return (
    <footer className="rodape mt-auto">
      <OndaRodape />
      <div className="bg-rodape text-rodape-texto">
        <div className="rodape__conteudo mx-auto flex max-w-5xl flex-col gap-2 px-4 pb-7 text-sm sm:px-6">
          <p>
            <span className="font-semibold text-papel">VIAS</span> — Via Inteligente de
            Acesso à Saúde
            <span aria-hidden="true" className="hidden sm:inline"> · </span>
            <a
              href={SITE_INSTITUCIONAL}
              className="flex min-h-11 items-center font-semibold text-lima underline-offset-4 hover:underline focus-visible:outline-lima sm:inline sm:min-h-0"
            >
              Sobre o VIAS
            </a>
          </p>
          <p>
            Projeto acadêmico da FIAP Global Solution 2026. O VIAS não substitui a
            orientação de um profissional de saúde.
          </p>
        </div>
      </div>
    </footer>
  );
}
