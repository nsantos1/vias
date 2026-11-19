// FIXTURE FICTÍCIA — só para testes. Imita o formato do POST /api/percursos;
// unidade, paradas, linhas, horários e veículos são inventados.

export const PERCURSO_FICTICIO = Object.freeze({
  unidade: { id: 7, nome: "Unidade fictícia", latitude: -23.56, longitude: -46.66 },
  horarioAtendimento: "2026-11-19T14:30:00",
  folgaMinutos: 15,
  chegarAte: "2026-11-19T14:15:00",
  calculadoEm: "2026-11-19T13:00:00",
  opcoes: [
    {
      recomendada: true,
      saida: "2026-11-19T13:25:00",
      chegada: "2026-11-19T14:04:00",
      duracaoMinutos: 39,
      distanciaMetros: 9100,
      chegaATempo: true,
      trechos: [
        {
          tipo: "A_PE",
          duracaoMinutos: 5,
          distanciaMetros: 350,
          de: "Sua localização",
          para: "Parada fictícia A",
          // Polilinha de exemplo da documentação do Google (não é um caminho real).
          geometria: ["_p~iF~ps|U_ulLnnqC"],
        },
        {
          tipo: "ONIBUS",
          veiculo: "Ônibus",
          duracaoMinutos: 20,
          de: "Parada fictícia A",
          para: "Parada fictícia B",
          linha: { codigo: "9999-10", nome: "Linha fictícia", operadora: "Operadora fictícia" },
          sentido: "Terminal fictício",
          embarque: { nome: "Parada fictícia A", horario: "2026-11-19T13:30:00" },
          desembarque: { nome: "Parada fictícia B", horario: "2026-11-19T13:50:00" },
          paradas: 12,
          intervaloMinutos: 10,
          geometria: ["_p~iF~ps|U_ulLnnqC_mqNvxq`@"],
          aoVivo: {
            status: "DISPONIVEL",
            parada: "PONTO FICTÍCIO",
            consultadoAs: "13:00",
            onibus: [
              { prefixo: "F1", previsto: "2026-11-19T13:20:00", acessivel: false },
              { prefixo: "F2", previsto: "2026-11-19T13:28:00", acessivel: true },
              { prefixo: "F3", previsto: "2026-11-19T13:35:00", acessivel: null },
            ],
            proximoAcessivel: { prefixo: "F2", previsto: "2026-11-19T13:28:00", acessivel: true },
          },
        },
        {
          tipo: "METRO",
          veiculo: "Metrô",
          duracaoMinutos: 5,
          linha: { codigo: "L9" },
          embarque: { nome: "Estação fictícia 1", horario: "2026-11-19T13:55:00" },
          desembarque: { nome: "Estação fictícia 2", horario: "2026-11-19T14:00:00" },
          paradas: 1,
        },
        { tipo: "A_PE", duracaoMinutos: 4, distanciaMetros: 250, de: "Estação fictícia 2", para: "Unidade fictícia" },
      ],
    },
    {
      recomendada: false,
      saida: "2026-11-19T13:40:00",
      chegada: "2026-11-19T14:10:00",
      duracaoMinutos: 30,
      chegaATempo: true,
      trechos: [
        { tipo: "A_PE", duracaoMinutos: 4, distanciaMetros: 300, para: "Parada fictícia C" },
        {
          tipo: "ONIBUS",
          linha: { codigo: "8888-10" },
          embarque: { nome: "Parada fictícia C", horario: "2026-11-19T13:44:00" },
          desembarque: { nome: "Parada fictícia D", horario: "2026-11-19T14:05:00" },
          aoVivo: { status: "FORA_DA_JANELA", mensagem: "Mensagem fictícia de janela.", onibus: [] },
        },
        { tipo: "A_PE", duracaoMinutos: 5, distanciaMetros: 300, para: "Unidade fictícia" },
      ],
    },
    {
      recomendada: false,
      saida: "2026-11-19T13:50:00",
      chegada: "2026-11-19T14:15:00",
      duracaoMinutos: 25,
      chegaATempo: true,
      trechos: [{ tipo: "A_PE", duracaoMinutos: 25, distanciaMetros: 1800, de: "Sua localização", para: "Unidade fictícia" }],
    },
  ],
  fontes: { rotas: "Google Routes API", aoVivo: "SPTrans Olho Vivo" },
  avisos: ["Aviso fictício da API."],
});

export const PERCURSO_SEM_OPCOES = Object.freeze({
  ...PERCURSO_FICTICIO,
  opcoes: [],
  fontes: { rotas: "Google Routes API", aoVivo: null },
  avisos: ["Não encontramos percurso fictício.", "Outro aviso fictício."],
});
