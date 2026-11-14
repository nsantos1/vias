# Testes automatizados (FE-23)

Responsável: Victor. Atualizado em 14/11/2026.

**Ferramentas:** Jest 30 + React Testing Library 16 + `@testing-library/user-event`, configurados com `next/jest` (usa o compilador do próprio Next). A escolha segue o padrão “Jest” do README do monorepo.

```bash
cd apps/web
npm test                 # roda tudo
npx jest --verbose       # mostra cada caso
npx jest tests/hooks     # só uma pasta
```

## O que está coberto (68 casos, todos passando em 14/11)

| Arquivo | O que garante |
|---|---|
| `tests/services/client.test.js` | Cliente da API contra um servidor HTTP local de teste: 200, lista vazia como sucesso, 204, filtros vazios fora da URL, 404/400/500 com mensagem segura e sem stack trace, resposta HTML, timeout, cancelamento (diferente de timeout), API fora do ar, variável de ambiente ausente ou inválida |
| `tests/services/unidades.test.js` | `listarServicos`, `listarRegioes`, `listarUnidades` e `obterUnidade` chamam os caminhos propostos e só repassam os filtros previstos |
| `tests/hooks/useConsulta.test.js` | Carregando → sucesso; **lista vazia vira VAZIO e falha vira ERRO** (nunca o contrário); inativo não consulta; troca de chave cancela a anterior e **a resposta antiga não vence**; cancelamento não vira erro; “Tentar novamente” repete |
| `tests/components/estados.test.js` | **Ausência nunca vira negação** (`null`, vazio, espaços e lista vazia → “Não informado pela fonte”; `0` é valor); erro com e sem “Tentar novamente”; erro inesperado sem detalhe técnico; `EstadoConsulta` escolhe o estado certo; aviso de desatualizado só quando a API indica |
| `tests/components/ui.test.js` | Botão carregando (`aria-busy`, desabilitado, anuncia), `type="button"` por padrão, link; campo com rótulo, dica e erro ligados (`aria-describedby`, `aria-invalid`); limpar devolve o foco; seleção só com as opções recebidas; chip com nome acessível; etapas com `aria-current="step"`, “(concluída)” e “em breve” |
| `tests/lib/formatos.test.js` | Data `AAAA-MM-DD` sem voltar um dia pelo fuso; data ausente ou inválida devolve `null`; rótulos do cabeçalho por tela |

## Fixtures

Ficam em [`tests/fixtures/`](../tests/fixtures/) e são **fictícias**: ids e nomes começam com `ficticio`/`Fictício`. Nunca são importadas por `src/` nem aparecem na demonstração.

## O que ainda não está coberto

- **Telas integradas** (busca, resultados, detalhe): entram junto com o FE-10 a FE-13, quando a API existir.
- **Fluxo completo no navegador (E2E):** FE-24, com Playwright, depende da API em ambiente acessível.
- **Acessibilidade automática (axe) e contraste:** parte do FE-22. O contraste já foi medido à mão ([tokens.md](tokens.md)).
