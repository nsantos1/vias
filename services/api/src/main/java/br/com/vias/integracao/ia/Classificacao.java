package br.com.vias.integracao.ia;

/**
 * @param detalhe o que a pessoa pediu, como "raio-x" ou "pediatra"
 * @param tipoUnidade tipo de unidade sugerido (UBS, UPA, pronto-socorro)
 * @param urgente sinais de urgência ("dor no peito"): o app abre a tela do 192, nunca liga sozinho
 */
public record Classificacao(Intencao intencao, String detalhe, String tipoUnidade, boolean urgente) {
}
