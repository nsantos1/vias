package br.com.vias.integracao.ia;

/** Serviço de IA (FastAPI, Felipe): entende o texto livre ou falado da busca. */
public interface ClienteIa {

    /** Por exemplo, "meu filho está com dor de ouvido" vira especialidade otorrino ou UPA. */
    Classificacao classificar(String texto);
}
