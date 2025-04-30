SET FOREIGN_KEY_CHECKS = 0;
-- AlTER TABLE

-- Adicionar coluna de e-mail aos músicos
ALTER TABLE Musicos 
ADD COLUMN email VARCHAR(100) NULL AFTER funcao;

--  Modificar tipo de dados para telefone (adicionando coluna)

ALTER TABLE EnderecoMusico 
ADD COLUMN telefone VARCHAR(20) NULL AFTER complemento;

-- Alterar tamanho do campo nome na tabela Orquestra

ALTER TABLE Orquestra 
MODIFY COLUMN nome VARCHAR(100) NOT NULL;

-- Adicionar índice para busca por nacionalidade de músicos

ALTER TABLE Musicos 
ADD INDEX idx_nacionalidade (nacionalidade);

-- Adiciona uma coluna de data de fundação para orquestras
ALTER TABLE Orquestra 
CHANGE COLUMN data data_fundacao DATE NULL;

-- Adicionar coluna de status ativo para músicos
ALTER TABLE Musicos 
ADD COLUMN ativo TINYINT(1) DEFAULT 1 AFTER funcao;

-- Modificar a coluna de descrição de instrumentos para TEXT
ALTER TABLE Instrumentos 
MODIFY COLUMN `desc` TEXT NULL;

-- adicionando salario para musicos
ALTER TABLE Musicos 
ADD COLUMN salario DECIMAL(10,2) NULL AFTER funcao;

-- adicionando genero musical
ALTER TABLE orquestra
ADD COLUMN genero_principal VARCHAR(50) NULL AFTER país;

-- adicionando data de entrada do musico
ALTER TABLE Musicos
ADD COLUMN data_entrada DATE NULL AFTER datanasc;

ALTER TABLE Musicos 
DROP FOREIGN KEY fk_Musicos_EnderecoMusico;

ALTER TABLE Musicos 
ADD CONSTRAINT fk_Musicos_EnderecoMusico
FOREIGN KEY (EnderecoMusico_id) 
REFERENCES escola_musica.EnderecoMusico (id_musico) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

ALTER TABLE Instrumentos 
DROP FOREIGN KEY fk_Instrumentos_Musicos1;

ALTER TABLE Instrumentos 
ADD CONSTRAINT fk_Instrumentos_Musicos1
FOREIGN KEY (Musicos_id_musico) 
REFERENCES escola_musica.Musicos (id_musico) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION;

ALTER TABLE Musicos 
DROP FOREIGN KEY fk_Musicos_EnderecoMusico;

ALTER TABLE Musicos 
ADD CONSTRAINT fk_Musicos_EnderecoMusico
FOREIGN KEY (EnderecoMusico_id) 
REFERENCES escola_musica.EnderecoMusico (id_musico) 
ON DELETE CASCADE ;


-- adicionando genero
ALTER TABLE Musicos
ADD COLUMN genero CHAR(1) NULL COMMENT 'F para feminino, M para masculino';

ALTER TABLE Musicos MODIFY COLUMN genero CHAR(1) NOT NULL;

ALTER TABLE Instrumentos 
ADD COLUMN valor DECIMAL(10,2) AFTER `desc`;
