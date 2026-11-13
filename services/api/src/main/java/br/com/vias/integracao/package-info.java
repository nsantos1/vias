/**
 * Clientes das APIs externas e internas que a API do VIAS chama: OpenTripPlanner, Olho Vivo,
 * Google Routes e o serviço de IA.
 *
 * <p>Responsável: Nicolas (3). PROPOSTA para combinar com o Raphael (2): as interfaces e os
 * records deste pacote são o contrato que os serviços da API ({@code rota}, {@code agendamento})
 * usam. Enquanto as implementações não existem, o Raphael pode simular as respostas com
 * Mockito a partir destas interfaces.
 *
 * <p>Regra de arquitetura: o app e o painel nunca chamam estes serviços direto; só a API.
 */
package br.com.vias.integracao;
