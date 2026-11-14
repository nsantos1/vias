/**
 * Página inicial = tela de busca (docs/sitemap.md).
 * O formulário entra no FE-11, depois que GET /api/servicos e GET /api/regioes
 * estiverem disponíveis (D-04). Até lá, a página não mostra nenhum serviço,
 * região ou unidade: nada é inventado.
 */
export default function Home() {
  return (
    <div className="mx-auto flex max-w-5xl flex-col gap-6 px-4 py-10 sm:px-6 sm:py-16">
      <p className="font-mono text-label uppercase text-salvia">
        Via Inteligente de Acesso à Saúde
      </p>
      <h1 className="max-w-2xl text-4xl leading-tight font-bold sm:text-5xl">
        Do que você precisa?
      </h1>
      <p className="max-w-2xl text-lead text-grafite">
        Escolha o exame, serviço ou especialidade e a região. O VIAS mostra as
        unidades de saúde que registram esse atendimento e o que se sabe sobre
        cada uma.
      </p>

      <div
        role="status"
        className="max-w-2xl rounded-xl border border-borda-campo bg-superficie p-5"
      >
        <p className="font-semibold text-pinho">Busca em preparação</p>
        <p className="mt-1 text-salvia">
          A lista de serviços e regiões ainda não está disponível. Assim que a
          consulta estiver pronta, você poderá fazer a busca por aqui.
        </p>
      </div>
    </div>
  );
}
