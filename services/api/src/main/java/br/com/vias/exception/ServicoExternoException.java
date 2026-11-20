package br.com.vias.exception;

/**
 * Lancada quando um servico externo (Google Routes, SPTrans Olho Vivo) nao esta configurado
 * ou nao respondeu. Vira HTTP 503: o pedido estava certo, mas o calculo nao pode ser feito agora.
 */
public class ServicoExternoException extends RuntimeException {

    public ServicoExternoException(String mensagem) {
        super(mensagem);
    }

    public ServicoExternoException(String mensagem, Throwable causa) {
        super(mensagem, causa);
    }
}
