import { ESTADOS } from "@/hooks/useConsulta";
import EstadoCarregando from "./EstadoCarregando";
import EstadoErro from "./EstadoErro";
import EstadoVazio from "./EstadoVazio";

/**
 * Escolhe o que mostrar para o resultado de useConsulta (FE-09), para todas as
 * telas tratarem carregando, erro e vazio do mesmo jeito.
 *
 * <EstadoConsulta consulta={consulta} rotuloCarregando="Carregando unidades…"
 *   vazio={{ titulo: "Nenhuma unidade encontrada", descricao: "…", acao: <Button…/> }}>
 *   {(dados) => <ListaDeUnidades dados={dados} />}
 * </EstadoConsulta>
 *
 * Usar dentro de Client Components (recebe funções).
 */
export default function EstadoConsulta({
  consulta,
  rotuloCarregando,
  esqueleto,
  tituloErro,
  acaoErro,
  vazio = {},
  children,
}) {
  switch (consulta.estado) {
    case ESTADOS.INATIVO:
      return null;
    case ESTADOS.CARREGANDO:
      return <EstadoCarregando rotulo={rotuloCarregando}>{esqueleto}</EstadoCarregando>;
    case ESTADOS.ERRO:
      return (
        <EstadoErro
          erro={consulta.erro}
          titulo={tituloErro}
          aoTentarDeNovo={consulta.tentarDeNovo}
          acao={acaoErro}
        />
      );
    case ESTADOS.VAZIO:
      return (
        <EstadoVazio titulo={vazio.titulo} acao={vazio.acao}>
          {vazio.descricao}
        </EstadoVazio>
      );
    default:
      return children(consulta.dados);
  }
}
