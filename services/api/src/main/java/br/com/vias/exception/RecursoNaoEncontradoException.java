package br.com.vias.exception;

/** Lancada quando um registro pedido pelo id nao existe (HTTP 404). */
public class RecursoNaoEncontradoException extends RuntimeException {

    public RecursoNaoEncontradoException(String recurso, Long id) {
        super(recurso + " com id " + id + " nao encontrado(a).");
    }
}
