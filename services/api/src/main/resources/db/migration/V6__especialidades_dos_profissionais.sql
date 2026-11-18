-- =====================================================================
-- VIAS - V6: especialidades a partir dos profissionais do CNES (DATASUS)
-- Gerada por scripts/gerar_carga_pf.py (nao editar a mao).
-- Fonte: PFSP2610.dbc, ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/PF,
--   competencia 10/2026. Lidas so as colunas CNES, CBO e HORA_AMB: nenhum dado pessoal.
-- Regra: profissional com a CBO e carga horaria ambulatorial (HORA_AMB > 0).
-- Itens novos: 33 | itens da V5 ampliados: 13 | vinculos: 6791
-- Nao destrutiva: INSERT, UPDATE de descricao e vinculos so onde ainda nao existem.
-- =====================================================================

INSERT INTO FONTE_DADO (sigla, nome, url, oficial)
VALUES ('CNES_PF', 'CNES - Profissionais por estabelecimento (DATASUS, competência 10/2026)',
  'ftp://ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/PF/', 'S');

INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_CLINICA_MEDICA', 'Clínica médica (clínico geral)', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico clinico; Medico generalista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225125,225170', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_MEDICINA_FAMILIA', 'Medicina de família', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico da estrategia de saude da familia; Medico de familia e comunidade). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225142,225130', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_PEDIATRIA', 'Pediatria', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico pediatra). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225124', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_GINECOLOGIA', 'Ginecologia e obstetrícia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico ginecologista e obstetra). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225250', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_PSIQUIATRIA', 'Psiquiatria', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico psiquiatra). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225133', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_DERMATOLOGIA', 'Dermatologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico dermatologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225135', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_OTORRINO', 'Otorrinolaringologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico otorrinolaringologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225275', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_GASTRO', 'Gastroenterologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico gastroenterologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225165', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_INFECTOLOGIA', 'Infectologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico infectologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225103', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_GERIATRIA', 'Geriatria', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico geriatra). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225180', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_REUMATOLOGIA', 'Reumatologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico reumatologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225136', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_HEMATOLOGIA', 'Hematologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico hematologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225185', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_MASTOLOGIA', 'Mastologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico mastologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225255', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_COLOPROCTOLOGIA', 'Coloproctologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico coloproctologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225280', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_ANGIOLOGIA', 'Angiologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico angiologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225115', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_ALERGIA', 'Alergia e imunologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico alergista e imunologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225110', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_CIRURGIA_GERAL', 'Cirurgia geral', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico cirurgiao geral). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225225', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_CIRURGIA_PLASTICA', 'Cirurgia plástica', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico cirurgiao plastico). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225235', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_NEUROCIRURGIA', 'Neurocirurgia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico neurocirurgiao). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225260', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_CIRURGIA_PEDIATRICA', 'Cirurgia pediátrica', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico cirurgiao pediatrico). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225230', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_CABECA_PESCOCO', 'Cirurgia de cabeça e pescoço', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico cirurgiao de cabeca e pescoco). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225215', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_APARELHO_DIGESTIVO', 'Cirurgia do aparelho digestivo', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico cirurgiao do aparelho digestivo). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225220', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_CIRURGIA_CARDIO', 'Cirurgia cardiovascular', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico cirurgiao cardiovascular). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225210', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_FISIATRIA', 'Fisiatria', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico fisiatra). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225160', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_ACUPUNTURA', 'Acupuntura', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico acupunturista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225105', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_HOMEOPATIA', 'Homeopatia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico homeopata). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225195', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_NUTROLOGIA', 'Nutrologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico nutrologista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225118', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_GENETICA', 'Genética médica', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico geneticista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225175', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_MEDICINA_TRABALHO', 'Medicina do trabalho', 'Profissional com esta especialidade vinculado à unidade no CNES (Medico do trabalho). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 225140', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_PSICOLOGIA', 'Psicologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Psicologo clinico). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 251510', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_NUTRICAO', 'Nutrição', 'Profissional com esta especialidade vinculado à unidade no CNES (Nutricionista). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 223710', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_FONOAUDIOLOGIA', 'Fonoaudiologia', 'Profissional com esta especialidade vinculado à unidade no CNES (Fonoaudiologo geral). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 223810', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';
INSERT INTO SERVICO_SAUDE (codigo, nome, descricao, campo_origem, categoria, id_fonte) SELECT 'ESP_TERAPIA_OCUPACIONAL', 'Terapia ocupacional', 'Profissional com esta especialidade vinculado à unidade no CNES (Terapeuta ocupacional). Não garante consulta, vaga ou agenda.', 'CNES PF CBO 223905', 'ESPECIALIDADE', id_fonte FROM FONTE_DADO WHERE sigla = 'CNES_PF';

UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico cardiologista). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 116; PF CBO 225120' WHERE codigo = 'ESP_CARDIOLOGIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico oftalmologista). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 131; PF CBO 225265' WHERE codigo = 'ESP_OFTALMOLOGIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico oncologista clinico; Medico cancerologista cirurgico). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 132; PF CBO 225121,225290' WHERE codigo = 'ESP_ONCOLOGIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico pneumologista). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 133; PF CBO 225127' WHERE codigo = 'ESP_PNEUMOLOGIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico endocrinologista e metabologista). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 124; PF CBO 225155' WHERE codigo = 'ESP_ENDOCRINOLOGIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico urologista). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 169; PF CBO 225285' WHERE codigo = 'ESP_UROLOGIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico neurologista). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 105; PF CBO 225112' WHERE codigo = 'ESP_NEUROLOGIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico ortopedista e traumatologista). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 155; PF CBO 225270' WHERE codigo = 'ESP_ORTOPEDIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico nefrologista). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 130; PF CBO 225109' WHERE codigo = 'ESP_NEFROLOGIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Fisioterapeuta geral). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 126; PF CBO 223605' WHERE codigo = 'ESP_FISIOTERAPIA';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Cirurgiao dentista - clinico geral; Cirurgiao-dentista da estrategia de saude da familia). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 114; PF CBO 223208,223293' WHERE codigo = 'ESP_SAUDE_BUCAL';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico em cirurgia vascular). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 150; PF CBO 225203' WHERE codigo = 'ESP_CIRURGIA_VASCULAR';
UPDATE SERVICO_SAUDE SET descricao = 'Serviço especializado registrado no CNES ou profissional com esta especialidade vinculado à unidade (Medico cirurgiao toracico). Não garante consulta, vaga ou agenda.', campo_origem = 'CNES SR 118; PF CBO 225240' WHERE codigo = 'ESP_CIRURGIA_TORACICA';

