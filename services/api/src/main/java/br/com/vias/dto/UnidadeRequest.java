package br.com.vias.dto;

import br.com.vias.model.enums.RespostaCadastro;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.*;

import java.math.BigDecimal;
import java.util.Set;

/**
 * Cadastro/alteracao de unidade. So o nome e obrigatorio: a API nao exige dados que a fonte pode nao ter.
 * Em unidades vindas do CNES, os campos cadastrais nao podem mudar (so acessibilidade e regiao).
 * servicoIds nulo = manter os vinculos atuais; lista vazia = remover todos.
 */
public record UnidadeRequest(
        @Schema(example = "9999999", description = "CNES de 7 digitos, se existir") @Pattern(regexp = "\\d{7}", message = "o codigo CNES tem 7 digitos") String codigoCnes,
        @Schema(example = "Ponto de vacinacao temporario - Feira da Lapa") @NotBlank @Size(max = 150) String nome,
        @Size(max = 150) String razaoSocial,
        @Schema(example = "2") @Min(1) @Max(999) Integer codigoTipoUnidade,
        @Schema(example = "CENTRO DE SAUDE/UNIDADE BASICA") @Size(max = 120) String tipoUnidade,
        @Schema(example = "RUA GUAICURUS") @Size(max = 150) String logradouro,
        @Schema(example = "1000") @Size(max = 10) String numero,
        @Schema(example = "LAPA") @Size(max = 80) String bairro,
        @Schema(example = "05033002") @Pattern(regexp = "\\d{8}", message = "o CEP tem 8 digitos") String cep,
        @Schema(example = "355030") @Pattern(regexp = "\\d{6,7}", message = "codigo IBGE do municipio com 6 ou 7 digitos") String codigoMunicipio,
        @Schema(example = "SP") @Pattern(regexp = "[A-Z]{2}", message = "UF com 2 letras maiusculas") String uf,
        @Size(max = 30) String telefone,
        @DecimalMin("-90.0") @DecimalMax("90.0") BigDecimal latitude,
        @DecimalMin("-180.0") @DecimalMax("180.0") BigDecimal longitude,
        @Schema(example = "ATENDIMENTOS NOS TURNOS DA MANHA E A TARDE") @Size(max = 120) String horarioFuncionamento,
        @Schema(example = "SIM") RespostaCadastro atendeSus,
        @Valid AcessibilidadeDto acessibilidade,
        Long regiaoId,
        Set<Long> servicoIds) {
}
