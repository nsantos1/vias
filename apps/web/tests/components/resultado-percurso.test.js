import { fireEvent, render, screen, within } from "@testing-library/react";
import ResultadoPercurso from "@/components/percurso/ResultadoPercurso";
import { PERCURSO_FICTICIO, PERCURSO_SEM_OPCOES } from "../fixtures/percurso";

// O mapa (Leaflet) precisa de um navegador de verdade; aqui ele vira um dublê
// que só mostra quantas linhas receberia.
jest.mock("@/components/percurso/MapaPercurso", () => {
  function MapaFalso({ linhas }) {
    return <div data-testid="mapa">{linhas.length} linhas</div>;
  }
  return MapaFalso;
});
jest.mock("next/dynamic", () => () => {
  const Mapa = jest.requireMock("@/components/percurso/MapaPercurso");
  return Mapa;
});

test("destaca quanto falta para sair, até que horas sair e a chegada prevista", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);

  expect(screen.getByRole("heading", { name: "Faltam 25 min para sair." })).toBeInTheDocument();
  expect(screen.getByText(/Saia até 13:25 e chegue às 14:04, 26 min antes do atendimento/)).toBeInTheDocument();
  expect(screen.getByText("Chegada prevista")).toBeInTheDocument();
  expect(screen.getByText(/Ônibus acessível da linha 9999-10 previsto no ponto às/)).toBeInTheDocument();
});

test("o mapa recebe só os trechos que têm geometria", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);
  // Na fixture, a caminhada inicial e o ônibus têm geometria; o metrô e a última caminhada, não.
  expect(screen.getByTestId("mapa")).toHaveTextContent("2 linhas");
});

test("passo a passo com horários, embarque, desembarque e chegada", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);
  const passos = screen.getByRole("heading", { name: "Passo a passo" }).closest("section");

  expect(within(passos).getByText("13:25")).toBeInTheDocument();
  expect(within(passos).getByText("13:30")).toBeInTheDocument();
  expect(within(passos).getByText(/Embarque em Parada fictícia A/)).toBeInTheDocument();
  expect(within(passos).getByText(/12 paradas/)).toBeInTheDocument();
  expect(within(passos).getByText("Chegada")).toBeInTheDocument();
  expect(within(passos).getByText("14:04")).toBeInTheDocument();
});

test("previsão ao vivo não presume acessibilidade; metrô diz que não é informada", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);

  expect(screen.getByText(/· não acessível/)).toBeInTheDocument();
  expect(screen.getByText(/· acessibilidade não informada/)).toBeInTheDocument();
  expect(screen.getByText(/Acessibilidade da estação não informada/)).toBeInTheDocument();
});

test("lista todas as opções e escolher uma troca o destaque", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);

  expect(screen.getByText("3 opções")).toBeInTheDocument();
  expect(screen.getByRole("button", { name: /Saia até 13:25/ })).toHaveAttribute("aria-pressed", "true");

  fireEvent.click(screen.getByRole("button", { name: /Saia até 13:50/ }));
  expect(screen.getByRole("heading", { name: "Faltam 50 min para sair." })).toBeInTheDocument();
  expect(screen.getByRole("button", { name: /Saia até 13:50/ })).toHaveAttribute("aria-pressed", "true");
});

test("o botão Alterar horário volta ao formulário", () => {
  const aoAlterar = jest.fn();
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} aoAlterar={aoAlterar} />);
  fireEvent.click(screen.getByRole("button", { name: /Alterar horário/ }));
  expect(aoAlterar).toHaveBeenCalled();
});

test("fontes e link do mapa", () => {
  render(<ResultadoPercurso dados={PERCURSO_FICTICIO} />);

  expect(screen.getByText(/Fontes: Google Routes API · previsão ao vivo: SPTrans Olho Vivo/)).toBeInTheDocument();
  expect(screen.getByRole("link", { name: /Google Maps/ })).toHaveAttribute(
    "href",
    expect.stringContaining("destination=-23.56%2C-46.66"),
  );
});

test("sem opções, mostra o aviso da API em vez de inventar um percurso", () => {
  render(<ResultadoPercurso dados={PERCURSO_SEM_OPCOES} />);

  expect(screen.getByText("Não encontramos percurso fictício.")).toBeInTheDocument();
  expect(screen.queryByText(/Saia até/)).not.toBeInTheDocument();
  expect(screen.queryByText(/para sair/)).not.toBeInTheDocument();
  expect(screen.queryByTestId("mapa")).not.toBeInTheDocument();
});
