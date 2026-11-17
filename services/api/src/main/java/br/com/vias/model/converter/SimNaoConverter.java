package br.com.vias.model.converter;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

/** Grava boolean como 'S'/'N' (CHAR(1)), padrao compativel com Oracle 19c. */
@Converter
public class SimNaoConverter implements AttributeConverter<Boolean, String> {

    @Override
    public String convertToDatabaseColumn(Boolean valor) {
        return Boolean.TRUE.equals(valor) ? "S" : "N";
    }

    @Override
    public Boolean convertToEntityAttribute(String coluna) {
        return "S".equalsIgnoreCase(coluna);
    }
}
