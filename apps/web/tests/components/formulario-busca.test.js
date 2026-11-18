import { render, screen, within } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import FormularioBusca from "@/components/busca/FormularioBusca";

// Catálogo FICTÍCIO: simula a API depois do D-19 (com `categoria`).
const CATALOGO_COM_CATEGORIA = [
  { id: 1, nome: "Atendimento fictício", descricao: "", categoria: "ATENDIMENTO", totalUnidades: 3 },
  { id: 2, nome: "Exame fictício de imagem", descricao: "", categoria: "EXAME", totalUnidades: 2 },
  { id: 3, nome: "Especialidade fictícia", descricao: "", categoria: "ESPECIALIDADE", totalUnidades: 1 },
];
// Catálogo FICTÍCIO no formato atual (sem `categoria`).
const CATALOGO_ATUAL = [
  { id: 1, nome: "Atendimento fictício", descricao: "", totalUnidades: 3 },
  { id: 2, nome: "Outro atendimento fictício", descricao: "", totalUnidades: 2 },
];

const push = jest.fn();
jest.mock("next/navigation", () => ({ useRouter: () => ({ push }) }));
jest.mock("@/services/api/servicos", () => ({ listarServicos: jest.fn() }));
const { listarServicos } = jest.requireMock("@/services/api/servicos");

beforeEach(() => push.mockClear());

test("com categoria na API: sugestões em grupos Exames, Especialidades e Atendimento", async () => {
  listarServicos.mockResolvedValue(CATALOGO_COM_CATEGORIA);
  render(<FormularioBusca />);
  const campo = screen.getByRole("combobox", { name: /Exame, serviço ou especialidade/ });
  await screen.findByRole("button", { name: /Buscar unidades/, hidden: false });
  await userEvent.click(campo);

  const lista = screen.getByRole("listbox");
  const grupos = within(lista).getAllByRole("group");
  expect(grupos.map((g) => g.getAttribute("aria-labelledby") && document.getElementById(g.getAttribute("aria-labelledby")).textContent)).toEqual([
    "Exames",
    "Especialidades",
    "Atendimento",
  ]);
  expect(within(grupos[0]).getByRole("option", { name: /Exame fictício de imagem/ })).toBeInTheDocument();
});

test("teclado percorre os grupos na ordem e Enter escolhe; a busca leva o id real", async () => {
  listarServicos.mockResolvedValue(CATALOGO_COM_CATEGORIA);
  render(<FormularioBusca />);
  const campo = screen.getByRole("combobox", { name: /Exame, serviço ou especialidade/ });
  await screen.findByText("3 unidades");
  await userEvent.click(campo);
  await userEvent.keyboard("{ArrowDown}{ArrowDown}{Enter}");
  expect(campo).toHaveValue("Especialidade fictícia");
  await userEvent.click(screen.getByRole("button", { name: /Buscar unidades/ }));
  expect(push).toHaveBeenCalledWith("/unidades?servicoId=3");
});

test("sem categoria (API de hoje): lista simples, sem grupos", async () => {
  listarServicos.mockResolvedValue(CATALOGO_ATUAL);
  render(<FormularioBusca />);
  await screen.findByText("3 unidades");
  await userEvent.click(screen.getByRole("combobox", { name: /Exame, serviço ou especialidade/ }));
  expect(screen.queryAllByRole("group")).toHaveLength(0);
  expect(screen.getAllByRole("option")).toHaveLength(2);
});

test("texto sem correspondência: avisa e não busca", async () => {
  listarServicos.mockResolvedValue(CATALOGO_ATUAL);
  render(<FormularioBusca />);
  await screen.findByText("3 unidades");
  await userEvent.type(screen.getByRole("combobox", { name: /Exame, serviço ou especialidade/ }), "mamografia");
  expect(screen.getByRole("status")).toHaveTextContent("Nenhum item do catálogo com “mamografia”");
  await userEvent.click(screen.getByRole("button", { name: /Buscar unidades/ }));
  expect(push).not.toHaveBeenCalled();
});
