import CabecalhoTela from "./CabecalhoTela";

/**
 * Cabeçalho comum: [Voltar] VIAS │ RÓTULO DA TELA (referências de UI).
 * O link "Sobre o VIAS" foi para o rodapé. "Rota" e "Gestão" não aparecem
 * enquanto os contratos D-05 e D-07 não forem aprovados.
 */
export default function SiteHeader() {
  return (
    <header className="relative z-10">
      <div className="mx-auto flex max-w-5xl items-center px-4 py-3 sm:px-6 sm:py-4">
        <CabecalhoTela />
      </div>
    </header>
  );
}
