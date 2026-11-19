package br.com.vias.exception;

/** Lancada quando o pedido e valido no formato, mas viola uma regra do dominio (HTTP 422). */
public class RegraNegocioException extends RuntimeException {

    public RegraNegocioException(String mensagem) {
        super(mensagem);
    }
}
