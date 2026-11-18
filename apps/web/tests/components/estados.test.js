import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import AvisoDesatualizado from "@/components/estados/AvisoDesatualizado";
import EstadoConsulta from "@/components/estados/EstadoConsulta";
import EstadoErro from "@/components/estados/EstadoErro";
import ValorInformado from "@/components/estados/ValorInformado";
import { ESTADOS } from "@/hooks/useConsulta";
import { ErroApi, TIPOS_ERRO } from "@/services/api/client";
import { LISTA_FICTICIA } from "../fixtures/respostas";

describe("ValorInformado — ausência nunca vira negação", () => {
  test.each([null, undefined, "", "   ", []])("valor %p mostra 'Não informado pela fonte'", (valor) => {
    render(<ValorInformado valor={valor} />);
    expect(screen.getByText("Não informado pela fonte")).toBeInTheDocument();
    expect(screen.queryByText(/não possui|fechado|não acessível/i)).not.toBeInTheDocument();
  });

  test("NAO_VERIFICADO tem texto próprio", () => {
    render(<ValorInformado valor="qualquer" estado="NAO_VERIFICADO" />);
    expect(screen.getByText("Informação não verificada")).toBeInTheDocument();
  });

  test("valor presente aparece como veio", () => {
    render(<ValorInformado valor="Valor fictício" />);
    expect(screen.getByText("Valor fictício")).toBeInTheDocument();
  });

  test("zero é um valor, não ausência", () => {
    render(<ValorInformado valor={0} />);
    expect(screen.getByText("0")).toBeInTheDocument();
  });
});

describe("EstadoErro", () => {
  test("erro de rede: alerta com 'Tentar novamente' que chama a função", async () => {
    const aoTentar = jest.fn();
    render(
      <EstadoErro
        erro={new ErroApi({ tipo: TIPOS_ERRO.REDE, mensagem: "Sem conexão fictícia" })}
        aoTentarDeNovo={aoTentar}
      />,
    );
    expect(screen.getByRole("alert")).toHaveTextContent("Sem conexão fictícia");
    await userEvent.click(screen.getByRole("button", { name: "Tentar novamente" }));
    expect(aoTentar).toHaveBeenCalledTimes(1);
  });

  test("404: sem 'Tentar novamente'", () => {
    render(
      <EstadoErro
        erro={new ErroApi({ tipo: TIPOS_ERRO.HTTP, status: 404, mensagem: "Não encontrado" })}
        aoTentarDeNovo={() => {}}
      />,
    );
    expect(screen.queryByRole("button", { name: "Tentar novamente" })).not.toBeInTheDocument();
  });

  test("erro inesperado não mostra detalhe técnico", () => {
    render(<EstadoErro erro={new TypeError("Cannot read properties of undefined")} />);
    expect(screen.getByRole("alert")).not.toHaveTextContent("Cannot read");
  });
});

describe("EstadoConsulta escolhe o estado certo", () => {
  const base = { dados: null, erro: null, tentarDeNovo: () => {} };
  const filho = (dados) => <p>Conteúdo com {dados.items.length} itens</p>;

  test("carregando: status com o rótulo", () => {
    render(
      <EstadoConsulta consulta={{ ...base, estado: ESTADOS.CARREGANDO }} rotuloCarregando="Carregando teste…">
        {filho}
      </EstadoConsulta>,
    );
    expect(screen.getByRole("status")).toHaveTextContent("Carregando teste…");
  });

  test("vazio: status com título, sem alerta de erro", () => {
    render(
      <EstadoConsulta consulta={{ ...base, estado: ESTADOS.VAZIO }} vazio={{ titulo: "Nada aqui" }}>
        {filho}
      </EstadoConsulta>,
    );
    expect(screen.getByRole("status")).toHaveTextContent("Nada aqui");
    expect(screen.queryByRole("alert")).not.toBeInTheDocument();
  });

  test("erro: alerta, nunca o estado vazio", () => {
    render(
      <EstadoConsulta
        consulta={{ ...base, estado: ESTADOS.ERRO, erro: new ErroApi({ tipo: TIPOS_ERRO.REDE, mensagem: "x" }) }}
        vazio={{ titulo: "Nada aqui" }}
      >
        {filho}
      </EstadoConsulta>,
    );
    expect(screen.getByRole("alert")).toBeInTheDocument();
    expect(screen.queryByText("Nada aqui")).not.toBeInTheDocument();
  });

  test("sucesso: renderiza o conteúdo", () => {
    render(
      <EstadoConsulta consulta={{ ...base, estado: ESTADOS.SUCESSO, dados: LISTA_FICTICIA }}>{filho}</EstadoConsulta>,
    );
    expect(screen.getByText("Conteúdo com 2 itens")).toBeInTheDocument();
  });

  test("inativo: não renderiza nada", () => {
    const { container } = render(
      <EstadoConsulta consulta={{ ...base, estado: ESTADOS.INATIVO }}>{filho}</EstadoConsulta>,
    );
    expect(container).toBeEmptyDOMElement();
  });
});

describe("AvisoDesatualizado", () => {
  test("só aparece quando a API indica", () => {
    const { container } = render(<AvisoDesatualizado desatualizado={false} dataReferencia="2026-01-01" />);
    expect(container).toBeEmptyDOMElement();
  });

  test("com data mostra a data; sem data diz que a fonte não informa", () => {
    const { rerender } = render(<AvisoDesatualizado desatualizado dataReferencia="2026-03-01" />);
    expect(screen.getByRole("status")).toHaveTextContent("01/03/2026");
    rerender(<AvisoDesatualizado desatualizado dataReferencia={null} />);
    expect(screen.getByRole("status")).toHaveTextContent("A fonte não informa a data");
  });
});
