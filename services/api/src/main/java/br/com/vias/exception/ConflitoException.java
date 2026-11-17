package br.com.vias.exception;

/** Lancada quando o pedido conflita com dados ja gravados, ex.: codigo CNES repetido (HTTP 409). */
public class ConflitoException extends RuntimeException {

    public ConflitoException(String mensagem) {
        super(mensagem);
    }
}
