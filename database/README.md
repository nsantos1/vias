# Modelo de dados

Responsável: Raphael (2).

Esta pasta guarda só a modelagem que a disciplina de banco pede: o DER e o dicionário de dados. Os scripts que criam as tabelas ficam apenas em `services/api/src/main/resources/db/migration` (Flyway), para não existirem duas versões do esquema.

O banco é o Oracle da FIAP, com Oracle Spatial (consulta e índice espacial testados). As tabelas ficam no usuário do Raphael, que libera leitura e gravação aos outros integrantes com `GRANT`.
