# App do cidadão (React Native + Expo)

Responsável: Victor (1).

## Criar o projeto

O projeto Expo ainda não foi gerado. O modelo padrão do Expo já vem com TypeScript e Expo Router. Como esta pasta já tem arquivos, gere numa pasta temporária ao lado e mova o conteúdo para cá:

```bash
cd apps
npx create-expo-app@latest mobile-temp
```

Depois de mover, apague `mobile-temp` e mantenha o `eas.json` e este README que já estão aqui.

## Desenvolvimento

- Comece testando no celular pelo **Expo Go**.
- Quando a busca por voz entrar (fase 3), passe para um **development build**: a biblioteca `expo-speech-recognition` usa código nativo que o Expo Go não tem.
- O app só chama a API Java. O endereço vem de `EXPO_PUBLIC_API_URL`.

## APK para a banca

O `eas.json` já tem o perfil `preview`, que gera um APK Android para instalar sem loja:

```bash
npm install -g eas-cli
eas login
eas build --platform android --profile preview
```

1. Antes do build final, troque `EXPO_PUBLIC_API_URL` no `eas.json` pelo endereço HTTPS da API na Oracle Cloud.
2. O Expo devolve um link de download, que vira o QR code do slide e do README principal.
3. No plano gratuito são 15 builds por mês, em fila lenta: gere com antecedência.
4. Teste o APK num celular de fora do grupo, usando dados móveis.

O QR code do Expo Go não serve para a banca: desde maio de 2026, ele só abre projetos publicados da própria conta ou organização.
