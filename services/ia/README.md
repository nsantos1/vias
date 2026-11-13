# Serviço de IA (Python + FastAPI)

Responsável: Felipe (4).

Entende o texto livre ou falado da busca ("meu filho está com dor de ouvido") e lê a foto da guia médica, usando um modelo de linguagem pronto via API, sem treinar um modelo próprio. Só a API Java chama este serviço, na porta **8000**.

## O que a API espera receber

A pasta `services/api/.../integracao/ia` tem a proposta do contrato: para cada texto, a intenção (buscar unidade, exame, especialidade ou agendar), o detalhe pedido ("raio-x"), o tipo de unidade sugerido e se há sinais de urgência. Ajustes nesse contrato vão por pull request, combinados com o Nicolas.

## Estrutura sugerida

```
services/ia/
├── app/
│   ├── main.py            # FastAPI
│   ├── classificador/     # texto → intenção e especialidade
│   └── leitor_guia/       # foto da guia → exame pedido
├── tests/                 # pytest, incluindo a lista de frases da avaliação da IA
└── requirements.txt
```

Para rodar em desenvolvimento: `uvicorn app.main:app --port 8000`.
