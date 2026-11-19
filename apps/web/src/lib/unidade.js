/**
 * Textos e formatos dos campos de unidade vindos da API Java.
 * Regra do documento de contexto §7.4 e §11: ausência nunca vira "não possui".
 */

/** D-13: cada valor do enum da API vira um texto aprovado (sem "Parcial"). */
export const ACESSIBILIDADE = Object.freeze({
  ACESSIVEL: { rotulo: "Acessível (verificado)", tom: "info" },
  NAO_ACESSIVEL: { rotulo: "Não acessível (verificado)", tom: "aviso" },
  NAO_VERIFICADO: { rotulo: "Informação não verificada", tom: "neutro" },
  NAO_INFORMADO: { rotulo: "Não informado pela fonte", tom: "neutro" },
});

export function textoAcessibilidade(status) {
  return ACESSIBILIDADE[status] ?? ACESSIBILIDADE.NAO_INFORMADO;
}

/** Indicador de atendimento ambulatorial SUS publicado pelo CNES. */
export const ATENDE_SUS = Object.freeze({
  SIM: "Sim, segundo o cadastro do CNES",
  NAO: "Não, segundo o cadastro do CNES",
  NAO_INFORMADO: "Não informado pela fonte",
});

export function textoAtendeSus(valor) {
  return ATENDE_SUS[valor] ?? ATENDE_SUS.NAO_INFORMADO;
}

/** Nome curto da fonte para a tela; sigla desconhecida aparece como veio. */
const FONTES = Object.freeze({
  CNES_DEMAS: "CNES (Ministério da Saúde)",
  CNES_EQ: "CNES – equipamentos (DATASUS)",
  CNES_SR: "CNES – serviços especializados (DATASUS)",
});

export function textoFonte(sigla) {
  if (!sigla) return null;
  return FONTES[sigla] ?? String(sigla);
}

/** "(11) 3473-0280"; formato desconhecido volta como veio; vazio vira null. */
export function formatarTelefone(valor) {
  if (!valor) return null;
  const d = String(valor).replace(/\D/g, "");
  if (d.length === 10) return `(${d.slice(0, 2)}) ${d.slice(2, 6)}-${d.slice(6)}`;
  if (d.length === 11) return `(${d.slice(0, 2)}) ${d.slice(2, 7)}-${d.slice(7)}`;
  return String(valor);
}

export function formatarCep(valor) {
  if (!valor) return null;
  const d = String(valor).replace(/\D/g, "");
  return d.length === 8 ? `${d.slice(0, 5)}-${d.slice(5)}` : String(valor);
}

/** Endereço em uma linha, só com as partes que a fonte informou (ou null). */
export function enderecoEmTexto(endereco) {
  if (!endereco) return null;
  const rua = [endereco.logradouro, endereco.numero].filter(Boolean).join(", ");
  const cep = formatarCep(endereco.cep);
  const partes = [rua, endereco.bairro, endereco.uf, cep && `CEP ${cep}`].filter(Boolean);
  return partes.length ? partes.join(" · ") : null;
}

/**
 * D-16: link para o app de mapas com o destino preenchido, sem chave de API.
 * Usa as coordenadas da fonte; sem elas, o endereço; sem os dois, null (o botão some).
 */
export function linkMapas({ latitude, longitude, endereco, nome } = {}) {
  const base = "https://www.google.com/maps/search/?api=1&query=";
  if (latitude !== null && latitude !== undefined && longitude !== null && longitude !== undefined) {
    return base + encodeURIComponent(`${latitude},${longitude}`);
  }
  if (endereco?.logradouro) {
    const texto = [nome, endereco.logradouro, endereco.numero, endereco.bairro, endereco.uf]
      .filter(Boolean)
      .join(", ");
    return base + encodeURIComponent(texto);
  }
  return null;
}

/*
 * O CNES publica os textos em MAIÚSCULAS e sem acento ("POLICLINICA",
 * "TURNOS DA MANHA"). Para leitura, a tela passa para minúsculas e devolve os
 * acentos das palavras mais comuns. O conteúdo não muda: só a forma de escrever.
 */
const ACENTOS = Object.freeze({
  saude: "saúde",
  clinica: "clínica",
  policlinica: "policlínica",
  basica: "básica",
  medico: "médico",
  medica: "médica",
  farmacia: "farmácia",
  odontologica: "odontológica",
  odontologico: "odontológico",
  laboratorio: "laboratório",
  atencao: "atenção",
  movel: "móvel",
  diagnostico: "diagnóstico",
  especialidade: "especialidade",
  manha: "manhã",
  sabado: "sábado",
  sabados: "sábados",
  horario: "horário",
  horarios: "horários",
  servico: "serviço",
  servicos: "serviços",
  sao: "são",
  joao: "joão",
  jose: "josé",
  avenida: "avenida",
  praca: "praça",
  regiao: "região",
  publica: "pública",
  hospitalar: "hospitalar",
  urgencia: "urgência",
  emergencia: "emergência",
  pratica: "prática",
  psicossocial: "psicossocial",
  continuo: "contínuo",
  plantao: "plantão",
  ininterrupto: "ininterrupto",
  periodo: "período",
  agendamento: "agendamento",
  unico: "único",
});
const MINUSCULAS = new Set(["de", "da", "do", "das", "dos", "e", "a", "o", "em", "na", "no", "nas", "nos"]);

// Troca palavra por palavra (letras), sem mexer em pontuação, números e espaços.
function comAcentos(valor, trocar = (p) => p) {
  let indice = 0;
  return String(valor)
    .trim()
    .toLowerCase()
    .replace(/\p{L}+/gu, (p) => trocar(ACENTOS[p] ?? p, indice++));
}

/** "ATENDIMENTOS NOS TURNOS DA MANHA" → "Atendimentos nos turnos da manhã"; vazio → null. */
export function textoLegivel(valor) {
  if (!valor || !String(valor).trim()) return null;
  const texto = comAcentos(valor);
  return texto.charAt(0).toUpperCase() + texto.slice(1);
}

/** "PROF JOSE AZEVEDO ANTUNES" → "Prof José Azevedo Antunes" (preposições em minúsculas); vazio → null. */
export function nomeProprio(valor) {
  if (!valor || !String(valor).trim()) return null;
  return comAcentos(valor, (p, i) => (i > 0 && MINUSCULAS.has(p) ? p : p.charAt(0).toUpperCase() + p.slice(1)));
}
