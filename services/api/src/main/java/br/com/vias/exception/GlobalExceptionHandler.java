package br.com.vias.exception;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.HandlerMethodValidationException;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Camada de tratamento de excecoes: transforma qualquer erro em uma resposta JSON
 * padronizada (ErroResposta) com o status HTTP correto, sem expor detalhes internos.
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(RecursoNaoEncontradoException.class)
    public ResponseEntity<ErroResposta> naoEncontrado(RecursoNaoEncontradoException e, HttpServletRequest req) {
        return resposta(HttpStatus.NOT_FOUND, e.getMessage(), req, null);
    }

    @ExceptionHandler(RegraNegocioException.class)
    public ResponseEntity<ErroResposta> regraNegocio(RegraNegocioException e, HttpServletRequest req) {
        return resposta(HttpStatus.UNPROCESSABLE_ENTITY, e.getMessage(), req, null);
    }

    @ExceptionHandler(ConflitoException.class)
    public ResponseEntity<ErroResposta> conflito(ConflitoException e, HttpServletRequest req) {
        return resposta(HttpStatus.CONFLICT, e.getMessage(), req, null);
    }

    /** Erros de @Valid no corpo da requisicao: devolve a lista de campos invalidos. */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErroResposta> validacao(MethodArgumentNotValidException e, HttpServletRequest req) {
        List<ErroResposta.CampoInvalido> campos = e.getBindingResult().getFieldErrors().stream()
                .map(f -> new ErroResposta.CampoInvalido(f.getField(), f.getDefaultMessage()))
                .toList();
        return resposta(HttpStatus.BAD_REQUEST, "Existem campos invalidos na requisicao.", req, campos);
    }

    /** Erros de validacao em parametros de URL/query (@RequestParam com @Min, @DecimalMax...). */
    @ExceptionHandler(HandlerMethodValidationException.class)
    public ResponseEntity<ErroResposta> validacaoParametros(HandlerMethodValidationException e, HttpServletRequest req) {
        List<ErroResposta.CampoInvalido> campos = e.getParameterValidationResults().stream()
                .flatMap(r -> r.getResolvableErrors().stream()
                        .map(err -> new ErroResposta.CampoInvalido(
                                r.getMethodParameter().getParameterName(), err.getDefaultMessage())))
                .toList();
        return resposta(HttpStatus.BAD_REQUEST, "Existem parametros invalidos na requisicao.", req, campos);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<ErroResposta> restricao(ConstraintViolationException e, HttpServletRequest req) {
        List<ErroResposta.CampoInvalido> campos = e.getConstraintViolations().stream()
                .map(v -> new ErroResposta.CampoInvalido(v.getPropertyPath().toString(), v.getMessage()))
                .toList();
        return resposta(HttpStatus.BAD_REQUEST, "Existem parametros invalidos na requisicao.", req, campos);
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public ResponseEntity<ErroResposta> tipoInvalido(MethodArgumentTypeMismatchException e, HttpServletRequest req) {
        return resposta(HttpStatus.BAD_REQUEST,
                "Valor invalido para o parametro '" + e.getName() + "': " + e.getValue(), req, null);
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    public ResponseEntity<ErroResposta> parametroAusente(MissingServletRequestParameterException e, HttpServletRequest req) {
        return resposta(HttpStatus.BAD_REQUEST, "Parametro obrigatorio ausente: " + e.getParameterName(), req, null);
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<ErroResposta> corpoInvalido(HttpMessageNotReadableException e, HttpServletRequest req) {
        return resposta(HttpStatus.BAD_REQUEST,
                "Corpo da requisicao invalido. Confira o JSON, as datas (aaaa-mm-ddThh:mm:ss) e os valores de enum.", req, null);
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ResponseEntity<ErroResposta> metodoNaoSuportado(HttpRequestMethodNotSupportedException e, HttpServletRequest req) {
        return resposta(HttpStatus.METHOD_NOT_ALLOWED, "Metodo " + e.getMethod() + " nao suportado neste endereco.", req, null);
    }

    @ExceptionHandler(NoResourceFoundException.class)
    public ResponseEntity<ErroResposta> rotaInexistente(NoResourceFoundException e, HttpServletRequest req) {
        return resposta(HttpStatus.NOT_FOUND, "Endereco nao encontrado na API.", req, null);
    }

    /** Violacao de constraint no Oracle (FK, UNIQUE, CHECK) que escapou das validacoes do BO. */
    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<ErroResposta> integridade(DataIntegrityViolationException e, HttpServletRequest req) {
        log.warn("Violacao de integridade em {}: {}", req.getRequestURI(), e.getMostSpecificCause().getMessage());
        return resposta(HttpStatus.CONFLICT,
                "A operacao viola uma regra do banco de dados (registro duplicado ou em uso).", req, null);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErroResposta> inesperado(Exception e, HttpServletRequest req) {
        log.error("Erro inesperado em {}", req.getRequestURI(), e);
        return resposta(HttpStatus.INTERNAL_SERVER_ERROR,
                "Erro interno. Tente novamente em instantes.", req, null);
    }

    private ResponseEntity<ErroResposta> resposta(HttpStatus status, String mensagem, HttpServletRequest req,
                                                  List<ErroResposta.CampoInvalido> campos) {
        ErroResposta corpo = new ErroResposta(LocalDateTime.now(), status.value(), status.getReasonPhrase(),
                mensagem, req.getRequestURI(), campos);
        return ResponseEntity.status(status).body(corpo);
    }
}
