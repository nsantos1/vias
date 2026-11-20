-- =====================================================================
-- VIAS - V4: corrige data_carga (nao destrutivo: UPDATE e novo DEFAULT)
-- O Oracle 19.3 da FIAP usa tabela de fusos antiga e ainda aplica horario
-- de verao em America/Sao_Paulo (abolido em 2019): a sessao grava -02:00 em
-- novembro e a carga da V2 ficou 1 h adiantada. A V3 nao corrigiu porque
-- convertia de America/Sao_Paulo para ele mesmo.
-- Solucao: usar o deslocamento fixo -03:00 (Brasilia, sem horario de verao).
-- Em banco com tabela de fusos atual (Docker local), a conversao nao muda nada.
-- =====================================================================

UPDATE UNIDADE_SAUDE
   SET data_carga = CAST(FROM_TZ(data_carga, 'America/Sao_Paulo') AT TIME ZONE '-03:00' AS TIMESTAMP)
 WHERE id_fonte = (SELECT id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_DEMAS');

ALTER TABLE UNIDADE_SAUDE MODIFY (data_carga DEFAULT CAST(SYSTIMESTAMP AT TIME ZONE '-03:00' AS TIMESTAMP));
