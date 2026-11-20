import { act, render, screen } from "@testing-library/react";
import AvisoDemora from "@/components/estados/AvisoDemora";
import EstadoCarregando from "@/components/estados/EstadoCarregando";
import { TIMEOUT_PADRAO_MS } from "@/services/api/client";

beforeEach(() => jest.useFakeTimers());
afterEach(() => jest.useRealTimers());

test("só aparece depois do atraso", () => {
  render(<AvisoDemora atrasoMs={5000} />);
  expect(screen.queryByText(/até 3 minutos/)).not.toBeInTheDocument();
  act(() => jest.advanceTimersByTime(5000));
  expect(screen.getByText(/até 3 minutos/)).toBeInTheDocument();
});

test("EstadoCarregando anuncia o aviso de demora dentro do status", () => {
  render(<EstadoCarregando rotulo="Carregando teste…" />);
  act(() => jest.advanceTimersByTime(6000));
  expect(screen.getByRole("status")).toHaveTextContent("até 3 minutos");
});

test("o limite de tempo cobre o despertar do Render (até 3 min)", () => {
  expect(TIMEOUT_PADRAO_MS).toBeGreaterThanOrEqual(180_000);
});
