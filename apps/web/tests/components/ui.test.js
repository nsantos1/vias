import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { useState } from "react";
import Button from "@/components/ui/Button";
import Chip from "@/components/ui/Chip";
import Etapas from "@/components/ui/Etapas";
import { SelectField, TextField } from "@/components/ui/Field";

describe("Button", () => {
  test("carregando: desabilitado, aria-busy e anuncia 'carregando'", () => {
    render(<Button carregando>Buscar</Button>);
    const botao = screen.getByRole("button", { name: /Buscar\s*,\s*carregando/ });
    expect(botao).toBeDisabled();
    expect(botao).toHaveAttribute("aria-busy", "true");
  });

  test("tipo padrão é 'button' (não envia formulário sem querer)", () => {
    render(<Button>Ação</Button>);
    expect(screen.getByRole("button", { name: "Ação" })).toHaveAttribute("type", "button");
  });

  test("com href vira link", () => {
    render(<Button href="/">Início</Button>);
    expect(screen.getByRole("link", { name: "Início" })).toHaveAttribute("href", "/");
  });
});

describe("TextField", () => {
  test("rótulo, dica e erro ligados ao campo", () => {
    render(<TextField rotulo="Campo fictício" dica="Dica fictícia" erro="Erro fictício" obrigatorio />);
    const campo = screen.getByLabelText(/Campo fictício/);
    expect(campo).toBeRequired();
    expect(campo).toHaveAttribute("aria-invalid", "true");
    expect(campo).toHaveAccessibleDescription("Dica fictícia Erro fictício");
    expect(screen.getByText("(obrigatório)")).toBeInTheDocument();
  });

  test("sem erro, não fica marcado como inválido", () => {
    render(<TextField rotulo="Campo fictício" />);
    expect(screen.getByLabelText("Campo fictício")).not.toHaveAttribute("aria-invalid");
  });

  test("limpar apaga o texto e devolve o foco ao campo", async () => {
    function Exemplo() {
      const [valor, setValor] = useState("texto fictício");
      return (
        <TextField
          rotulo="Busca fictícia"
          value={valor}
          onChange={(e) => setValor(e.target.value)}
          aoLimpar={() => setValor("")}
        />
      );
    }
    render(<Exemplo />);
    await userEvent.click(screen.getByRole("button", { name: "Limpar campo" }));
    const campo = screen.getByLabelText("Busca fictícia");
    expect(campo).toHaveValue("");
    expect(campo).toHaveFocus();
    expect(screen.queryByRole("button", { name: "Limpar campo" })).not.toBeInTheDocument();
  });
});

describe("SelectField", () => {
  test("mostra só as opções recebidas, mais a opção vazia", () => {
    render(
      <SelectField
        rotulo="Seleção fictícia"
        opcoes={[
          { valor: "a", rotulo: "Opção fictícia A" },
          { valor: "b", rotulo: "Opção fictícia B" },
        ]}
      />,
    );
    const opcoes = screen.getAllByRole("option").map((o) => o.textContent);
    expect(opcoes).toEqual(["Selecione", "Opção fictícia A", "Opção fictícia B"]);
  });
});

describe("Chip", () => {
  test("removível tem nome acessível que diz o que remove", async () => {
    const aoRemover = jest.fn();
    render(<Chip aoRemover={aoRemover}>Filtro fictício</Chip>);
    await userEvent.click(screen.getByRole("button", { name: "Remover filtro: Filtro fictício" }));
    expect(aoRemover).toHaveBeenCalled();
  });
});

describe("Etapas", () => {
  test("etapa atual tem aria-current e as concluídas são anunciadas", () => {
    render(<Etapas atual={2} />);
    expect(screen.getByText("Etapa 2 de 3")).toBeInTheDocument();
    const atual = screen.getByRole("listitem", { current: "step" });
    expect(atual).toHaveTextContent("Unidade");
    expect(screen.getByText("(concluída)")).toBeInTheDocument();
  });

  test("Percurso aparece 'em breve' enquanto a rota não existe", () => {
    render(<Etapas atual={1} />);
    expect(screen.getByText("em breve")).toBeInTheDocument();
  });

  test("com percurso disponível, não mostra 'em breve'", () => {
    render(<Etapas atual={1} percursoDisponivel />);
    expect(screen.queryByText("em breve")).not.toBeInTheDocument();
  });
});
