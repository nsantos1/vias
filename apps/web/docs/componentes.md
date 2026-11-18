# Componentes de interface (FE-07)

Responsável: Victor. Atualizado em 14/11/2026.

Componentes em [`src/components/ui/`](../src/components/ui/). Usam os tokens de [tokens.md](tokens.md).

**Vitrine:** `npm run dev` e abra <http://localhost:3000/dev/componentes>. A vitrine mostra todos os estados e só existe em desenvolvimento: no build de produção a rota responde 404. Os textos dela são exemplos de interface, não dados do VIAS.

## Regras que valem para todos

- **Significado nunca só na cor:** erro, aviso e estado sempre têm texto; o ícone só reforça e é `aria-hidden`.
- **Área de toque:** botões, campos e chips removíveis têm no mínimo 44px de altura (`min-h-11`).
- **Foco visível:** contorno de 3px em `pinho`, definido em `globals.css`, em todo elemento focado pelo teclado.
- **Rótulo visível:** todo campo tem `<label>`; placeholder não substitui rótulo.
- **Sem dados inventados:** listas de opções (`SelectField`) recebem só o que a API devolve.

## Catálogo

| Componente | Arquivo | Props principais | Acessibilidade |
|---|---|---|---|
| `Button` | `Button.js` | `variante` (`primario`, `secundario`, `discreto`, `perigo`), `carregando`, `disabled`, `largo`, `seta`, `href`, `type` | `carregando` desabilita, marca `aria-busy` e anuncia “carregando”; o texto do botão continua visível. `largo` ocupa a largura toda (ação principal); `seta` põe “→” decorativa. Com `href`, vira link do Next com a mesma aparência |
| `TextField` | `Field.js` | `rotulo`, `dica`, `erro`, `obrigatorio`, `icone`, `aoLimpar`, `destaque`, demais props do `<input>` | `label` ligado por `htmlFor`; dica e erro em `aria-describedby`; `aria-invalid` quando há erro; “(obrigatório)” por escrito. `aoLimpar` mostra o botão “Limpar campo” e devolve o foco ao campo depois de limpar |
| `Etapas` | `Etapas.js` | `atual` (1 a 3), `percursoDisponivel` | “ETAPA N DE 3”. Etapa atual com `aria-current="step"`; concluídas anunciam “(concluída)”; Percurso aparece “em breve” enquanto a rota não existir (R-01) |
| `SelectField` | `Field.js` | `rotulo`, `opcoes` (`[{ valor, rotulo }]`), `textoVazio`, `dica`, `erro`, `obrigatorio` | `<select>` nativo: funciona com teclado, leitor de tela e seletor do celular sem código extra |
| `Chip` | `Chip.js` | `children`, `aoRemover`, `rotuloRemover` | Com `aoRemover`, vira botão com nome “Remover filtro: …”. Sem ele, é só texto |
| `Badge` | `Badge.js` | `tom` (`neutro`, `marca`, `info`, `aviso`, `erro`), `comIcone` | Texto obrigatório; base dos selos de acessibilidade e proveniência do FE-16 |
| `Alert` | `Alert.js` | `tom` (`info`, `aviso`, `erro`), `titulo`, `acao` | `erro` usa `role="alert"` (anuncia na hora); `info` e `aviso` usam `role="status"` |
| `Skeleton` | `Skeleton.js` | `className` (tamanho) | `aria-hidden`. Quem usa envolve num `role="status"` com texto “Carregando…” (padronizado no FE-09) |
| `EmptyState` | `EmptyState.js` | `titulo`, `acao` | Para consulta **bem-sucedida** sem resultado. Falha de rede ou de API usa `Alert tom="erro"`, nunca este componente |
| `Icon`, `Spinner` | `Icon.js` | `nome` (`info`, `aviso`, `erro`, `fechar`, `busca`, `vazio`) | Sempre decorativos (`aria-hidden`) |

Utilitário: [`src/lib/cn.js`](../src/lib/cn.js) junta classes CSS ignorando valores vazios.

### Layout e decoração (referências de UI)

| Componente | Arquivo | O que faz |
|---|---|---|
| `SiteHeader` / `CabecalhoTela` | `components/layout/` | “[Voltar] VIAS │ RÓTULO DA TELA”. O rótulo e o destino do voltar vêm de [`src/lib/telas.js`](../src/lib/telas.js). O voltar usa o histórico (preserva os filtros); sem histórico, vai para a tela anterior do fluxo |
| `SiteFooter` | `components/layout/` | Rodapé escuro como o da landing, com a onda verde e o link “Sobre o VIAS” |
| `MapaDecorativo` | `components/decor/` | Ruas estilizadas, traço e pin. `aria-hidden`, **só na tela de busca** (R-03); não representa lugar nenhum |
| `OndaRodape` | `components/decor/` | Onda verde entre o conteúdo e o rodapé. `aria-hidden` |

## Contraste das combinações novas

Além das medições em [tokens.md](tokens.md):

| Combinação | Razão |
|---|---|
| `papel` sobre `pinho-escuro` (hover do botão principal) | 13,91 |
| `grafite` sobre `aviso-fundo` (corpo do alerta de aviso) | 13,43 |
| `grafite` sobre `erro-fundo` (corpo do alerta de erro) | 13,18 |
| branco sobre `erro` (botão de perigo) | 7,36 |
| borda `erro` sobre `superficie` (campo com erro) | 7,36 |
| `rodape-texto` sobre `rodape` (texto do rodapé) | 9,90 |
| `papel` sobre `rodape` | 12,62 |
| `lima` sobre `rodape` (link “Sobre o VIAS”) | 10,95 |

Tokens novos, todos vindos da landing:
- `pinho-escuro` (`#0B2C25`, `--color-ref-secundario`): hover do botão principal.
- `rodape` (`#0D342C`, `--color-ref-rodape-09`) e `rodape-texto` (`#D6DED7`, `--color-ref-rodape-texto-09`): rodapé escuro. No rodapé, o contorno de foco é `lima`, porque `pinho` não aparece sobre fundo escuro.

## Cuidados para quem usar os componentes

- **Foco depois de remover um chip:** quando o chip some, o foco do teclado se perde. A tela que usa os chips (FE-12) deve mover o foco para o próximo chip ou para o título dos filtros.
- **Foco depois de erro no envio:** os campos mostram o erro, mas quem leva o foco ao primeiro campo inválido é o formulário (FE-11).

## Fora deste cartão

- **Busca com autocomplete (combobox):** fica para o FE-11, porque depende de como o catálogo da API funciona.
- **Toast:** não há uso previsto no P0.
- **Testes automatizados:** ficam no FE-23 (Jest + React Testing Library). Neste cartão, a verificação foi feita na vitrine pelo navegador.
