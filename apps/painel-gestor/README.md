# Painel do gestor (React + Vite)

Responsável: Felipe (4).

Mapa dos desertos de acesso à saúde por bairro, para a prefeitura decidir onde abrir a próxima UBS. Usa Leaflet com o mapa do OpenStreetMap.

## Criar o projeto

O projeto ainda não foi gerado. Dentro desta pasta:

```bash
npm create vite@latest . -- --template react-ts
npm install leaflet react-leaflet
```

Se o Vite perguntar o que fazer com os arquivos que já existem na pasta, escolha a opção de ignorá-los, para não apagar este README.

## Dados

O painel só chama a API Java (porta 8080 em desenvolvimento). Quem calcula os desertos de acesso ainda está em "A combinar" no plano.

## Deploy

Publicado na **Vercel**, conectada ao repositório. Como o painel abre em HTTPS, a API precisa estar em HTTPS e liberar o endereço da Vercel no CORS (fase 4).
