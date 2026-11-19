# App web do cidadão (Next.js)

Responsável: Victor.

Aplicação principal do VIAS: o cidadão escolhe o serviço de saúde de que precisa, vê as unidades que o oferecem e abre o detalhe de cada uma. Ela só conversa com a API Java; não acessa o Oracle, o serviço Python nem fontes externas diretamente.

Stack: **Next.js 16 (App Router) + React 19 + JavaScript + Tailwind CSS 4**. Não usamos TypeScript.

## Rodar em desenvolvimento

Node 20.9 ou mais recente (testado no 22). A partir desta pasta (`apps/web`):

```bash
npm install
cp .env.example .env.local   # no PowerShell: Copy-Item .env.example .env.local
npm run dev
```

Abra <http://localhost:3000>.

## Comandos

| Comando | O que faz |
|---|---|
| `npm run dev` | Servidor de desenvolvimento na porta 3000 |
| `npm run build` | Build de produção |
| `npm run start` | Sobe o build de produção |
| `npm run lint` | ESLint |
| `npm test` | Testes automatizados (Jest + React Testing Library) |

## Variáveis de ambiente

| Variável | Para quê | Exemplo |
|---|---|---|
| `NEXT_PUBLIC_API_URL` | URL base da API Java, com o prefixo `/api` | `http://localhost:8080/api` |

Variáveis `NEXT_PUBLIC_` vão para o JavaScript do navegador. Nunca coloque segredo nelas.

## Organização

```
apps/web/
├── docs/                  # planejamento e decisões (ver lista abaixo)
├── public/brand/          # wordmark do VIAS (o mesmo da landing)
├── src/
│   ├── app/               # rotas do App Router (dev/ só existe em desenvolvimento)
│   ├── components/
│   │   ├── decor/         # ilustrações decorativas (aria-hidden)
│   │   ├── estados/       # carregando, erro, vazio, ausente, desatualizado
│   │   ├── layout/        # cabeçalho e rodapé
│   │   └── ui/            # botões, campos, etapas, selos, alertas…
│   ├── hooks/             # useConsulta
│   ├── lib/               # formatação, telas, utilitários
│   └── services/api/      # cliente único da API Java
└── tests/                 # Jest; fixtures fictícias em tests/fixtures
```

Vitrine de componentes (só em desenvolvimento): <http://localhost:3000/dev/componentes>.

## Documentação

- [Conformidade acadêmica](docs/conformidade.md): o que cada disciplina pede da interface
- [Sitemap e fluxo](docs/sitemap.md): páginas, navegação e estados
- [Referências de UI](docs/referencias-ui.md): telas de referência e o que depende de contrato
- [Tokens visuais](docs/tokens.md): cores, fontes e contraste medido
- [Componentes](docs/componentes.md): catálogo e regras de acessibilidade
- [Cliente da API](docs/api.md): uso e tabela de erros
- [Estados de consulta](docs/estados.md): carregando, erro, vazio, ausente
- [Testes](docs/testes.md): o que está coberto e como rodar

## Situação

Em construção. O que já existe e o que falta está no quadro do Trello do Front-end (cartões FE-01 a FE-26).
