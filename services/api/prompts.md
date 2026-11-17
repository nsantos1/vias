# Registro de uso de IA – API Java (DDD)

Conforme o combinado "IA como copiloto" da Global Solution, registramos aqui como a IA foi usada nesta parte.

**Ferramenta:** Claude Code (Anthropic).

## 08/11/2026 – primeira versão

> Veja os PDFs (roteiro de desenvolvimento do VIAS e enunciado da GS CitizenTech) e entenda a ideia do meu grupo.
> Faça a parte de Domain Driven Design – Java que pede no documento.

Gerou a estrutura do projeto, camadas, deploy (Dockerfile + render.yaml) e a primeira documentação.

## 16/11/2026 – alinhamento com o contexto do grupo (v3)

> Vamos para algumas mudanças, vamos seguir o padrão do meu grupo. As regras de entrega permanecem as mesmas,
> mas a ideia do projeto deve seguir a do documento (VIAS_Contexto_IA_Raphael_Backend_Java_v3).

A IA reescreveu o domínio para o núcleo REGIAO / UNIDADE_SAUDE / SERVICO_SAUDE / UNIDADE_SERVICO (+ FONTE_DADO),
trocou os dados simulados por uma carga real do CNES (scripts/baixar_cnes.py e gerar_carga_sql.py),
implementou os estados de acessibilidade, a proteção dos campos oficiais, os endpoints do contrato
e refez diagramas e PDF.

**O que o grupo revisa e decide:** schema final com a frente Oracle (Nicolas), contrato dos endpoints com o
front-end (Victor), contrato de rotas com o módulo Python (Felipe). Cada integrante deve saber explicar
as regras de domínio e as limitações dos dados.
