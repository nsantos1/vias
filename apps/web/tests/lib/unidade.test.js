// Textos de exibição da unidade: ausência nunca vira "não possui".
import {
  enderecoEmTexto,
  formatarCep,
  formatarTelefone,
  linkMapas,
  textoAcessibilidade,
  textoAtendeSus,
  textoFonte,
} from "@/lib/unidade";

test("acessibilidade: cada estado do enum tem texto próprio, e o desconhecido é 'não informado'", () => {
  expect(textoAcessibilidade("ACESSIVEL").rotulo).toBe("Acessível (verificado)");
  expect(textoAcessibilidade("NAO_ACESSIVEL").rotulo).toBe("Não acessível (verificado)");
  expect(textoAcessibilidade("NAO_VERIFICADO").rotulo).toBe("Informação não verificada");
  expect(textoAcessibilidade("NAO_INFORMADO").rotulo).toBe("Não informado pela fonte");
  expect(textoAcessibilidade(undefined).rotulo).toBe("Não informado pela fonte");
});

test("atende SUS: valor ausente não vira 'não'", () => {
  expect(textoAtendeSus("SIM")).toMatch(/^Sim/);
  expect(textoAtendeSus("NAO")).toMatch(/^Não, segundo/);
  expect(textoAtendeSus(null)).toBe("Não informado pela fonte");
});

test("telefone e CEP", () => {
  expect(formatarTelefone("1134730280")).toBe("(11) 3473-0280");
  expect(formatarTelefone("11987654321")).toBe("(11) 98765-4321");
  expect(formatarTelefone("123")).toBe("123");
  expect(formatarTelefone(null)).toBeNull();
  expect(formatarCep("01037000")).toBe("01037-000");
});

test("endereço usa só as partes informadas", () => {
  expect(enderecoEmTexto({ logradouro: "RUA A", numero: "40", bairro: "SE", uf: "SP", cep: "01037000" })).toBe(
    "RUA A, 40 · SE · SP · CEP 01037-000",
  );
  expect(enderecoEmTexto({ logradouro: null, bairro: null })).toBeNull();
  expect(enderecoEmTexto(null)).toBeNull();
});

test("link de mapas: coordenadas, depois endereço, senão nada (D-16)", () => {
  expect(linkMapas({ latitude: -23.5, longitude: -46.6 })).toBe(
    "https://www.google.com/maps/search/?api=1&query=-23.5%2C-46.6",
  );
  expect(linkMapas({ latitude: null, longitude: null, nome: "UBS X", endereco: { logradouro: "RUA A", numero: "1" } })).toBe(
    "https://www.google.com/maps/search/?api=1&query=" + encodeURIComponent("UBS X, RUA A, 1"),
  );
  expect(linkMapas({ latitude: null, longitude: null, endereco: { logradouro: null } })).toBeNull();
});

test("fonte: siglas conhecidas viram nome legível; desconhecida aparece como veio", () => {
  expect(textoFonte("CNES_DEMAS")).toBe("CNES (Ministério da Saúde)");
  expect(textoFonte("CNES_EQ")).toBe("CNES – equipamentos (DATASUS)");
  expect(textoFonte("CNES_SR")).toBe("CNES – serviços especializados (DATASUS)");
  expect(textoFonte("OUTRA")).toBe("OUTRA");
  expect(textoFonte(null)).toBeNull();
});
