# Tokens visuais (FE-04)

Responsável: Victor. Atualizado em 14/11/2026.

## De onde vieram

- **Fonte:** a landing publicada, <https://vias-viainteligentedeacessoasaude.vercel.app>, inspecionada em 14/11/2026. Os valores vêm das variáveis CSS que a landing usa e dos estilos aplicados às páginas.
- **O repositório da landing não foi inspecionado**, só o site publicado. Se o código-fonte tiver valores diferentes, o código-fonte vale e esta página deve ser atualizada.
- Os nomes das cores são **os mesmos da landing** (`pinho`, `papel`, `grafite`…), para os dois projetos falarem a mesma língua.
- As cores de referência do documento de contexto (§7.2) foram substituídas pelas da landing quando diferiam: texto `#1F2A27` → `#1A2925`, texto secundário `#5E6B67` → `#5B6D66`, borda `#DDE4E0` → `#D5DED7`. Marca `#123B35` e fundo `#F6F7F1` batem com o documento.
- A landing tem cerca de 100 cores `--color-ref-*` usadas só nas ilustrações. **Não foram copiadas.**

Implementação: [`src/app/globals.css`](../src/app/globals.css) (bloco `@theme` do Tailwind 4) e [`src/app/layout.js`](../src/app/layout.js) (fontes).

## Cores

| Token Tailwind | Valor | Origem | Uso |
|---|---|---|---|
| `pinho` | `#123B35` | Landing | Marca, botão principal, títulos, foco |
| `papel` | `#F6F7F1` | Landing | Fundo da página; texto sobre `pinho` |
| `grafite` | `#1A2925` | Landing | Texto principal |
| `salvia` | `#5B6D66` | Landing | Texto secundário e metadados (fonte, data) |
| `linha` | `#D5DED7` | Landing | Divisores decorativos |
| `nevoa` | `#E9EFE7` | Landing | Fundo de destaque suave, avisos informativos |
| `lima` | `#D7F36A` | Landing | Acento. **Só como fundo**, com texto `pinho` |
| `rota` | `#2D7C60` | Landing | Linha e realces de rota (quando houver geometria) |
| `superficie` | `#FFFFFF` | Documento §7.2 | Cards, campos e painéis |
| `borda-campo` | `#7D8C86` | **Proposta do Front-end** | Borda de campos e controles |
| `erro` / `erro-fundo` | `#A3261F` / `#FBECEA` | **Proposta do Front-end** | Mensagens de erro |
| `aviso` / `aviso-fundo` | `#7A5300` / `#FBF1D4` | **Proposta do Front-end** | Dado desatualizado, demonstração, atenção |

Exemplos de uso: `bg-pinho text-papel`, `text-salvia`, `border-borda-campo`, `bg-erro-fundo text-erro`.

## Contraste medido (WCAG 2.2)

Razões calculadas pela fórmula de luminância relativa da WCAG. AA exige 4,5:1 para texto normal e 3:1 para texto grande e bordas de controles.

| Texto / elemento | Fundo | Razão | Resultado |
|---|---|---|---|
| `grafite` | `papel` | 14,05 | AA texto |
| `grafite` | `superficie` | 15,13 | AA texto |
| `salvia` | `papel` | 5,10 | AA texto |
| `salvia` | `superficie` | 5,49 | AA texto |
| `salvia` | `nevoa` | 4,70 | AA texto |
| `pinho` | `papel` | 11,45 | AA texto |
| `papel` (botão) | `pinho` | 11,45 | AA texto |
| `pinho` | `lima` | 9,94 | AA texto |
| `rota` | `papel` | 4,68 | AA texto |
| `erro` | `erro-fundo` | 6,41 | AA texto |
| `erro` | `papel` | 6,83 | AA texto |
| `aviso` | `aviso-fundo` | 6,08 | AA texto |
| `borda-campo` | `papel` | 3,27 | AA bordas de controle |
| `borda-campo` | `superficie` | 3,52 | AA bordas de controle |
| `linha` | `papel` | 1,28 | **Falha.** Só para divisor decorativo, nunca para borda de campo |
| `lima` | `papel` | 1,15 | **Falha.** Nunca usar `lima` como cor de texto ou borda |

## Tipografia

| Token | Família | Pesos | Uso |
|---|---|---|---|
| `font-sans` (padrão) | Inter | variável | Texto corrido, botões, campos |
| `font-display` | Space Grotesk | 600, 700 | Títulos (`h1`–`h3`) |
| `font-mono` | IBM Plex Mono | 400, 500 | Rótulos curtos, como na landing. Nunca em texto corrido |

As três famílias são carregadas por `next/font/google` (Google Fonts, licença SIL Open Font License) e servidas pelo próprio app, sem chamar o Google no navegador.

Escalas trazidas da landing:
- `text-label`: 0,75rem, espaçamento 0,18em (rótulo em mono, caixa alta).
- `text-lead`: de 17 a 21px conforme a largura da tela.

Os títulos gigantes da landing (até 88px) **não** foram trazidos: o app é uma ferramenta, não uma página de apresentação.

## Formas e comportamento

- Botões em pílula (`rounded-pill`, 999px), como os da landing.
- Foco: contorno de 3px em `pinho`, afastado 2px, em todo elemento focado pelo teclado.
- `prefers-reduced-motion`: animações e transições são desligadas.
- Tema escuro: **não há**, porque a landing também não tem. O tema escuro do modelo do Next.js foi removido.

## Logo e ícone

| Arquivo | Origem | Uso |
|---|---|---|
| [`public/brand/vias-wordmark.svg`](../public/brand/vias-wordmark.svg) | Wordmark do cabeçalho da landing (viewBox 1042×260). Extraído do HTML publicado; só o desenho foi mantido, sem scripts nem estilos | Cabeçalho do app (FE-06). Usa `currentColor`, então a cor vem do CSS |
| [`src/app/icon.svg`](../src/app/icon.svg) | `icon.svg` da landing | Ícone da aba do navegador. Substitui o `favicon.ico` do modelo do Next.js |

Os arquivos `vias-footer.svg` e `vias-logo.png` da pasta Downloads **não** foram usados: a landing publicada usa o wordmark acima no cabeçalho e no rodapé.

## Pendências

- [ ] Grupo aprova as cores de estado (`erro`, `aviso`) e a `borda-campo`, que não existem na landing.
- [ ] Conferir os tokens no repositório da landing, se for compartilhado (D-11).
