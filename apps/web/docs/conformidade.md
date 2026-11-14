# Conformidade acadêmica do Front-end (FE-01)

Responsável: Victor. Atualizado em 14/11/2026.

## Base

- **Fonte oficial:** enunciado *GS CitizenTech – Engenharia de Software, 2º ano de Fev – FIAP 2026* (PDF de 37 páginas, aberto em 04/11/2026).
- **Não existe disciplina nem rubrica de Front-end** nesse enunciado. As 7 disciplinas são Agile, AR-VR, Data Science, Database Design, DDD-Java, Dynamic Programming e Network. O grupo confirmou essa leitura. Por isso esta tabela **não cria critérios nem pesos de “Front-end”**: ela só lista o que as outras entregas pedem e depende da interface.
- O enunciado cita a interface no desafio do curso: *“Página web, script em Python e circuito no simulador, cada um fazendo bem a sua parte”* (p. 17).
- **Prazo oficial:** 19/11/2026 às 23h55, no Teams ou Portal do Aluno de cada disciplina, com um envio por equipe. **Prazo interno do grupo:** 18/11/2026 (Alinhamento Técnico). Ver [decisoes.md](decisoes.md), item D-06.

## Rastreabilidade: requisito → cartão → evidência

Status possíveis: `Pendente` (sem evidência), `Em andamento`, `Atendido` (com link para a evidência). Nada está marcado como atendido ainda.

| # | Requisito (texto do enunciado, resumido) | Disciplina / origem | Peso oficial | Cartões | Evidência esperada do Front-end | Quem monta a entrega | Status |
|---|---|---|---|---|---|---|---|
| R1 | “Protótipos das telas envolvidas com o Front-end”, no mesmo item da tabela de endpoints e do DER | DDD-Java, PDF único | 10 pts para o item inteiro (protótipos + endpoints + DER) | FE-03, FE-11, FE-12, FE-13, FE-26 | Capturas das telas de busca, resultados e detalhe, em mobile e desktop, com o nome de cada tela | Raphael (PDF de DDD-Java) | Pendente |
| R2 | “Protótipo (podem ser esboços) de no mínimo 3 telas com comentários sobre a intenção e adequação da UX proposta” | Agile, PDF único | 20 pts | FE-03, FE-06 a FE-13, FE-22, FE-26 | 3 ou mais capturas + comentário de UX por tela (público, acessibilidade, estados de dado ausente) | A definir (D-08) | Pendente |
| R3 | “Video Pitch com duração máxima de 3 minutos … com narração feita por elemento(s) do grupo” | Agile | 20 pts | FE-24, FE-26 | Fluxo busca → resultados → detalhe funcionando, para gravar | A definir (D-08) | Pendente |
| R4 | “Pitch: em Testing, vídeo de até 3 minutos no YouTube, com a solução e as entregas que mais somaram” | Regras da GS | Não informado | FE-24, FE-26 | Mesmo material do R3, se o grupo usar um vídeo só | A definir (D-08) | Pendente |
| R5 | “Registrem os prompts em um arquivo prompts.md e saibam explicar cada linha” | Combinados da equipe (todas) | Não informado | FE-26 | `apps/web/prompts.md` com os prompts usados no Front-end | Victor | Pendente |
| R6 | Ficha da CitizenTech “no início do README do repositório” | Combinados da equipe (todas) | Não informado | FE-26 | Campo “O que cada parte faz” preenchido para o Front-end; a ficha fica no README raiz | Grupo (README raiz) | Pendente |
| R7 | “README claro, uma pasta para cada parte e nomes que façam sentido” | Combinados da equipe | Não informado | FE-05, FE-26 | `apps/web/README.md` com instalação, variáveis e comandos | Victor | Pendente |
| R8 | “Letras legíveis, bom contraste, linguagem simples e telas pequenas” | Combinados da equipe | Não informado | FE-04, FE-07, FE-22 | Checklist de contraste, teclado e mobile do FE-22 | Victor | Pendente |
| R9 | “Nada de dados pessoais reais. Usem dados simulados ou públicos, e digam de onde vieram” | Combinados da equipe | Não informado | FE-16, FE-13, FE-25 | Fonte e data visíveis na tela; fixtures só em `tests/`, rotuladas; nenhuma localização pessoal salva | Victor | Pendente |
| R10 | Commits feitos depois da entrega “não serão aceitos e consequentemente isso zera a nota da parte técnica totalmente” | DDD-Java (link do GitHub) | Zera 70 pts da parte técnica | Todos | **Nenhum commit ou push no repositório depois de 19/11 às 23h55**, porque o Front-end está no mesmo monorepo da API | Todos | Regra ativa |
| R11 | “Cada integrante participa e sabe explicar o projeto inteiro” | Combinados da equipe | Não informado | FE-03, FE-26 | `sitemap.md` e README explicam as telas para os outros integrantes | Victor | Pendente |

## Diretrizes do grupo (não oficiais)

Itens do **Alinhamento Técnico do MVP (13/11)**, §11 “Front-end / produto”. Não são critérios da FIAP, mas o grupo combinou cumpri-los:

| Diretriz | Cartões | Status |
|---|---|---|
| Interface funcional do fluxo prioritário (busca, resultados, detalhe; rota se integrada) | FE-10 a FE-13, FE-17 a FE-19 | Pendente |
| Integração com a API Java | FE-08, FE-10 a FE-13 | Pendente |
| Estados de carregamento, erro e vazio | FE-09 | Pendente |
| Instruções de execução e link do repositório | FE-05, FE-26 | Pendente |

## O que não entra aqui

- **AR-VR, Data Science, Database Design, Dynamic Programming e Network** não pedem nada da interface. A página com a Ficha que a disciplina de Network pede é servida pelo servidor do Packet Tracer, não por este app.
- **Deploy do Front-end:** nenhuma disciplina exige. O deploy exigido em DDD-Java é o da API Java.
