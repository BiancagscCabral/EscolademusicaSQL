-- Trigger-- 


-- 1. Validar salário mínimo -- 

DELIMITER //
CREATE TRIGGER validar_salario_minimo
BEFORE INSERT ON Musicos  -- Aciona ANTES de inserir um novo registro em Musicos
FOR EACH ROW             -- Executa para CADA nova linha inserida
BEGIN
    -- Verifica se o salário é menor que 2000
    IF NEW.salario < 2000 THEN  -- NEW refere-se ao registro que está sendo inserido
        SIGNAL SQLSTATE '45000'  -- Código de erro para erros personalizados
        SET MESSAGE_TEXT = 'Salário não pode ser inferior a R$ 2.000,00';
    END IF;
END //
DELIMITER ;
--  Garante que nenhum músico seja inserido com salário abaixo do mínimo

select * from Musicos  validar_salario_minimo;

-- 2. Registrar Histórico de Funções --

DELIMITER //
CREATE TRIGGER registrar_historico_funcao
AFTER UPDATE ON Musicos  -- Aciona APÓS atualizar um registro em Musicos
FOR EACH ROW            -- Executa para CADA linha atualizada
BEGIN
    -- Verifica se a função foi alterada
    IF OLD.funcao != NEW.funcao THEN  -- Compara valor antigo (OLD) com novo (NEW)
        -- Insere registro histórico
        INSERT INTO FuncoesMusicos (id_musico, data_funcao, Musicos_id_musico)
        VALUES (OLD.id_musico, NOW(), OLD.id_musico);
    END IF;
END //
DELIMITER ;

select * from Musicos registrar_historico_funcao;

--  Cria um registro toda vez que a função de um músico muda


-- 3. Impede Exclusão de Músico com Instrumentos -- 

DELIMITER //
CREATE TRIGGER impedir_exclusao_musico_com_instrumentos
BEFORE DELETE ON Musicos  -- Aciona ANTES de deletar um registro em Musicos
FOR EACH ROW             -- Executa para CADA linha afetada
BEGIN
    -- Declara variável para armazenar a contagem
    DECLARE total_instrumentos INT;
    
    -- Conta quantos instrumentos estão associados ao músico que será excluído
    SELECT COUNT(*) INTO total_instrumentos
    FROM Instrumentos
    WHERE Musicos_id_musico = OLD.id_musico;  -- OLD refere-se ao registro que será excluído
    
    -- Se houver instrumentos associados, cancela a operação
    IF total_instrumentos > 0 THEN
        SIGNAL SQLSTATE '45000'  -- Código de erro específico para erros personalizados
        SET MESSAGE_TEXT = 'Não é possível excluir músico com instrumentos associados';
    END IF;
END //
DELIMITER ;

select * from Musicos impedir_exclusao_musico_com_instrumentos;

--  Ele verifica se o músico que está sendo excluído possui instrumentos associados a ele na tabela Instrumentos. 
-- se tiver instrumentos, da erro, se não tiver ele deletará o musico normalmente.


-- 4.Essa Trigger preenche automaticamente o complemento como "Sem complemento" se vier vazio (sem informação no endereço do musico)


DELIMITER //

CREATE TRIGGER trg_complemento_padrao
BEFORE INSERT ON EnderecoMusico
FOR EACH ROW
BEGIN
    IF NEW.complemento IS NULL OR TRIM(NEW.complemento) = '' THEN
        SET NEW.complemento = 'Sem complemento';
    END IF;
END;
//

DELIMITER ;

SELECT * FROM EnderecoMusico WHERE id_musico = 1000; -- teste para demonstração --


-- 5. Ajusta o telefone de futuros cadastrados para padrão internaiconal

DELIMITER //

CREATE TRIGGER trg_ajustar_telefone
BEFORE INSERT ON EnderecoMusico
FOR EACH ROW
BEGIN
    IF NEW.telefone IS NOT NULL AND LEFT(NEW.telefone, 3) <> '+55' THEN
        SET NEW.telefone = CONCAT('+55 ', NEW.telefone);
    END IF;
END;
//

DELIMITER ;

SELECT * FROM EnderecoMusico WHERE id_musico = 1002; -- teste de funcionamento da trigger -- 

-- 6.  Trigger que automaticamente deixa a orquestra como "Inativa" se não tiver músicos participando mais.

DELIMITER //

CREATE TRIGGER trg_orquestra_sem_musicos
AFTER DELETE ON Musicos
FOR EACH ROW
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM Musicos
    WHERE Orquestra_id = OLD.Orquestra_id;

    IF total = 0 THEN
        UPDATE Orquestra
        SET status = 'Inativa'
        WHERE id = OLD.Orquestra_id;
    END IF;
END;
//

DELIMITER ;

DELETE FROM Musicos WHERE Orquestra_id = 999;

SELECT nome, status FROM Orquestra WHERE id = 999;