-- Vinculos unidade x especialidade: 6791 (pula o que a V5 ja criou)
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '0025380' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '0025380' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '0030406' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0062855' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '0062855' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '0063746' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0063754' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0067512' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0087114' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0087203' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0087203' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0101567' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0101567' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0101567' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0102105' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0105422' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0105422' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0117684' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0117684' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0145173' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0158119' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0158119' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '0158119' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0158119' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '0158119' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0158119' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0161438' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0178683' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0207950' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0207950' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0207950' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '0207950' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '0223816' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0263192' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0378283' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0408948' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0408948' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '0408948' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0443174' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0443174' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0445495' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0452939' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0457183' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '0457183' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0457183' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '0463078' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0463078' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '0463671' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '0463671' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0463671' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0463671' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '0463671' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0466611' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0466611' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0466611' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0466611' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0466611' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0483303' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '0507822' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '0507822' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0519219' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0519219' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0541206' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '0609161' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0701394' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0701734' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0733997' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0747297' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0757233' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0757233' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0757233' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0803774' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0803952' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0812226' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0812226' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0812226' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '0812226' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0812226' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0812226' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0835633' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0844128' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0852074' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0852074' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0852074' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0852074' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0852074' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0868507' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0868507' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0868507' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '0868507' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '0868507' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0868507' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0868507' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0868507' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0868507' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '0873241' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0873241' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0873241' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0873268' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0873268' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0873268' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0873268' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0873268' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0884596' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0884596' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0884596' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0884596' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0884596' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '0884596' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '0908517' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '0908517' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0908517' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0917389' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0917583' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0926353' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '0926779' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '0926809' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0938068' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0944629' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '0949035' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '0958433' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0958433' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0958433' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0958433' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0958433' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0958433' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0974730' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0974730' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0974730' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0974730' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0974730' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '0974730' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '0997730' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '0997730' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '0997730' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '0997730' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '0997730' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2026961' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2026961' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2026961' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2026988' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2026988' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2026988' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2026988' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2026988' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2026996' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2027011' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027011' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2027011' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027011' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027038' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2027046' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027046' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027046' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027046' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027046' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027054' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027054' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027054' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027054' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027054' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027054' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027054' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027054' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027062' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027062' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027070' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027070' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027070' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027070' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027275' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027305' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027305' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027305' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027305' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027305' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027305' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027321' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027321' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2027321' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027321' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027321' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027321' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027321' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027321' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2027380' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027380' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027380' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027380' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027461' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2027526' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027526' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027526' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027526' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027526' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027526' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027631' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027666' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2027674' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027674' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027674' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2027674' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027674' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027682' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2027682' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027682' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2027682' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027682' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027682' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027682' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027682' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027690' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2027720' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2027720' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2027720' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2027720' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2027720' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2027720' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2027720' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2027720' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2028182' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2028840' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2029189' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2029189' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2029189' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2029189' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2029189' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2029189' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2029618' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2030934' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2030934' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2030934' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2030934' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2030934' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2030934' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2030934' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2030934' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2030969' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2030969' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2030969' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2030969' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2030969' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2030969' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2030969' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2030969' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2037971' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2037971' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2037971' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2037971' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2037971' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2040727' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2040727' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2040727' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2040727' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2040727' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2040727' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2040727' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2042258' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2042541' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2042827' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2042827' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2042932' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2042932' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2042932' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2042932' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2042932' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2042932' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2042932' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2042932' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2042967' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2042967' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2042967' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2042967' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2042967' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2042975' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2042975' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2042975' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2042975' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2042975' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2042975' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2042983' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2042991' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2042991' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2042991' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2042991' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2042991' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2042991' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2043009' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2043009' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2043009' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2043009' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2043017' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2043017' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2043017' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2043017' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2045451' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2046261' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2046261' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2046261' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2046261' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2046962' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2046962' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2046962' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2046962' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2046962' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2046962' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2046997' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2047004' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2047004' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2057131' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2057131' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2057271' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2057271' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2057271' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2057271' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2057271' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2057271' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2057271' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2057271' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2057891' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2057891' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_GENETICA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2058391' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2058502' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2062658' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2062658' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2062658' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2062658' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2062658' cnes, 'ESP_PSICOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2062658' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2062658' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2063670' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2064820' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2064855' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2064855' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2064855' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2064855' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2064855' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2064855' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2064855' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2065266' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2066092' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2066572' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2068044' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2068044' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2068044' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2068044' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2068079' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2068079' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2068109' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2068109' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2068109' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2068109' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2068109' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2068109' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2068109' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2068109' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2068931' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2069032' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2069032' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2069032' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2069032' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2069032' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2069040' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2069040' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2069040' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2069040' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2074079' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2074079' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2074079' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2074079' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2074079' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2074079' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2074079' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2074079' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2075016' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2075016' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2075016' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2075016' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2075016' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2075016' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2075016' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2075016' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2075202' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2075407' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2075407' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2075407' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2075407' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2075407' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2075407' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2075407' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2075407' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2075423' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2075423' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2075717' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_NEFROLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2075962' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2075962' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2076896' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2076926' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2076950' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2076950' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2076950' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2076950' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2076950' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2076950' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2076950' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2076985' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2077426' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077450' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2077469' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2077469' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_GENETICA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2077477' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_GENETICA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2077485' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2077485' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077493' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077507' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2077523' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2077574' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2077574' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077604' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077604' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2077604' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077604' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2077604' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077604' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2077620' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077639' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2077671' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2077752' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2077752' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2077752' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2077752' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2078007' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2078007' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2078007' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2078007' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2078007' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2078007' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2078007' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2078007' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2078007' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_GENETICA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2078015' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2078406' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2078457' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2078457' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2078457' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2078589' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2078600' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2078600' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2078627' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2078635' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2078635' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2078635' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2078635' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2079070' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2079070' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2079070' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2079070' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2079070' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2079070' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2079070' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2079070' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2079089' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2079089' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2079089' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2079089' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2079089' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2079127' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2079240' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2079445' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2079445' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2079445' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2079445' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2079445' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2079445' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_NUTROLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2080346' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2080346' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2080575' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2080583' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2080788' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2080796' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2080796' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2081288' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2081288' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2081288' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2081288' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2081288' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2081288' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2081288' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2081741' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2081970' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2082225' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_ORTOPEDIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2082624' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2082624' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2082829' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2082837' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2084139' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2084333' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2084473' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2086743' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2086743' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2086743' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2086743' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2086743' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2086808' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2086808' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2086808' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2086816' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2088576' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2088576' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2089238' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2089238' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2089599' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2089602' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2089602' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2089602' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2089602' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2089661' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2089661' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2089661' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2089777' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2090155' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2090155' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2090155' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2090155' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2091313' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2091321' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2091348' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2091461' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2091461' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2091526' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2091550' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091550' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091550' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2091550' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2091585' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_GENETICA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2091593' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2091704' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091704' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2091712' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2091720' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091720' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091720' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2091720' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091720' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2091720' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2091739' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2091747' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091747' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_GINECOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2091755' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2091755' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2091798' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2091798' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2091798' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2091798' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2091798' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2091798' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2091798' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2091798' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2688565' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2688573' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2688581' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2688581' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2688581' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2688581' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2688581' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2688581' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2688581' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2688581' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2688670' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2688670' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2688670' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_GENETICA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_ONCOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2688689' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2688689' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2751828' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2751828' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2751828' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2751828' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2751828' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2751828' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2751828' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2751836' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2751836' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2751836' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2751836' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2751836' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2751836' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2751836' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2751836' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2751844' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2751879' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2751887' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2751895' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2751895' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2751895' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2751895' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2751895' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2751895' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2751895' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2751895' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2751917' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2751968' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2751984' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2751984' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2752077' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2752107' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2752107' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752107' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2752107' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752107' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752107' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752107' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752166' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752166' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752166' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752166' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752166' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752166' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752166' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752174' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752182' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752182' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752182' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2752182' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752182' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752182' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752182' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752182' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752190' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752190' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752190' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752190' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752190' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752190' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752190' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752204' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752204' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752204' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752204' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752204' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752204' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752212' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752212' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752212' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752212' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2752212' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752212' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752212' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752220' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752239' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752239' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752239' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752239' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752239' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752239' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752239' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752247' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752247' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752247' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2752247' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752247' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752247' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752247' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752247' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752255' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752255' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752255' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752255' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752255' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752255' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752255' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752255' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752263' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752263' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752263' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752263' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2752263' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752263' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752263' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752263' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752271' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752298' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752298' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752298' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752298' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2752298' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752298' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752298' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752301' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2752328' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752328' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752328' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752328' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752328' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752328' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752328' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752328' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752336' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752344' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752352' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752352' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752352' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2752352' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752352' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752352' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752352' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752352' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752352' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752360' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752360' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752360' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752360' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752360' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752379' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752379' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2752379' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752379' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752379' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752379' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752379' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2752387' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2752387' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2752387' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2752387' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2752387' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2752387' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2752387' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2752387' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2765993' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2765993' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2765993' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2765993' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2765993' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2765993' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2765993' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2765993' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2766000' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2766000' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2766000' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2766000' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2766000' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2766000' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2766019' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2766019' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2766019' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2766019' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2766019' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2766019' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2774763' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2774763' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2774763' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2774771' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2774771' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2774771' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2774771' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2774771' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2774771' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2774771' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2774798' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2774798' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2774801' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2774801' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2774801' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2774801' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2774801' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2774828' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2774828' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2774828' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2774828' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2774828' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2774828' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2774828' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2774828' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2786680' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2786680' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786710' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786729' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786729' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786729' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786729' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786729' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786729' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786729' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786729' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786737' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786737' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786737' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786737' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786737' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786745' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786745' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786745' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786745' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786745' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786745' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786745' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786745' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786753' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786753' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786761' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2786788' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786788' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786788' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786788' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786788' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786788' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786818' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786818' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786826' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786826' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786826' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786826' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786826' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2786826' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786826' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786826' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786834' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2786842' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786842' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786842' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786842' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786842' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786869' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786869' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786877' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786877' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786877' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786877' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2786877' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786885' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2786885' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786885' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786885' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2786885' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2786885' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786885' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786893' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786893' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786893' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786893' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786907' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786907' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786907' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786907' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786907' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786907' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2786907' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786915' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786915' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786915' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786915' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786915' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786915' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786915' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786923' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786923' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786923' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2786923' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786931' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786931' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786931' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786931' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786931' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786931' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786958' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786958' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786958' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786958' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786958' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786958' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786966' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786974' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786974' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786982' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2786982' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2786982' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786982' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786982' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2786982' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2786982' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2786990' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2786990' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2786990' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787008' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787008' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787008' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787008' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787008' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787024' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787032' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787032' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787032' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787032' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787032' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787040' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787040' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787040' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787040' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787040' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787040' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787040' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787059' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787059' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787067' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787075' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787075' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787075' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787075' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787075' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787075' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787083' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787083' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787083' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787083' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787083' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787091' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787091' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787091' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787091' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787091' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787091' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787091' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2787105' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787105' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787105' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787105' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787105' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787113' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787121' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787121' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787121' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787121' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787121' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787121' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787148' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787156' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787156' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787156' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787156' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787156' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787156' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787156' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787156' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787172' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787172' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787180' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787180' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787199' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787199' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787199' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787199' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787199' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787202' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787210' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787210' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787210' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787210' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787210' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787210' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787210' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787210' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787229' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787229' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787229' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787229' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787229' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787229' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787229' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787229' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787237' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787237' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787237' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787237' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2787237' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787237' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787237' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787245' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787245' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787245' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787245' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787245' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787245' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787245' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787245' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787253' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787261' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787261' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787261' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787288' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2787288' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787288' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787288' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787288' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787288' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787288' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787296' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787296' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787296' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787296' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787296' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787296' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787296' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787296' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787318' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787318' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787318' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787318' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787318' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787318' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787318' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787326' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787326' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787326' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787326' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787326' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787326' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787326' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787326' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787334' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787334' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787334' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787334' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787334' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787334' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787334' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787342' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787342' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787342' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787342' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787342' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787342' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787342' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787350' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787350' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787350' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787350' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787350' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787350' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787369' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787369' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787369' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787369' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787369' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787369' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787369' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787369' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787377' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787385' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787385' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787385' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787385' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787385' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787385' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787385' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787393' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787393' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787393' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787393' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787393' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787407' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787407' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787407' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787407' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787407' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787407' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787407' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787407' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787415' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787423' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787423' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787423' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787423' cnes, 'ESP_PSICOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2787423' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787423' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787431' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787431' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787458' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787458' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787458' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787458' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787458' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787458' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787458' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787466' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787466' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787466' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787466' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787466' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787466' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787466' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787466' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787474' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787482' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787490' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787490' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787490' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787490' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787490' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787490' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787490' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787504' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787512' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787520' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787520' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787520' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787520' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787520' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787547' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787547' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787547' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787547' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787547' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787547' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787547' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787555' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787563' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787563' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787563' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787563' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787563' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787563' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787563' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787571' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2787571' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787571' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2787571' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787571' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2787571' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2787571' cnes, 'ESP_PEDIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2787571' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2787571' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787598' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787601' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787601' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787601' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787601' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787601' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787601' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787601' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787628' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787636' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787636' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787636' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787636' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787636' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787636' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787636' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787636' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787644' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787644' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787644' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787644' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787644' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787652' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787652' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787652' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787652' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787652' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787652' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787660' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787660' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787660' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787660' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787660' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787679' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787687' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787687' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787687' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787687' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787687' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787687' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787687' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787695' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787709' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787717' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787717' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787717' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787717' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787717' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787717' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787717' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787717' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787725' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787725' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787725' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787725' cnes, 'ESP_NUTRICAO' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2787725' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787725' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787725' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787733' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787733' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787733' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787733' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787733' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787733' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787741' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787768' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787768' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787768' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787768' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787768' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787768' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787768' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787768' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787776' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787776' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787776' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787776' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787776' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787776' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787776' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787776' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787784' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787806' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787806' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787806' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787806' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787814' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787814' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787814' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787822' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787822' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787822' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787822' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787830' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787830' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787830' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787830' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787830' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787830' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787830' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787849' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787849' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787849' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787849' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787849' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787849' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787857' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787857' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787865' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787865' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787865' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787865' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787865' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787865' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787865' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787873' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787881' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787903' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787903' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787903' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787903' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787903' cnes, 'ESP_NUTRICAO' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2787903' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787903' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787903' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787903' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787911' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787911' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787911' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787911' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787911' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787911' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787911' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787911' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787938' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787946' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2787954' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787962' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2787962' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '2787962' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2787962' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '2787962' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2787962' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787962' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787962' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787970' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787970' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787970' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787989' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787989' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787989' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787989' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2787989' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2787989' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2787997' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2787997' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2787997' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2787997' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788004' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788012' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788012' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788012' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788012' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788020' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788020' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788039' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788039' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788039' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788039' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788047' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788047' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788047' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788047' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788047' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788047' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788047' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788055' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788055' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788055' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788055' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788055' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788055' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788063' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788063' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788063' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788063' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788063' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788063' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788063' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788071' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788071' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788071' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788071' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788071' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2788098' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788098' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788098' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788101' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788101' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788101' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788101' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788101' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788101' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788128' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788128' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788128' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788128' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788128' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788128' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788128' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788136' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788144' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788152' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788152' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788152' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788152' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788160' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788160' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788160' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788160' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788160' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788160' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788160' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788179' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788179' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788179' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788179' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788187' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788195' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788209' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788209' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788209' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788209' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788209' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788209' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788217' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788225' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788233' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788233' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788233' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788233' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2788233' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788233' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788241' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788241' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788241' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788241' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788241' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788241' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788241' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788241' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788268' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788268' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788268' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788276' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788284' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788284' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788284' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788284' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788284' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788284' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788284' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788292' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788292' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788292' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788292' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788292' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788292' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788292' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788306' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788314' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788314' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788314' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788314' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788314' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788314' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788314' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788314' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788322' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788322' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788322' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788322' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788322' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788322' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788322' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788330' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788330' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788330' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788330' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788330' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788330' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788330' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788349' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788357' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788365' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788365' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788365' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788365' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788365' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788365' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788365' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788365' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788373' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788373' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788373' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788373' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788373' cnes, 'ESP_NUTRICAO' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2788373' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788373' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788373' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788373' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788381' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788403' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788403' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788403' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788403' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788403' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788403' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788403' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788403' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788411' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788411' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788438' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788438' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788438' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788438' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788438' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788438' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788438' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788438' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788446' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788446' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788446' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788446' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788446' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788446' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788454' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788470' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788489' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788489' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788489' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788489' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788489' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788489' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788489' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788497' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788497' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788500' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788500' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788500' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788500' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788500' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788519' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788527' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788535' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788535' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788535' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788535' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788535' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788535' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788535' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788535' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2788535' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788543' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788551' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788551' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788551' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788551' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788551' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788551' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788551' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788551' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788578' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788586' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788594' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788594' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788594' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788594' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788594' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788594' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788594' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788608' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788608' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788608' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788608' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788608' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788608' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788616' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788616' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788616' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788616' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788616' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788616' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788624' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788632' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788632' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788632' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788632' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788632' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788632' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788632' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788632' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788640' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788640' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788640' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788640' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788640' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788640' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788640' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788659' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788659' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788659' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788659' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788659' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788659' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788667' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788667' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788667' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788667' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788675' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788683' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788683' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788683' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788683' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788683' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788683' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788683' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788683' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2788691' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788691' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788691' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788691' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788691' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788691' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788691' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788705' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788705' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788705' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788713' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788713' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788713' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788713' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788713' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788713' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788721' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788748' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788756' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788756' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788756' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788756' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788764' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788764' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788764' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788764' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788764' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788764' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788764' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788772' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788772' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788772' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788772' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788772' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788780' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788780' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788780' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788780' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788780' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788780' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788780' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788780' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788799' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788799' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788799' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788799' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788799' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788799' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788799' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788802' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788802' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788802' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788802' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788802' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788802' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788810' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788810' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788810' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788810' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788810' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788810' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788810' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788829' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788837' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788837' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788837' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788837' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788837' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788837' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788845' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788845' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788845' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788845' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788845' cnes, 'ESP_PEDIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2788845' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788845' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788845' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788853' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788861' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788888' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788888' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788888' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788888' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788896' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788896' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788896' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788896' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788896' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788896' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788896' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788918' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788918' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788918' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2788918' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788918' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788918' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788918' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788926' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788934' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788934' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788934' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788934' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788934' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788934' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788934' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788942' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788942' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2788942' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788942' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788942' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788942' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788942' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788942' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788950' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788950' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788950' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788950' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788950' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788950' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788950' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788950' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788969' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788977' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2788977' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788977' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2788977' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788977' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788977' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2788977' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788985' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788985' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788985' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2788993' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789000' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789000' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789000' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789000' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789000' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789000' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2789000' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789019' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789019' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789019' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789019' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789019' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789019' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789019' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789019' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789027' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789027' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789035' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2789035' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789035' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789035' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789043' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789051' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789078' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789078' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789078' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789078' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789078' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789078' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789078' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789086' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789086' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789086' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789086' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789086' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789094' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789094' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789094' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789094' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789094' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789094' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789094' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789108' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789116' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789124' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789124' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789124' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789124' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789124' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789124' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789124' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789124' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789132' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789132' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789132' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789132' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789132' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789132' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789132' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789140' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789140' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789140' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789140' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789140' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789159' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789159' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789159' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789159' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789159' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789159' cnes, 'ESP_PSICOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2789159' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789159' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789159' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789167' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789167' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789167' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789167' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789167' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789167' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789167' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789167' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789175' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789183' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789183' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789191' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789191' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789191' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789205' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2789205' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789205' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789205' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789205' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789205' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789213' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2789213' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789213' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789213' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789213' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789221' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789221' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789221' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789221' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789221' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789221' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789248' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789256' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789264' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789264' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789272' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789272' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789272' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789280' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789280' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789280' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789280' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789280' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789280' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789280' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789280' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789299' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789299' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789299' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789299' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789299' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789299' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789299' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789299' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2789302' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2789310' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2789310' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2789310' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2789310' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2789310' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2789310' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '2789310' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2815273' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2815273' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2815273' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2815273' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2815273' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2815273' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2815273' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2815451' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2815451' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2815451' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2815451' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2815451' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2815451' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '2819473' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2819856' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2819856' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2819856' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2819856' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2819856' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2825767' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2825767' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '2825767' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2825767' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2825767' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '2825767' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2827158' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2827166' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2827166' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2847647' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2859319' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2878259' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2878259' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2878259' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2891026' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '2891050' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '2891050' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2914921' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '2927500' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2966247' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '2966433' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2966441' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '2983745' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '2983745' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '2983877' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2991837' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '2991837' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '2991918' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3001385' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3001385' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3001385' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3001407' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3001407' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3001415' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3001415' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3001431' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3001431' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3001431' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3001458' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3001458' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3001458' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3001466' cnes, 'ESP_UROLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '3002543' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3002543' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3002543' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3002543' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3002543' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3002632' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3002640' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3002926' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3002926' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3002926' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3002926' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3002926' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3002926' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3004341' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3016935' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3019012' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3019012' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3027600' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '3027600' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3027600' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3027600' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '3027600' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3027805' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3027813' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '3027813' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3027813' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3037584' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3037584' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3037584' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3037584' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3037584' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3037584' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3039420' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3044750' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3044750' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3044750' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3044750' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3044750' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3044750' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3044750' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3044750' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3044769' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '3044769' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3044769' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3044769' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3044769' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3044769' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3044769' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3049213' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3049213' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3049213' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3049213' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3049213' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3049213' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3074544' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3074544' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3074544' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3074544' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3105504' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3105504' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3105504' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3105504' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3105504' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3105504' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3105504' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3114147' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3114147' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3121135' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3121135' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3121135' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3121135' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3121135' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3121135' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3124304' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3124304' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3124304' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3124304' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3124304' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3124304' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3124304' cnes, 'ESP_PSICOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '3124304' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3124606' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3124606' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '3124606' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3124606' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3124606' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3139824' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3139824' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3139824' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3166597' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '3166597' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3166597' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3183130' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3183130' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3183955' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3184137' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3185613' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3185613' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3188760' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '3202526' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3212130' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3219771' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3219771' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3219771' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3219771' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3219771' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3219771' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3219771' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3219771' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3219887' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3219887' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '3219887' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3219887' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3219887' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3234169' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3235599' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3241599' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3241599' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3241599' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3241599' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3241599' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3241599' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '3241599' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3293998' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3307042' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '3307042' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3307042' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '3323331' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3323331' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3323331' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3323331' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3323331' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3331237' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '3331237' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3356175' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3359131' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3359182' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '3359182' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3359182' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3359182' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3359182' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3359182' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3359182' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3359182' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3367371' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3367371' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3367371' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3367371' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3367371' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3367371' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3385264' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3385264' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3385264' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3405311' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3405311' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3405311' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3424499' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3432548' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3432548' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3432548' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '3432548' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3432548' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '3432548' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3432548' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3452689' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3452689' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '3452689' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3452689' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3452689' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3452689' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3452689' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3452689' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3456773' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3456773' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '3464555' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3464555' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3469042' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3469042' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3469042' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3469042' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3469042' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3469042' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3469042' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3474674' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3474674' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3476405' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3487202' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3503488' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3503488' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3503488' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3503488' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3503488' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3503488' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3503488' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3503488' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3520714' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3520714' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3520714' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3520714' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3520714' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3525031' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '3565874' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3565874' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3565874' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3565874' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3565874' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3614948' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3614948' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3614948' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3614948' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3614948' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3614948' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3614948' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3614948' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3618927' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3618927' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3619516' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3619516' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3619516' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '3619516' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3651762' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3651762' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3651762' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3651762' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3651762' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3651762' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3651770' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3651770' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3651770' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3661660' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3661660' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3661741' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3661741' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3661741' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3661741' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3661741' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3683559' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '3683559' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3683559' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3683559' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3683559' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3683559' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3689247' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3689247' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3689247' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3700364' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3700364' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_MASTOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '3701832' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3701832' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3708411' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3724514' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3738582' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3738604' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3738604' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3738604' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3738604' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3738604' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3738604' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3738604' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3738647' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3738647' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3738647' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3738647' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3738647' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3738647' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3738647' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3738647' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3738663' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3738663' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3738663' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3738663' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3738663' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3738663' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3738663' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3738663' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3762831' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3762831' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3762831' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3762831' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3762831' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3762831' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3826813' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '3858898' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3858898' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '3866858' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '3866858' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3866858' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '3866858' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3913007' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3919072' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3937097' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3937097' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3937119' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3956946' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3956954' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '3956954' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3956954' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3956954' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3965422' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '3965422' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3965422' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3965422' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3965422' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '3992101' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '3996018' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '3996115' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '3996115' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '3996115' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4016742' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4016742' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4016742' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4016742' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4033817' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '4033817' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4033817' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4040295' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049799' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049799' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049799' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049799' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049799' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049799' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4049799' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049810' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4049853' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049853' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049853' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049853' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049853' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049853' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049853' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049853' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4049861' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049861' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049861' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4049861' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049861' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049861' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049861' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4049896' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4049896' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049896' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049918' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049918' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049926' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049926' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049926' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4049926' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049926' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049926' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049926' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4049926' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049934' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4049942' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049942' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049942' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049942' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049942' cnes, 'ESP_PEDIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '4049942' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049942' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4049942' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049950' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049950' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049950' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049950' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049950' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049950' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049950' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4049950' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049969' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049969' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049969' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049969' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049969' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049969' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049969' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4049969' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049977' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049977' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4049977' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4049977' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049977' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049977' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049977' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049977' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4049985' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4049993' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4049993' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4049993' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4049993' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4049993' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4049993' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050002' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050002' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050002' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050002' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050002' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050002' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050002' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050002' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050010' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050010' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050010' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050010' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050010' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4050010' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050010' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050010' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050029' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050029' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050029' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4050029' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050029' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050037' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050037' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050037' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050037' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050037' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050037' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4050037' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050037' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050045' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4050053' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050053' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050053' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050053' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050053' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050053' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050053' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050053' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4050061' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050061' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050061' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050061' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050061' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050061' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050088' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050088' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050088' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050088' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4050088' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050118' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '4050118' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050118' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050118' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050118' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050118' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050118' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050118' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4050126' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050126' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050126' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050126' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050126' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050126' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050134' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050134' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050134' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050134' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050134' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050134' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050134' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050134' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050142' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050142' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050142' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4050142' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050142' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050150' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050150' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050150' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050150' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050150' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050150' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050150' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050169' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '4050169' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050169' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4050169' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4050169' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050169' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050177' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050177' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050177' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050177' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050177' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050177' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050177' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050185' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050185' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050185' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050185' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050185' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4050185' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050185' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050185' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4050207' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050207' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050207' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050207' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050207' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050207' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050207' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050207' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050215' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050223' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050223' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050223' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050223' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050223' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050223' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050223' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '4050312' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '4050347' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050347' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4050347' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050347' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4050347' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050347' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050347' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050398' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050398' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4050401' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4050401' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4050401' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4050401' cnes, 'ESP_NUTRICAO' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '4050401' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4050401' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4050401' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4076990' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4076990' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '4076990' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4076990' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4077040' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4077164' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '4077229' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '4077229' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4077229' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '4083113' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4083113' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4091248' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '4091248' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4091248' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4091248' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4091248' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4133668' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4133838' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4133838' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4147227' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4147227' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '4147227' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4167457' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4167457' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4167457' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '4167694' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4167694' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4167694' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4181239' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4181255' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '4181255' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4181255' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4191455' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '4191455' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4210247' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4210247' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4210247' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4234774' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4234774' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4250419' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4282175' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4299051' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4299051' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4299051' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4384628' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4410750' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4410750' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4410750' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4410750' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4410750' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '4421906' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '4428560' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4428560' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '4434722' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '4434722' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4434722' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4434722' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4434722' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4434722' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4434722' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4463978' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4466713' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4466713' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4466713' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4475682' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4475682' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4475682' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4488318' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4488318' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4488326' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4488326' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4488326' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4488326' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4488326' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4488326' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4488326' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4488326' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4490584' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4493478' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4493478' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4493516' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4493516' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4493516' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4493516' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4493516' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4493516' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4493532' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4508505' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4508505' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '4508505' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '4510682' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '4510682' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '4510682' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4510682' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '4510682' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4510682' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4510682' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4541928' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4542479' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4542592' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4543335' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4561279' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4581679' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '4581679' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '4594118' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4601920' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '4601920' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '4601920' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4603176' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4603176' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4603176' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4629590' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4631129' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4631129' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4631447' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4631676' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4631676' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4639057' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4639057' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4642821' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '4642848' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4642848' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4642848' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '4677358' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4684907' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4696727' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4696727' cnes, 'ESP_NUTRICAO' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '4700449' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4700449' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4700449' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4700449' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4700449' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4700449' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4700449' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4711270' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4711270' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4722388' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '4722728' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '4722914' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '4742249' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4742478' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4771273' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '4771311' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4771311' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4771311' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4771311' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4771311' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4771311' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4771311' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '4771311' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4778758' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4778758' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '4796713' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4799194' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4799534' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4809920' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '4809920' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4809920' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4821211' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4824482' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4824482' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '4838823' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4848195' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4859839' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4884124' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4893069' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '4893530' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4893530' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4893530' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '4893530' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '4893530' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '4893530' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '4893662' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '4893662' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4893662' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '4893662' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '4893662' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '4893662' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '4893662' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '4893662' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '4915615' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '4932862' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '4933206' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '4933206' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '4933206' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '5074444' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5074479' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5079454' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5079454' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5079454' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5079454' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5079454' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5079454' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5082196' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5116880' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '5120780' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5120780' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '5127033' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5133386' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5133386' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5133386' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5138612' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5140773' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5140870' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5140897' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5141281' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143462' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143470' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143489' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143489' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5143497' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143527' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143535' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143543' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143578' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143586' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143594' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143608' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5143624' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5150108' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '5253837' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '5268125' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5268125' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5301971' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5301971' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '5313902' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5313902' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5313902' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5313902' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5313902' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5313902' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '5356350' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '5420938' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5429307' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5429307' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5429307' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '5429315' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5429315' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5429315' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '5437156' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5437156' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5437156' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5437156' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5479517' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '5492599' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5492599' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5492599' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5554144' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5576989' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5576989' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5590450' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '5590450' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5594448' cnes, 'ESP_HOMEOPATIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '5620341' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5620341' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5620341' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5620341' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5620341' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5621267' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5621267' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5621267' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5621267' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5621267' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5621267' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5621267' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5636469' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5636469' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5647916' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5647916' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5648483' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5648483' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5648491' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '5648491' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5648548' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5648556' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '5662699' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5695813' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5695813' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5695813' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5695813' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5695813' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5697921' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5698944' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5698952' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5713870' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5713870' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5718368' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5731143' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5731143' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5731143' cnes, 'ESP_NUTRICAO' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '5731143' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5731143' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5731143' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '5731143' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5743583' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5743583' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5743583' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5743583' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5743583' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5743583' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5743583' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '5743583' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5755123' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '5755123' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5759129' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5759129' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '5811236' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5822009' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5822459' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '5882281' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5882281' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5890616' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '5907594' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '5957362' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5957362' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '5957397' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '5957397' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '5975220' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6018912' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6018912' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6018912' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6018912' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6018912' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6018912' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6018912' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6018939' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6018939' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6018939' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6039111' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6039111' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6039111' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6042368' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6042368' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '6048633' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6048633' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6083323' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6083323' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6090591' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6090591' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6090591' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6090621' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6131670' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6131670' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6133460' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6133460' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6133525' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6133525' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6133622' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6133622' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6133622' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6133622' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6133622' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6135978' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6135978' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6138314' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6143180' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6143180' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6144055' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6144055' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6146341' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6146341' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6146341' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6146341' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6146341' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6146341' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6148336' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6148344' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6148344' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6148344' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6148344' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6148344' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6148344' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6156959' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6156959' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6156959' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6165516' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6165516' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6165516' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6165516' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6167403' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '6167403' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '6194974' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6194974' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6194990' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6194990' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6194990' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6194990' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6194990' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6194990' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6194990' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6194990' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6195008' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6195008' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6195008' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6195008' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6195008' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6195008' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6200389' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6200389' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6200389' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6200389' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6200389' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6200389' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6200389' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6206611' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6215440' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6217788' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6217788' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6218830' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6218830' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6218830' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6218830' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6226922' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6226922' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6264611' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6264611' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6264611' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6264646' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6264646' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6264646' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6269567' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6269567' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6269567' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6269567' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6269567' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6269567' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6269567' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6280188' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6280188' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6280188' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6280188' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6283616' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6283616' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6283616' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6283616' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6283616' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6283616' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6283616' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6283616' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6283993' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '6283993' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6283993' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6283993' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6283993' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6283993' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6283993' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6329527' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6329527' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6329527' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6329527' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6332420' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6332420' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6332420' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6332439' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6332439' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6332439' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6332447' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6332447' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6332447' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6332463' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6332463' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6332463' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6332471' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6332471' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6332471' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6332498' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6332498' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6332498' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6332501' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6332501' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6332501' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6332528' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6332528' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6348017' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6348017' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6357083' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6357083' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6357083' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6357083' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '6357083' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6357083' cnes, 'ESP_ORTOPEDIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '6357083' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6357083' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6357083' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6360890' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6360890' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6360890' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6360890' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6360890' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6365817' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6365817' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6365817' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6365817' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6365817' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6365825' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6365825' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6365825' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6377742' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6377742' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6377742' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6377742' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6377742' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6377742' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6380417' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6380417' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6380417' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6380417' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6380417' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6380417' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6380417' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6380417' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6391885' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6391893' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6393608' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6394558' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6408168' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6408168' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6408168' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6408168' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6408168' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6408168' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6408168' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6415415' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6415431' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6415431' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '6415431' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6415431' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6423086' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_GENETICA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6430120' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6432530' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6557538' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6564410' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6564410' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6564410' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6564410' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6564410' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6564410' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6564410' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6569757' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6569757' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6569757' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6569757' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6569757' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6592899' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6592899' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6592899' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6592899' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6654665' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6659160' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6659160' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6659160' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6659160' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6659160' cnes, 'ESP_UROLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '6670849' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6670849' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6683991' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6683991' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6683991' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6683991' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6683991' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6683991' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6683991' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6695779' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6695779' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '6695779' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '6695779' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6703607' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6703607' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6703607' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6703607' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6703607' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6703607' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6703607' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6728626' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6728626' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6745296' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6759998' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '6759998' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6759998' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6759998' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6759998' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '6759998' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6759998' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6759998' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6771084' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '6822991' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6822991' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6822991' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6832733' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6863191' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6873278' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6873278' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6873286' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6879810' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6879810' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6879810' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6879810' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6879810' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6888860' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6936075' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6936075' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6964028' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6974511' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6974511' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6974511' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6974511' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6974511' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '6974511' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '6974511' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6988717' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6988717' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '6988717' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6988717' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '6998186' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '6998186' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '6998186' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '6998186' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '6998186' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '6998186' cnes, 'ESP_PSICOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '6998186' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '6998186' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '6998208' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '6998208' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '6998208' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7097778' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7097778' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7097778' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7097778' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7097778' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7097778' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7097778' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7128940' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '7136617' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7136617' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7136617' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7136617' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7136617' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7136617' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7159102' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7164602' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7240171' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7270941' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7270941' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7270941' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7270941' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7270941' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7270941' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7270941' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7291191' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7301960' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7302541' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '7357761' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7357761' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7369069' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '7370989' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7370989' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '7407629' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7407629' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7407629' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7407629' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7407629' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7407629' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7407629' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7407629' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7436149' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7436149' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7436149' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '7436149' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7436149' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7436149' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7448481' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '7448856' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7457731' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '7457731' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '7479387' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '7479387' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7479387' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7479387' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '7479387' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7479387' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7479387' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_HOMEOPATIA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '7534817' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7572182' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '7572182' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7572182' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '7638698' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '7638698' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '7638698' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7638698' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7638698' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7638698' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7638698' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '7638698' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7672578' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7676549' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CIRURGIA_TORACICA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_GENETICA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '7711980' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '7711980' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '7751702' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '7757271' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7803230' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '7803230' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '7803230' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7803230' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7803230' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7803230' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '7814186' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7814186' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7814186' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7814186' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '7814186' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7814186' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '7817916' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7823304' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '7823304' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7823304' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7823304' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7884192' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '7884192' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7884192' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '7887418' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '7887418' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7887418' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '7889844' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7889844' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7889844' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7889844' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7889844' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7912501' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7931670' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '7931670' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7931670' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7968566' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7968566' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '7968566' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7968566' cnes, 'ESP_MASTOLOGIA' cod FROM dual
  UNION ALL SELECT '7968566' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_ANGIOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_COLOPROCTOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '7992890' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '8006288' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8033420' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8033420' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8033420' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '8033420' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8033420' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8033420' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '8033420' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8033420' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '8047790' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '8047790' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8047790' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_FISIATRIA' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_ONCOLOGIA' cod FROM dual
  UNION ALL SELECT '8071721' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '8079803' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8079803' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '8080100' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8080100' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '8080100' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8080100' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '8080100' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '8080100' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8080100' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '8081603' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '8081883' cnes, 'ESP_APARELHO_DIGESTIVO' cod FROM dual
  UNION ALL SELECT '8081883' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '8081883' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '8081883' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '8082189' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8082189' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8082189' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8082189' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '8101655' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8101655' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8101655' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '8101655' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8101655' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8101655' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '8101655' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8101655' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '8104514' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8124248' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8147159' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8147159' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8147159' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '8147159' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8147159' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8147159' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8168504' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8168504' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '8168504' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '8190860' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8299803' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8363072' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '8363072' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '8363072' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8372519' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '8372519' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '8372608' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '8414297' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8414297' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8414297' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8414297' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8454302' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8454302' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8454302' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8460841' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8460841' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8460841' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '8460841' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8460841' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8460841' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8477728' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8477728' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8477728' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '8477728' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8477728' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '8501602' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '8501637' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '8538719' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '8538719' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '8540225' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8540268' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8540268' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '8540268' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '8540268' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '8540268' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '8540268' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8540268' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '8583374' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '8583390' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '8583390' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '8583390' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '8583390' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '8583390' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '8583390' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '8611769' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '8614156' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9036237' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9051422' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9051422' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9051422' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9051422' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9051422' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9059369' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9059369' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9059369' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9072349' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '9095195' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9095195' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_GINECOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '9096221' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '9096221' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9123989' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '9123989' cnes, 'ESP_ALERGIA' cod FROM dual
  UNION ALL SELECT '9123989' cnes, 'ESP_CIRURGIA_PLASTICA' cod FROM dual
  UNION ALL SELECT '9123989' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9123989' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9129855' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '9186492' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9186492' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9186492' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9186492' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9186492' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9186492' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9186492' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9186492' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9186840' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9186840' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9186840' cnes, 'ESP_NUTROLOGIA' cod FROM dual
  UNION ALL SELECT '9188177' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9188177' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9188177' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9188177' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9188177' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9191283' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9191348' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9191348' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '9339833' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9339833' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9339833' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9343121' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9343121' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9343121' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '9343121' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9343121' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9343148' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9343148' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9343148' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9343148' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9343148' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9343148' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9343148' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9343148' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9349898' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9349898' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9349898' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9349898' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9349898' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9360581' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9360581' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9360581' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '9360581' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9406751' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '9406751' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9406751' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9406751' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9406751' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '9406751' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9406751' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9423206' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '9459065' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9459065' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9459065' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9459065' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9459065' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9459065' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9459065' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9460551' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9460551' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_CABECA_PESCOCO' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_CIRURGIA_PEDIATRICA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '9465464' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9465464' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '9472908' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9472908' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9472908' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9472908' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9473645' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9473645' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9473645' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9473645' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '9473645' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9473645' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9488413' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9488413' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9488413' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9488413' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9488413' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9488413' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9488413' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9505946' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9505946' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9505946' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9505946' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9505946' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9505946' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9505946' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9577203' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9577262' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9577262' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9577262' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9618694' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_GERIATRIA' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9624988' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '9632387' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9632387' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9632387' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9632387' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9632387' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9632387' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9632387' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9632387' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9653988' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '9653988' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9653988' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9653988' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9653988' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '9721630' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9721630' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9721630' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_ACUPUNTURA' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '9735151' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9736700' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9736700' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9736700' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9736700' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9736700' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9750371' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9786805' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9786805' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '9786805' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9788409' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9788409' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9788409' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9788409' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9794751' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9794751' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9794751' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9797122' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9797157' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_CIRURGIA_VASCULAR' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
