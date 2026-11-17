package br.com.vias.model.enums;

/**
 * Estado de acessibilidade da unidade. Ausencia de informacao NUNCA vira NAO_ACESSIVEL.
 * ACESSIVEL e NAO_ACESSIVEL exigem fonte e data de verificacao.
 */
public enum StatusAcessibilidade {
    ACESSIVEL,
    NAO_ACESSIVEL,
    /** A fonte nao publica a informacao. */
    NAO_INFORMADO,
    /** Ha alguma indicacao, mas ninguem verificou. */
    NAO_VERIFICADO;

    public boolean exigeComprovacao() {
        return this == ACESSIVEL || this == NAO_ACESSIVEL;
    }
}
