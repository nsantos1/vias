# Decisões pendentes do Front-end

Divergências e contratos que o Front-end **não resolve sozinho**. Cada item segue o formato do Alinhamento Técnico: item, problema, proposta e responsável. Quando a decisão sair, registrar a data, quem decidiu e o resultado.

## Atualização de 18/11/2026 — API Java publicada

O Raphael publicou a API (branch `backend-java`, rodando em `https://vias-dfwu.onrender.com`). Conferido no Swagger e nos DTOs Java:

| ID | Resultado |
|---|---|
| D-02 | **Resolvido:** enum `ACESSIVEL / NAO_ACESSIVEL / NAO_INFORMADO / NAO_VERIFICADO`. No detalhe vem `{ status, fonte, dataVerificacao }`; `ACESSIVEL` e `NAO_ACESSIVEL` exigem fonte e data |
| D-03 | **Resolvido:** objeto `proveniencia` (`fonte`, `nomeFonte`, `url`, `oficial`, `dataReferencia`, `dataCarga`, `dataAtualizacao`). Sem `dadosDemonstrativos` |
| D-04 | **Resolvido:** 12 rotas disponíveis; o front usa só os GET de serviços, regiões e unidades. Lista paginada (`pagina` começa em 0, `tamanho` de 1 a 100). Erro: `{ timestamp, status, erro, mensagem, caminho, campos }`. CORS libera `http://localhost:3000`; outras origens via `CORS_ORIGENS` no Render |
| D-09 | **Resolvido:** município de São Paulo, dados reais do CNES (API DEMAS), 1.092 unidades. Região = bairro do cadastro |
| D-12 | **Parcial:** a API traz `atendeSus` (`SIM / NAO / NAO_INFORMADO`), o indicador do próprio CNES. O app **mostra** esse dado no card e no detalhe, mas **não oferece filtro** SUS/plano: não há fonte de rede credenciada de planos |
| D-13 | **Resolvido:** sem “Parcial”. Textos: “Acessível (verificado)”, “Não acessível (verificado)”, “Informação não verificada” e “Não informado pela fonte” (`src/lib/unidade.js`) |
| D-15 | **Resolvido:** a API não expõe equipamentos; o detalhe mostra só os serviços do cadastro |
| D-16 | **Implementado** no detalhe da unidade |
| D-18 | **Decidido pelo Victor (18/11):** o local da pessoa vem da localização do aparelho, sem escolha manual de região. Ver abaixo |
| D-19 | **Testado no Oracle da FIAP, aguardando deploy:** migrations V5 (exames e serviços especializados) e V6 (especialidades dos profissionais) do CNES/DATASUS, 83 itens no catálogo, e campo `categoria` na API, na branch `feat/api-exames-especialidades`. Falta o Raphael revisar, testar no Oracle e publicar. Ver abaixo |
| D-20 | **Implementado (18/11), falta configurar as chaves e publicar:** percurso de transporte público até a unidade, com hora sugerida de saída e ônibus acessíveis ao vivo (Google Routes + SPTrans Olho Vivo). Substitui D-05, D-14 e D-17 para o MVP. Ver abaixo |

### D-18 — Unidades mais próximas pela localização do aparelho

- **Decisão (Victor, 18/11):** a busca lista as unidades que oferecem o serviço **ordenadas pela proximidade** da pessoa, usando a localização do aparelho. Não há escolha manual de bairro (o seletor de região colocado nesse mesmo dia foi retirado).
- **Como funciona:** a API não aceita localização. O navegador busca **todas** as unidades do serviço (`GET /api/unidades?servicoId=…&tamanho=100`, juntando as páginas) e calcula a distância **em linha reta** (Haversine) até cada unidade com coordenadas na fonte. A tela sempre escreve “em linha reta”: não é caminho nem tempo de deslocamento.
- **Privacidade:** a localização só é pedida quando a pessoa faz a busca, e a tela de busca avisa antes. Ela fica na memória da tela: **não vai para a API, para a URL, para logs nem para o armazenamento do navegador**.
- **Sem localização** (negada, indisponível ou demorou): o app não inventa origem. Mostra a lista em ordem alfabética, diz que ela não está ordenada por proximidade e oferece “Usar minha localização”.
- **Unidades sem coordenadas** vão para o fim da lista, com “Sem coordenadas na fonte”.
- **Possível evolução (Raphael):** um parâmetro `lat`/`lon` com ordenação no Oracle Spatial evitaria baixar todas as unidades do serviço. Como a localização iria para o servidor, isso exige combinar a política de logs antes.

