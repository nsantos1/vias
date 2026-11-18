# Testes automatizados (FE-23)

Responsável: Victor. Atualizado em 14/11/2026.

**Ferramentas:** Jest 30 + React Testing Library 16 + `@testing-library/user-event`, configurados com `next/jest` (usa o compilador do próprio Next). A escolha segue o padrão “Jest” do README do monorepo.

```bash
cd apps/web
npm test                 # roda tudo
npx jest --verbose       # mostra cada caso
npx jest tests/hooks     # só uma pasta
```

## O que está coberto (112 casos, todos passando em 18/11)

| Arquivo | O que garante |
|---|---|
| `tests/services/client.test.js` | Cliente da API contra um servidor HTTP local de teste: 200, lista vazia como sucesso, 204, filtros vazios fora da URL, 404/400/500 com mensagem segura e sem stack trace, resposta HTML, timeout, cancelamento (diferente de timeout), API fora do ar, variável de ambiente ausente ou inválida |
| `tests/services/unidades.test.js` | `listarServicos`, `listarRegioes`, `listarUnidades`, `obterUnidade` chamam as rotas da API Java; `listarTodasUnidadesDoServico` junta as páginas e avisa quando a lista é cortada |
| `tests/hooks/useConsulta.test.js` | Carregando → sucesso; **lista vazia vira VAZIO e falha vira ERRO** (nunca o contrário); inativo não consulta; troca de chave cancela a anterior e **a resposta antiga não vence**; cancelamento não vira erro; “Tentar novamente” repete |
| `tests/components/estados.test.js` | **Ausência nunca vira negação** (`null`, vazio, espaços e lista vazia → “Não informado pela fonte”; `0` é valor); erro com e sem “Tentar novamente”; erro inesperado sem detalhe técnico; `EstadoConsulta` escolhe o estado certo; aviso de desatualizado só quando a API indica |
| `tests/components/ui.test.js` | Botão carregando (`aria-busy`, desabilitado, anuncia), `type="button"` por padrão, link; campo com rótulo, dica e erro ligados (`aria-describedby`, `aria-invalid`); limpar devolve o foco; seleção só com as opções recebidas; chip com nome acessível; etapas com `aria-current="step"`, “(concluída)” e “em breve” |
| `tests/lib/formatos.test.js` | Data `AAAA-MM-DD` sem voltar um dia pelo fuso; data ausente ou inválida devolve `null`; rótulos do cabeçalho por tela |
| `tests/lib/unidade.test.js` | Textos de acessibilidade e de SUS a partir do enum da API; telefone, CEP e endereço só com o que a fonte informou; link do app de mapas (coordenadas → endereço → sem botão) |
| `tests/components/aviso-demora.test.js` | Aviso de espera longa só depois de 5 s e anunciado no `status`; limite de tempo do cliente cobre o despertar do Render |
| `tests/lib/distancia.test.js` | Distância em linha reta; mais próxima primeiro e unidades sem coordenadas no fim; **sem localização, ordem alfabética e nenhuma distância**; formato “≈ 250 m” / “≈ 1,3 km” |
| `tests/hooks/useLocalizacao.test.js` | Localização permitida, negada, indisponível e com erro, **sem origem inventada**; “Usar minha localização” pede de novo |
| `tests/lib/catalogo.test.js` | Busca no catálogo sem acento, por nome e descrição; **termo sem correspondência não vira sinônimo**; ordem e grupos por categoria (D-19) |
| `tests/components/formulario-busca.test.js` | Com `categoria`: grupos “Exames / Especialidades / Atendimento” e teclado percorrendo os grupos; sem `categoria`: lista simples; texto sem correspondência avisa e não busca; a busca leva o id real |

## Fixtures

Ficam em [`tests/fixtures/`](../tests/fixtures/) e são **fictícias**: ids e nomes começam com `ficticio`/`Fictício`. Nunca são importadas por `src/` nem aparecem na demonstração.

## O que ainda não está coberto

- **Telas integradas** (busca, resultados, detalhe): verificadas à mão contra a API do Render em 18/11. Busca “Centro cirúrgico” → 147 unidades. Sem localização: aviso e ordem alfabética. Com uma localização de teste na Av. Paulista: Hosp 9 de Julho em destaque (≈ 200 m), seguido de Sírio-Libanês (≈ 550 m). Detalhe completo com avisos e botão de mapa, também em 375 px. Ainda sem teste automatizado.
- **Fluxo completo no navegador (E2E):** FE-24, com Playwright. A API já está acessível; falta escrever.
- **Acessibilidade automática (axe) e contraste:** parte do FE-22. O contraste já foi medido à mão ([tokens.md](tokens.md)).
