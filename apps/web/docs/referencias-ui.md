# Referências de interface

Responsável: Victor. Recebidas em 14/11/2026.

Quatro telas de referência visual do app (celular), em [`referencias/`](referencias/). Elas seguem a mesma direção da landing, que mostra a tela 1 num celular na seção inicial. **São mockups com dados ilustrativos**: servem de guia de layout e linguagem, não de contrato de dados. Tudo que aparece nelas e depende de API ou decisão ainda aberta está marcado abaixo.

| # | Arquivo | Tela | Rota do app |
|---|---|---|---|
| 1 | [01-necessidade.webp](referencias/01-necessidade.webp) | Etapa 1 de 3, Necessidade: “O que você precisa?” | `/` |
| 2 | [02-unidade.webp](referencias/02-unidade.webp) | Etapa 2 de 3, Unidade: resultado da busca | `/unidades` e `/unidades/[id]` |
| 3 | [03-percurso.webp](referencias/03-percurso.webp) | Etapa 3 de 3, Percurso: como chegar | `/rota` (condicional) |
| 4 | [04-acessibilidade.webp](referencias/04-acessibilidade.webp) | Etapa 3 de 3, Acessibilidade no percurso | `/rota` (condicional) |

## O que adotar já (sem depender de ninguém)

Status em 14/11: **Aplicado** = já está no app; o resto entra no cartão indicado.

| Elemento | Onde aparece | Cartão | Status |
|---|---|---|---|
| Cabeçalho “VIAS │ RÓTULO DA TELA” (rótulo em mono, caixa alta) e botão voltar nas etapas 2 e 3 | Todas | FE-06 (ajuste) | Aplicado |
| Indicador de etapas Necessidade → Unidade → Percurso, com “ETAPA N DE 3” | Todas | FE-07 (`Etapas`) | Aplicado |
| Título “O que você precisa?” e subtítulo “Busque por um exame, serviço ou especialidade.” | 1 | FE-11 | Aplicado (formulário desabilitado até a API) |
| Campo com rótulo visível, ícone de lupa e botão de limpar | 1 | FE-07 (`TextField`) e FE-11 | Aplicado |
| Botão principal largo “Buscar unidades →” com texto de apoio abaixo | 1 | FE-07 (`Button largo seta`) e FE-11 | Aplicado |
| Fundo de mapa decorativo (só na busca) e onda verde com rodapé escuro | 1, 2 | FE-06 | Aplicado |
| Card da unidade com rótulo mono “UNIDADE DE SAÚDE”, linhas rótulo → valor e ícones | 2 | FE-13 | Pendente |
| Aviso “O cadastro do equipamento não confirma disponibilidade de vagas ou agendamento.” | 2 | FE-13 (bate com a regra do documento §11.1) | Pendente |
| Selo “DEMONSTRAÇÃO — DADOS ILUSTRATIVOS” | 2, 3, 4 | FE-16. Só aparece quando a API marcar o dado como demonstrativo (D-03) | Pendente |
| Lista de trechos com estado por trecho e texto “A ausência de informação não significa ausência de acessibilidade.” | 4 | FE-16 / FE-19 | Pendente |

## O que depende de contrato ou decisão

| Elemento | Tela | Por que não dá para fazer como está | Decisão |
|---|---|---|---|
| Seleção “Atendimento pelo: SUS” | 1, 2 | Não há campo, endpoint nem fonte de rede credenciada para SUS/plano. O documento manda não exibir esse filtro como funcional | D-12 |
| “Mamógrafo cadastrado — Equipamento identificado na base consultada” | 2 | Equipamentos vêm dos arquivos EQ do CNES (ETL do Nicolas), mas nenhum DTO proposto traz equipamento | D-15 |
| “FONTE: CNES” | 2 | Depende do objeto de proveniência | D-03 |
| Mapa com linha de rota, ponto de ônibus e “Você” | 3 | Nenhuma proposta de rota devolve geometria; sem ela, a linha não pode ser desenhada | D-05 |
| “28 min”, “Ônibus + caminhada”, abas Ônibus / A pé / Carro | 3 | Tempo e modos dependem do contrato de rota. “Carro” (Google Routes) aparece só no README do repo, não no Alinhamento | D-05, D-14 |
| “Tarifa conforme o município” | 3 | Não há fonte de tarifa definida | D-14 |
| Estados “Não informado”, “Parcial”, “Informado” | 4 | “Parcial” e “Informado” não existem no enum proposto (`ACESSIVEL`, `NAO_ACESSIVEL`, `NAO_INFORMADO`, `NAO_VERIFICADO`) | D-13 |
| Botão “Iniciar rota” | 4 | Navegação passo a passo está fora do escopo do MVP | D-14 |
| Etapa 3 “Percurso” no indicador | Todas | Enquanto não houver rota integrada, a etapa 3 não leva a lugar nenhum | Pergunta R-01 |

## Decisões do Victor (14/11/2026)

- **R-01, etapas:** o indicador mostra as **3 etapas**. Enquanto a rota não estiver integrada (D-05), “Percurso” aparece apagado, com o texto “em breve”, e não é clicável.
- **R-02, SUS/plano:** o seletor “Atendimento pelo” fica **fora da tela** até D-12 ser decidido.
- **R-03, fundo de mapa:** o mapa decorativo (pin + linha) aparece **só na tela de busca**. Nos resultados e no detalhe fica só a onda verde do rodapé, para o desenho não parecer a localização de uma unidade real.