### D-20 — Percurso de transporte público (Victor, 18/11)

- **Decisão (Victor, 18/11):** a etapa 3 mostra como chegar de transporte público. As linhas e os horários vêm do **Google Routes API** (modo `TRANSIT`). A acessibilidade de cada ônibus vem da **SPTrans Olho Vivo**. O Google não informa nem filtra acessibilidade no transporte público (conferido na referência da API v2 em 18/11), e por isso não foi usado sozinho.
- **API Java:** `POST /api/percursos` com `{ unidadeId, origem: { latitude, longitude }, horarioAtendimento, folgaMinutos }`, na branch `feat/api-percurso`.
  - Sem `horarioAtendimento`, calcula saindo agora. Com ele, mira chegar `folgaMinutos` antes (padrão 15) e recomenda a opção que chega a tempo saindo mais tarde.
  - Devolve as opções com `saida`, `chegada` e os trechos: a pé, ônibus, metrô ou trem, com linha, sentido, embarque, desembarque, paradas e intervalo. Inclui também a geometria do Google, para um mapa futuro.
  - Nos ônibus da SPTrans, o campo `aoVivo` traz os próximos veículos no ponto, cada um com `acessivel` (`true`, `false` ou `null` quando a SPTrans não informa), e o `proximoAcessivel`.
  - A previsão ao vivo só é consultada quando falta menos de 1 hora para o embarque, porque a Olho Vivo só prevê ônibus que já estão rodando. Posição de veículo com mais de 10 minutos não aparece.
  - **Metrô e trem:** “acessibilidade não informada”, porque nenhuma das fontes informa.
  - **Erros:** 503 sem chave do Google ou com o Google fora do ar; 422 para horário passado, horário a mais de 7 dias ou unidade sem coordenadas. Se a Olho Vivo falhar, o percurso sai mesmo assim, com o status do ao vivo `INDISPONIVEL`.
- **Privacidade:** a origem vai **no corpo do POST**, nunca na URL, só quando a pessoa toca em “Ver percurso”, e a tela avisa antes. A API manda a origem ao Google e não grava nem registra em log. A precisão do GPS não é enviada. Isso muda a regra da D-18 só para esta tela.
- **Segredos:** `GOOGLE_ROUTES_CHAVE` e `OLHOVIVO_TOKEN` ficam só no servidor (Render e `.env` local), nunca em variável `NEXT_PUBLIC_`.
- **Mapa:** a linha do trajeto ainda não é desenhada, porque o front não tem biblioteca de mapa (FE-14). A geometria real já vem na resposta. O botão “Abrir no Google Maps” leva só o destino.
- **Testes:** API com 14 testes novos (fixture fictícia do Google e Olho Vivo simulada); front com 3 arquivos novos de teste (fixture fictícia em `tests/fixtures/percurso.js`).
- **Falta:** a chave do Google (Routes API ativado e faturamento ligado no Google Cloud) e o token da Olho Vivo, nas variáveis do Render. Depois, o merge na `backend-java` e o deploy.

#### D-20, revisão de 18/11 (noite): tela mais direta, mapa e metrô

- **Pedido do Victor:** a tela não estava intuitiva, faltava o “saia até HH:MM para chegar a tempo” em destaque, faltava o mapa e só apareciam ônibus.
- **Formulário:** uma pergunta só (“A que horas é o seu atendimento?”), com o horário em destaque, a antecedência em botões e o atalho “Não tenho horário: sair agora”.
- **Resultado:**
  - destaque “Saia até HH:MM”, com quanto falta para sair, a hora de chegada, quantos minutos antes do atendimento e a rota em selos (a pé › linha › a pé);
  - **mapa** (Leaflet + OpenStreetMap) com a geometria real do Google: a pé tracejado, ônibus em verde, metrô e trem na cor da linha;
  - lista “Escolha como ir”, com filtro “Só ônibus” e “Com metrô ou trem”: tocar numa opção troca o destaque, o mapa e o passo a passo;
  - **passo a passo** em linha do tempo, com a hora de cada etapa e a chegada.
