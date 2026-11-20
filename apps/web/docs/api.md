# Cliente da API (FE-08)

Responsável: Victor. Atualizado em 18/11/2026.

Todo acesso à API Java passa por [`src/services/api/`](../src/services/api/). Nenhum componente chama `fetch` direto.

| Arquivo | O que faz |
|---|---|
| `client.js` | URL base, query string, timeout, cancelamento e erros normalizados (`requisitar`, `ErroApi`, `TIPOS_ERRO`) |
| `servicos.js` | `listarServicos()` → `GET /api/servicos`; `obterServico(id)` → `GET /api/servicos/{id}` |
| `regioes.js` | `listarRegioes()` → `GET /api/regioes`; `obterRegiao(id)` → `GET /api/regioes/{id}` |
| `unidades.js` | `listarUnidades({ servicoId, regiaoId, bairro, acessibilidade, pagina, tamanho })` → `GET /api/unidades`; `obterUnidade(id)` → `GET /api/unidades/{id}` |

**Contrato confirmado em 16–18/11** (D-04): a API Java do Raphael está publicada em `https://vias-dfwu.onrender.com` (Swagger em `/swagger-ui.html`). Os formatos de cada resposta estão comentados em cada módulo. A lista de unidades é paginada (`pagina` começa em 0, `tamanho` vai de 1 a 100) e os erros vêm como `{ timestamp, status, erro, mensagem, caminho, campos }`.

**Limite de tempo de 3 min:** a API roda no plano gratuito do Render, que “dorme” sem uso; a primeira consulta levou cerca de 90 s em 18/11. Depois de 5 s de espera, as telas mostram o `AvisoDemora` (“a primeira consulta pode levar até 3 minutos”). **Antes de apresentar, abra o app uma vez para acordar a API.**

**Fora do cliente por enquanto:**
- `GET /api/gestao/resumo`: entra no FE-20, junto com os indicadores.
- Rota: não há endpoint definido (D-05). O navegador nunca chama o serviço Python.
- `POST`, `PUT` e `DELETE` de unidades: são do CRUD acadêmico do Java; a interface não usa.

## Configuração

```bash
# apps/web/.env.local (não vai para o Git)
NEXT_PUBLIC_API_URL=https://vias-dfwu.onrender.com/api   # API publicada
# NEXT_PUBLIC_API_URL=http://localhost:8080/api          # API rodando na sua máquina
```

A variável é pública: ela é embutida no JavaScript do navegador no build. **Nunca coloque senha, token ou chave nela.** Sem a variável, ou com um valor que não comece com `http://` ou `https://`, o cliente lança `ErroApi` do tipo `CONFIGURACAO`.

Para o navegador conseguir chamar a API, o Raphael precisa liberar a origem do app no CORS do Java (por exemplo, `http://localhost:3000` em desenvolvimento). Sem isso, a chamada falha como erro de **rede**.

## Uso

```js
import { listarUnidades } from "@/services/api/unidades";
import { TIPOS_ERRO } from "@/services/api/client";

const controle = new AbortController();
try {
  const resposta = await listarUnidades({ servicoId: "...", signal: controle.signal });
  // resposta = JSON da API; lista vazia é sucesso, não erro
} catch (erro) {
  if (erro.tipo === TIPOS_ERRO.CANCELADO) return; // uma busca mais nova tomou o lugar
  // mostrar erro.mensagem; oferecer "Tentar novamente" se erro.podeTentarDeNovo
}

// Em uma nova busca, cancele a anterior:
controle.abort();
```

## Erros

Toda falha vira um `ErroApi` com `tipo`, `status`, `mensagem` (segura para a tela), `detalhe` (só para log; pode ser técnico) e `caminho`.

| `tipo` | Quando | Mensagem para a tela | “Tentar novamente”? |
|---|---|---|---|
| `REDE` | API fora do ar, sem internet, CORS bloqueado | “Não foi possível conectar ao serviço do VIAS…” | Sim |
| `TIMEOUT` | Mais de 3 min sem resposta (`TIMEOUT_PADRAO_MS`) | “O serviço do VIAS demorou mais de 3 minutos para responder…” | Sim |
| `HTTP` 400 | Filtro ou dado recusado | “Algum dado da busca não foi aceito. Revise os filtros…” | Não |
| `HTTP` 404 | Recurso inexistente | “Não encontramos o que você procurou.” | Não |
| `HTTP` 5xx e outros | Erro no servidor | “O serviço do VIAS encontrou um problema…” | Sim (5xx) |
| `RESPOSTA_INVALIDA` | 2xx com corpo que não é JSON | “…respondeu em um formato inesperado.” | Não |
| `CANCELADO` | O próprio app cancelou (nova busca) | — a tela deve ignorar | — |
| `CONFIGURACAO` | `NEXT_PUBLIC_API_URL` ausente ou inválida | “O endereço do serviço do VIAS não está configurado.” | Não |

Regras:
- **Erro nunca vira lista vazia.** `200` com `items: []` é sucesso (estado vazio); qualquer `ErroApi` é falha.
- **Sem repetição automática.** Quem repete é a pessoa, pelo botão. `POST`, `PUT` e `DELETE` nunca são repetidos.
- **Sem stack trace na tela.** A mensagem do backend fica em `detalhe`; a tela mostra `mensagem`.
- O formato de erro do backend (`timestamp`, `status`, `error`, `message`, `path`) vem do Alinhamento §5.4 e ainda precisa de confirmação.

## Verificação feita em 14/11

Um script de teste local (fora do repositório) subiu um servidor HTTP com respostas fictícias e exercitou o `client.js`. Os 15 casos passaram:
200 com dados, 200 com lista vazia (sucesso), 204, filtros vazios fora da URL (o `0` é mantido), 404 com mensagem amigável e detalhe do backend, 400, 500 sem vazar stack trace, 200 com HTML, timeout, cancelamento (distinto de timeout), API fora do ar, variável ausente, protocolo inválido, barra final da URL base e id com caracteres especiais.

Esses casos viram testes automatizados (Jest) no FE-23.
