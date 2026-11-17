package br.com.vias.exception;

import java.time.LocalDateTime;
import java.util.List;

/** Corpo padrao de todas as respostas de erro da API. */
public record ErroResposta(
        LocalDateTime timestamp,
        int status,
        String erro,
        String mensagem,
        String caminho,
        List<CampoInvalido> campos) {

    public record CampoInvalido(String campo, String mensagem) {
    }
}
