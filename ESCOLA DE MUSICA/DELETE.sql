-- comandos de deletar

-- remover musicos inativos
DELETE FROM Musicos 
WHERE ativo = 0;

--  Remover orquestras fundadas antes de 1900
DELETE FROM Orquestra 
WHERE data_fundacao < '1900-01-01';

-- Remover instrumentos não associados a músicos
DELETE FROM Instrumentos 
WHERE id_musico IS NULL;

-- Remover funções de músicos antes de 2020
DELETE FROM FuncoesMusicos 
WHERE data_funcao < '2020-01-01';

-- Remover músicos sem orquestra
DELETE FROM Musicos 
WHERE Orquestra_id NOT IN (SELECT id FROM Orquestra);

DELETE FROM Instrumentos
WHERE Musicos_id_musico IN (
    SELECT id_musico FROM Musicos WHERE salario < 2000
);

-- Remover musicos com salario abaixo de 2000
DELETE FROM Musicos 
WHERE salario < 2000;

-- Remover orquestras sem músicos
DELETE FROM Orquestra 
WHERE id NOT IN (SELECT DISTINCT Orquestra_id FROM Musicos);

-- remove musicos sem endereço
DELETE FROM Musicos 
WHERE EnderecoMusico_id NOT IN (SELECT id_musico FROM EnderecoMusico);


-- Remover orquestras de São Paulo
DELETE FROM Orquestra 
WHERE cidade = 'São Paulo';

-- remover endereços sem cep
DELETE FROM EnderecoMusico 
WHERE cep IS NULL OR cep = '';

