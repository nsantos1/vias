import { render, screen, within } from "@testing-library/react";
import ResultadoPercurso from "@/components/percurso/ResultadoPercurso";
import { PERCURSO_FICTICIO, PERCURSO_SEM_OPCOES } from "../fixtures/percurso";

test("destaca a hora de sair e quanto tempo antes a pessoa chega", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);

  expect(screen.getByRole("heading", { name: "Saia às 13:25" })).toBeInTheDocument();
  expect(screen.getByText(/Atendimento às 14:30 — você chega 26 min antes/)).toBeInTheDocument();
  expect(screen.getAllByText("Ônibus 9999-10 → Metrô L9").length).toBeGreaterThan(0);
});

test("mostra o passo a passo com embarque, desembarque e intervalo", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);
  const passos = screen.getByRole("heading", { name: "Passo a passo" }).closest("section");

  expect(within(passos).getByText(/Embarque às 13:30/)).toBeInTheDocument();
  expect(within(passos).getByText(/Desça às 13:50/)).toBeInTheDocument();
  expect(within(passos).getByText(/12 paradas/)).toBeInTheDocument();
  expect(within(passos).getByText(/Passa a cada 10 min/)).toBeInTheDocument();
});

test("previsão ao vivo diz o próximo ônibus acessível e não presume acessibilidade", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);

  expect(screen.getByText(/Próximo ônibus acessível: 13:28/)).toBeInTheDocument();
  expect(screen.getByText(/· não acessível/)).toBeInTheDocument();
  expect(screen.getByText(/· acessibilidade não informada/)).toBeInTheDocument();
  // Metrô: a fonte não informa a acessibilidade da estação.
  expect(screen.getByText(/Acessibilidade da estação não informada/)).toBeInTheDocument();
});

test("outras opções ficam recolhidas, com a fonte e o link do mapa", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);

  expect(screen.getByText("Saia às 13:50 · chegada às 14:15")).toBeInTheDocument();
  expect(screen.getByText(/Fontes: Google Routes API · previsão ao vivo: SPTrans Olho Vivo/)).toBeInTheDocument();
  expect(screen.getByRole("link", { name: /Google Maps/ })).toHaveAttribute(
    "href",
    expect.stringContaining("destination=-23.56%2C-46.66"),
  );
});

test("sem opções, mostra o aviso da API em vez de inventar um percurso", () => {
  render(<ResultadoPercurso dados={PERCURSO_SEM_OPCOES} />);

  expect(screen.getByText("Não encontramos percurso fictício.")).toBeInTheDocument();
  expect(screen.queryByText(/Saia às/)).not.toBeInTheDocument();
  expect(screen.queryByText(/previsão ao vivo:/)).not.toBeInTheDocument();
});
