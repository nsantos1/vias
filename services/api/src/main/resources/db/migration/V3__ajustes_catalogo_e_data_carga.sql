-- =====================================================================
-- VIAS - V3: ajustes nao destrutivos (somente UPDATE e novo DEFAULT)
-- 1) Nomes e descricoes do catalogo com acentuacao (exibidos no app).
-- 2) data_carga passa a ser gravada no horario de Sao Paulo, independente
--    do fuso da sessao JDBC. No Oracle da FIAP a sessao do Flyway estava
--    em UTC, e a carga da V2 ficou 3 h adiantada.
-- =====================================================================

UPDATE SERVICO_SAUDE SET nome = 'Atendimento ambulatorial',
  descricao = 'Indicador de atendimento ambulatorial publicado no cadastro do CNES.'
  WHERE codigo = 'ATENDIMENTO_AMBULATORIAL';
UPDATE SERVICO_SAUDE SET nome = 'Atendimento hospitalar (internação)',
  descricao = 'Indicador de atendimento hospitalar publicado no cadastro do CNES.'
  WHERE codigo = 'ATENDIMENTO_HOSPITALAR';
UPDATE SERVICO_SAUDE SET nome = 'Centro cirúrgico',
  descricao = 'Indicador de centro cirúrgico publicado no cadastro do CNES.'
  WHERE codigo = 'CENTRO_CIRURGICO';
UPDATE SERVICO_SAUDE SET nome = 'Centro obstétrico (parto)',
  descricao = 'Indicador de centro obstétrico publicado no cadastro do CNES.'
  WHERE codigo = 'CENTRO_OBSTETRICO';
UPDATE SERVICO_SAUDE SET nome = 'Unidade neonatal',
  descricao = 'Indicador de centro neonatal publicado no cadastro do CNES.'
  WHERE codigo = 'CENTRO_NEONATAL';
UPDATE SERVICO_SAUDE SET nome = 'Serviço de apoio',
  descricao = 'Indicador "possui serviço de apoio" publicado no cadastro do CNES. Não indica exames disponíveis.'
  WHERE codigo = 'SERVICO_APOIO';

-- A V2 rodou nesta mesma sessao: converte do fuso da sessao para Sao Paulo.
-- Onde a sessao ja estava em Sao Paulo (Docker local), o valor nao muda.
UPDATE UNIDADE_SAUDE
   SET data_carga = CAST(FROM_TZ(data_carga, SESSIONTIMEZONE) AT TIME ZONE 'America/Sao_Paulo' AS TIMESTAMP)
 WHERE id_fonte = (SELECT id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_DEMAS');

ALTER TABLE UNIDADE_SAUDE MODIFY (data_carga DEFAULT CAST(SYSTIMESTAMP AT TIME ZONE 'America/Sao_Paulo' AS TIMESTAMP));