INSERT INTO UNIDADE_SERVICO (id_unidade, id_servico, id_fonte, data_referencia_fonte)
SELECT u.id_unidade, s.id_servico, f.id_fonte, DATE '2026-10-01'
FROM (
  SELECT '9823255' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_HEMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_INFECTOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_NEUROCIRURGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_REUMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9823255' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '9855645' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_NEFROLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_PNEUMOLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9882170' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9902325' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_CIRURGIA_CARDIO' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_DERMATOLOGIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_GASTRO' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_NEUROLOGIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_OTORRINO' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9909923' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '9910123' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9910131' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9961771' cnes, 'ESP_CARDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9961771' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9961771' cnes, 'ESP_ENDOCRINOLOGIA' cod FROM dual
  UNION ALL SELECT '9961771' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9961771' cnes, 'ESP_MEDICINA_TRABALHO' cod FROM dual
  UNION ALL SELECT '9961771' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9961771' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9961771' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9971513' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9971513' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9971513' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9971513' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9971513' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9971513' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9978267' cnes, 'ESP_OFTALMOLOGIA' cod FROM dual
  UNION ALL SELECT '9985026' cnes, 'ESP_GINECOLOGIA' cod FROM dual
  UNION ALL SELECT '9985026' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9985026' cnes, 'ESP_UROLOGIA' cod FROM dual
  UNION ALL SELECT '9986898' cnes, 'ESP_FISIOTERAPIA' cod FROM dual
  UNION ALL SELECT '9986898' cnes, 'ESP_FONOAUDIOLOGIA' cod FROM dual
  UNION ALL SELECT '9986898' cnes, 'ESP_MEDICINA_FAMILIA' cod FROM dual
  UNION ALL SELECT '9986898' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9986898' cnes, 'ESP_PSICOLOGIA' cod FROM dual
  UNION ALL SELECT '9986898' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
  UNION ALL SELECT '9986898' cnes, 'ESP_TERAPIA_OCUPACIONAL' cod FROM dual
  UNION ALL SELECT '9995110' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9997091' cnes, 'ESP_CIRURGIA_GERAL' cod FROM dual
  UNION ALL SELECT '9997091' cnes, 'ESP_CLINICA_MEDICA' cod FROM dual
  UNION ALL SELECT '9997091' cnes, 'ESP_NUTRICAO' cod FROM dual
  UNION ALL SELECT '9997091' cnes, 'ESP_ORTOPEDIA' cod FROM dual
  UNION ALL SELECT '9997091' cnes, 'ESP_PEDIATRIA' cod FROM dual
  UNION ALL SELECT '9997091' cnes, 'ESP_PSIQUIATRIA' cod FROM dual
  UNION ALL SELECT '9997091' cnes, 'ESP_SAUDE_BUCAL' cod FROM dual
) x
JOIN UNIDADE_SAUDE u ON u.codigo_cnes = x.cnes
JOIN SERVICO_SAUDE s ON s.codigo = x.cod
CROSS JOIN FONTE_DADO f
WHERE f.sigla = 'CNES_PF'
  AND NOT EXISTS (SELECT 1 FROM UNIDADE_SERVICO e
                  WHERE e.id_unidade = u.id_unidade AND e.id_servico = s.id_servico);
