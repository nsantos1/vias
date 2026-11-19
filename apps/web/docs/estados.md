# Estados de consulta (FE-09)

Responsável: Victor. Atualizado em 14/11/2026.

Todas as telas que consultam a API usam o mesmo hook e os mesmos componentes, para **falha nunca parecer lista vazia** e **dado ausente nunca parecer “não possui”**.

## Peças

| Peça | Arquivo | Papel |
|---|---|---|
| `useConsulta(chave, buscar)` | [`src/hooks/useConsulta.js`](../src/hooks/useConsulta.js) | Roda a consulta e devolve `{ estado, dados, erro, tentarDeNovo }` |
| `EstadoConsulta` | [`src/components/estados/`](../src/components/estados/) | Escolhe o que mostrar conforme o estado |
| `EstadoCarregando` | idem | Texto visível + skeleton, `role="status"` |
| `EstadoErro` | idem | `Alert` de erro com a mensagem segura; “Tentar novamente” quando faz sentido |
| `EstadoVazio` | idem | Consulta bem-sucedida sem registros, `role="status"` |
| `ValorInformado` | idem | Campo presente ou “Não informado pela fonte” / “Informação não verificada” |
| `AvisoDesatualizado` | idem | Aviso de dado antigo, **só quando a API indicar** |
| `formatarData`, `formatarDataHora` | [`src/lib/formatos.js`](../src/lib/formatos.js) | Datas em pt-BR; data ausente ou inválida devolve `null`, nunca uma data inventada |

## Os estados

| `estado` | Quando | O que a pessoa vê | Leitor de tela |
|---|---|---|---|
| `inativo` | A consulta ainda não deve rodar (ex.: nenhum serviço escolhido) | Nada | — |
| `carregando` | Consulta em andamento | “Carregando…” + skeleton | Anunciado (`status`) |
| `sucesso` | API respondeu com dados | O conteúdo da tela | — |
| `vazio` | API respondeu com sucesso e lista vazia | “Nenhum … encontrado” + o que fazer (ex.: limpar filtros) | Anunciado (`status`) |
| `erro` | Qualquer falha (rede, demora, 4xx, 5xx, resposta inválida) | Título + mensagem segura + “Tentar novamente” (rede, demora, 5xx) | Anunciado na hora (`alert`) |

Garantias do `useConsulta`:
- quando a `chave` muda (ex.: outro filtro), a consulta anterior é **cancelada**;
- uma resposta antiga **nunca sobrescreve** a mais nova;
- cancelamento não vira erro;
- `tentarDeNovo()` repete a mesma consulta.

## Textos padrão

Seguem o documento de contexto (§7.4 e §11): concretos, sem frases absolutas, sempre dizendo o que a pessoa pode fazer.

| Situação | Texto |
|---|---|
| Campo nulo ou vazio | “Não informado pela fonte” |
| Campo não verificado | “Informação não verificada” |
| Falha (título padrão) | “Não foi possível carregar as informações” |
| Sem conexão / API fora | “Não foi possível conectar ao serviço do VIAS. Verifique a internet e tente de novo.” |
| Demora (depois de 60 s) | “O serviço do VIAS demorou mais de 1 minuto para responder. Tente de novo.” |
| Espera longa (depois de 5 s, ainda carregando) | “Está demorando mais que o normal. Na primeira consulta, o serviço do VIAS pode levar até 1 minuto para iniciar. Aguarde nesta tela.” |
| 404 | “Não encontramos o que você procurou.” |
| Erro no servidor | “O serviço do VIAS encontrou um problema. Tente de novo em instantes.” |
| Desatualizado, com data | “Esta informação pode estar desatualizada. Última informação disponível em DD/MM/AAAA.” |
| Desatualizado, sem data | “Esta informação pode estar desatualizada. A fonte não informa a data desta informação.” |

## Desatualizado (stale)

O Front-end **não calcula** se um dado está velho: não existe regra de validade combinada com o Nicolas e o Raphael. O `AvisoDesatualizado` só aparece quando a API mandar essa indicação. O campo que vai trazer isso depende do DTO de proveniência (D-03).

## Uso numa tela

```jsx
"use client";
const consulta = useConsulta(`unidades?${query}`, (signal) => listarUnidades({ ...filtros, signal }));

<EstadoConsulta
  consulta={consulta}
  rotuloCarregando="Carregando unidades…"
  vazio={{ titulo: "Nenhuma unidade encontrada para estes filtros", acao: <Button …>Limpar filtros</Button> }}
>
  {(dados) => <ListaDeUnidades unidades={dados.items} />}
</EstadoConsulta>
```

## Verificação feita em 14/11

Na vitrine (`/dev/componentes`, seção “Estados de consulta”), com cenários fictícios e uma chamada real:

| Cenário | Estado final | Resultado |
|---|---|---|
| Sucesso (fictício) | `sucesso` | Lista mostrada |
| Lista vazia (fictício) | `vazio` | “Nenhum registro encontrado”, `role="status"` |
| 404 (fictício) | `erro` | “Não encontramos…”, **sem** “Tentar novamente”, `role="alert"` |
| 500 (fictício) | `erro` | Mensagem segura + “Tentar novamente” |
| API configurada, sem servidor rodando (real) | `erro` | “Não foi possível conectar…” + “Tentar novamente”; o botão dispara uma nova requisição |
| Troca rápida de cenário | `sucesso` | A resposta antiga (vazia) não sobrescreveu a nova |

Também conferidos: “Não informado pela fonte” para campo nulo, “Informação não verificada” e os dois avisos de desatualizado.
