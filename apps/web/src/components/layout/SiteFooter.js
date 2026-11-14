/**
 * Rodapé comum. Só informações institucionais verdadeiras:
 * nada de telefone, horário ou promessa de atendimento.
 */
export default function SiteFooter() {
  return (
    <footer className="mt-auto border-t border-linha bg-papel">
      <div className="mx-auto flex max-w-5xl flex-col gap-2 px-4 py-6 text-sm text-salvia sm:px-6">
        <p>
          <span className="font-semibold text-pinho">VIAS</span> — Via
          Inteligente de Acesso à Saúde
        </p>
        <p>
          Projeto acadêmico da FIAP Global Solution 2026. O VIAS não substitui a
          orientação de um profissional de saúde.
        </p>
      </div>
    </footer>
  );
}