- **Ônibus acessível no destaque:** só aparece quando a SPTrans prevê um veículo acessível entre 3 min antes e 20 min depois do embarque planejado. A previsão ao vivo só cobre ônibus que já estão rodando, então um embarque distante não ganha destaque, e o passo a passo avisa isso.
- **API (`feat/api-percurso-mapa`):**
  - `geometria` virou lista e passou a incluir as caminhadas;
  - uma segunda consulta ao Google, só com metrô e trem, garante essas opções, sem repetir rotas. Se ela falhar, o percurso sai sem ela.
  - O front aceita a `geometria` antiga (texto) e a nova (lista).
- **Privacidade:** o mapa carrega os blocos do OpenStreetMap da região mostrada, o que revela a área ao servidor do OSM. A tela avisa isso junto do aviso de localização.

### D-19 — Buscar por exames e especialidades (aberto, Nicolas + Raphael)

- **Problema (18/11):** o catálogo `GET /api/servicos` tem só 6 itens, todos indicadores gerais do CNES (ambulatorial, hospitalar, centro cirúrgico, obstétrico, neonatal, serviço de apoio). Não dá para buscar “mamografia” ou “pediatria”, que é o centro da proposta. O banco não tem exames, equipamentos nem especialidades.
- **Proposta:** Nicolas carrega os arquivos **EQ** (equipamentos) e **SR** (serviços especializados) do CNES de São Paulo como novos itens de `SERVICO_SAUDE`, ligados às unidades em `UNIDADE_SERVICO` (o modelo já comporta). Raphael acrescenta `categoria` (`EXAME` / `ESPECIALIDADE` / `ATENDIMENTO`) ao `ServicoResponse` e faz novo deploy.
- **Front (pronto em 18/11):** se a API mandar `categoria`, as sugestões aparecem em grupos “Exames”, “Especialidades” e “Atendimento”, nessa ordem. Sem `categoria`, a lista continua simples. Texto sem correspondência mostra “Nenhum item do catálogo com …” e não vira busca. O front **não cria sinônimos** nem liga palavras a serviços por conta própria.
- **Se não der tempo até 19/11:** apresentar no pitch como próxima etapa.
- **Feito em 18/11 pelo Victor, numa branch separada para PR ao Raphael (nenhuma senha de banco usada):**
  - Arquivos oficiais do DATASUS, CNES SP competência 10/2026: `EQSP2610.dbc` (equipamentos), `SRSP2610.dbc` (serviços especializados) e `TAB_CNES.zip` (nomes dos códigos).
  - Script `services/api/scripts/gerar_carga_eq_sr.py` gera `V5__exames_e_servicos_especializados.sql`: coluna `categoria`, 2 fontes novas (`CNES_EQ`, `CNES_SR`), **44 itens** (13 exames, 26 especialidades/serviços especializados, 5 atendimentos) e **7.564 vínculos**, só para as 1.092 unidades já no banco.
  - Exame = equipamento **em uso** (`QT_USO > 0`) na unidade; a descrição de cada item diz que isso **não garante exame, vaga ou agenda**. Os códigos oficiais ficam em `campo_origem`.
  - Java: `categoria` na entidade `ServicoSaude`, nas consultas e no `ServicoResponse`. Compila, e os 9 testes do Raphael passam.
  - **Testado em 18/11 no Oracle 19.3 da FIAP**, na conta do próprio Victor: o Flyway aplicou V1–V5 sem erro e a API subiu. `GET /api/servicos` devolve 50 itens (13 EXAME, 26 ESPECIALIDADE, 11 ATENDIMENTO); “Mamografia” → 79 unidades.
  - Front ligado na API local: busca agrupada (“mamo” → Exames › Mamografia), resultado ordenado pela distância e detalhe com os exames da unidade.
  - **V6 (18/11): especialidades pelos profissionais do CNES.** O script `scripts/gerar_carga_pf.py` lê o `PFSP2610.dbc` (profissionais, competência 10/2026). Lê **só** CNES, CBO e carga horária ambulatorial: o arquivo tem nome e CPF, que **não** são lidos nem gravados.
    - A unidade recebe a especialidade se tiver um profissional com aquela CBO e carga horária ambulatorial (`HORA_AMB > 0`).
    - 33 especialidades novas (dermatologia 113 unidades, pediatria 390, ginecologia 416, psiquiatria 360, psicologia 496, nutrição 516…) e 13 da V5 ampliadas sem repetir nome (fisioterapia de 258 para 480, cardiologia de 84 para 179). 6.791 vínculos; total de 83 itens no catálogo.
    - Testada no Oracle 19.3 da FIAP (conta do Victor): o Flyway aplicou a V6 em 4 s. No front, “Dermatologia” → 113 unidades. As buscas “dentista”, “ginecologista” e “ultrassom” acham o item certo pela descrição oficial.
  - Falta: o Raphael revisar, fazer o merge na `backend-java` e acompanhar o deploy no Render; depois, voltar o `.env.local` do front para o Render.

Novo risco: o plano gratuito do Render “dorme” sem uso, e a primeira consulta levou cerca de 90 s em 18/11. O front espera até 60 s e, depois de 5 s, avisa que o serviço pode estar iniciando. **Antes da apresentação, abra o app uma vez para acordar a API.**

## Registro

| ID | Item | Problema | Proposta do Front-end | Responsável | Status |
|---|---|---|---|---|---|
| D-01 | Stack e dono de cada app | O README raiz (commit `c203435`, 13/11) diz que o app é React Native + Expo + TypeScript em `apps/mobile`, que o painel é Vite + TS do Felipe e que as rotas vêm do OpenTripPlanner. O Alinhamento Técnico (13/11) diz Next.js + JavaScript + Tailwind e algoritmo de rota em Python com programação dinâmica. | Seguir o Alinhamento: app web em `apps/web`, sem mexer em `apps/mobile`. O grupo atualiza o README raiz. | Grupo | Aberto |
| D-02 | Representação da acessibilidade | O Alinhamento usa `possuiAcessibilidade` (boolean). Raphael v3 e Nicolas v2 usam o enum `ACESSIVEL / NAO_ACESSIVEL / NAO_INFORMADO / NAO_VERIFICADO`. | Enum, porque o boolean não diferencia “não informado” de “não possui”. Até decidir, o adaptador fica isolado em `src/lib` e marcado como provisório. | Nicolas + Raphael | Resolvido |
| D-03 | Proveniência dos dados | O Alinhamento usa `dadosDemonstrativos: true`. Raphael v3 pede um objeto `proveniencia` (fonte, data de referência, consultado em) e diz que a flag não substitui a proveniência. | Objeto `proveniencia`; a flag fica só se o grupo mantiver dados demonstrativos. | Raphael + grupo | Resolvido |
| D-04 | Endpoints e DTOs | `/api/servicos`, `/api/regioes`, `/api/unidades` e `/api/unidades/{id}` estão só propostos. | Raphael marca cada um como planejado, em implementação ou disponível e informa a URL base, os nomes dos filtros, a paginação e o CORS. | Raphael | Resolvido |
| D-05 | Motor e formato da rota | O Alinhamento e o Felipe usam DP, que devolve `caminho: ["P1", …]` sem coordenadas. O repositório propõe OpenTripPlanner, cujo `Trecho.java` só tem um ponto de embarque por trecho. Nenhuma das duas propostas permite desenhar a linha da rota. | Sem geometria, a tela de rota mostra só a lista de etapas, sem linha no mapa. | Felipe + Raphael + Nicolas | Aberto |
| D-06 | Prazo | Prazo interno do grupo: 18/11. Prazo oficial: 19/11 às 23h55. Commit depois do prazo zera a parte técnica de DDD-Java. | Manter 18/11 como meta e congelar o repositório antes de 19/11 às 23h55. | Grupo | Aberto |
| D-07 | Dono do painel gestor | O README dá o painel ao Felipe (`apps/painel-gestor`, Vite). O Alinhamento e o documento do Victor dão ao Victor (`/gestao`). | Fora do P0 até decidir. | Grupo | Aberto |
| D-08 | Montagem das entregas do Agile | Ninguém está definido para o PDF do Agile (protótipo de 3 telas) nem para o vídeo pitch. | Victor fornece as capturas e os comentários de UX. | Grupo | Aberto |
| D-09 | Cidade-piloto e dados | O repositório e o OTP assumem São Paulo; o Nicolas v2 diz para não presumir. Também falta decidir entre CNES real e base demonstrativa rotulada. | Aguardar a decisão; o Front-end não exibe nenhuma unidade que não venha da API. | Grupo | Resolvido |
| D-10 | Arquivos da raiz ausentes | O README cita `.gitignore`, `.env.example` e `.github/workflows/ci-etl.yml`, mas nenhum está versionado. | Quem é dono da raiz cria os arquivos. `apps/web` terá o próprio `.gitignore` e `.env.example`. | Nicolas | Aberto |
| D-11 | Repositório da landing | O código não está acessível. Em 14/11 os tokens foram tirados do site publicado ([tokens.md](tokens.md)). | Conferir no código-fonte se ele for compartilhado. | Victor | Parcial |
| D-12 | Filtro “Atendimento pelo: SUS / plano” | As referências de UI e a landing mostram o seletor, mas não há campo, endpoint nem fonte de rede credenciada. O documento manda não exibir o filtro como funcional. | Fora da tela (ou desabilitado com “em breve”, conforme R-02) até Raphael e Nicolas definirem a fonte. | Raphael + Nicolas | Parcial |
| D-13 | Estados de acessibilidade exibidos | A referência 4 usa “Não informado”, “Parcial” e “Informado”. O enum proposto é `ACESSIVEL / NAO_ACESSIVEL / NAO_INFORMADO / NAO_VERIFICADO`, sem “Parcial”. | Mapear cada valor do enum para um texto aprovado; “Parcial” só se o enum ganhar esse valor. | Nicolas + Raphael | Resolvido |
| D-14 | Escopo da tela de percurso | A referência 3 mostra modos Ônibus / A pé / Carro, tempo, tarifa e “Iniciar rota”. O Alinhamento prevê só a rota do algoritmo do Felipe, sem carro, tarifa nem navegação passo a passo. | Mostrar só o que o contrato de rota devolver (D-05). | Felipe + Raphael + grupo | Aberto |
| D-16 | Como a pessoa chega à unidade | O VIAS não terá navegação passo a passo própria (D-14). | No detalhe da unidade (FE-13), botão “Abrir no app de mapas”: um link para o Google Maps com o destino preenchido, sem chave de API. Usa só coordenadas ou endereço reais vindos da API; sem os dois, o botão não aparece. Decidido pelo Victor em 14/11; falta o grupo validar para o pitch. | Victor + grupo | Implementado |
| D-17 | Sugestões de horário (“saia até 15h para pegar o ônibus X”) | Exigem horários de transporte (GTFS da SPTrans), posição em tempo real (Olho Vivo), o horário da consulta da pessoa e um contrato de rota com horário. Nada disso está no MVP, e a proposta refinada põe esses alertas no roadmap. | Fora do MVP. Se a rota do Felipe devolver horário de partida no contrato (D-05), a tela mostra esse horário como **estimativa**, com a fonte, sem alerta nem notificação. | Felipe + Raphael + grupo | Roadmap |
| D-15 | Equipamentos da unidade | A referência 2 mostra “Mamógrafo cadastrado”. Os arquivos EQ do CNES estão no ETL, mas nenhum DTO proposto expõe equipamentos. | Incluir equipamentos no DTO de detalhe se a base tiver; senão, a tela mostra só os serviços. | Nicolas + Raphael | Resolvido |
