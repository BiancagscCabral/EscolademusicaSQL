-- Procedure--

--  1 Atualização Salarial Anual -- 
DELIMITER //
CREATE PROCEDURE sp_reajuste_salarial(IN percentual DECIMAL(5,2))
BEGIN
    UPDATE Musicos 
    SET salario = salario * (1 + (percentual/100))
    WHERE salario IS NOT NULL;
    
    SELECT CONCAT('Reajuste de ', percentual, '% aplicado com sucesso!') AS resultado;
END //
DELIMITER ;

CALL sp_reajuste_salarial(5.0);



-- 2 Troca de instrumento --

DELIMITER //
CREATE PROCEDURE sp_trocar_instrumento(
    IN p_id_musico INT,
    IN p_novo_instrumento VARCHAR(45),
    IN p_valor DECIMAL(10,2),
    IN p_id_tipo INT
)
BEGIN
    DECLARE old_instrumento VARCHAR(45);
    
    SELECT `desc` INTO old_instrumento FROM Instrumentos WHERE id_musico = p_id_musico;
    
    UPDATE Instrumentos 
    SET 
        `desc` = p_novo_instrumento,
        valor = p_valor,
        id_tipo = p_id_tipo
    WHERE id_musico = p_id_musico;
    
    SELECT CONCAT('Instrumento trocado de "', old_instrumento, '" para "', p_novo_instrumento, '"') AS resultado;
END //
DELIMITER ;

CALL sp_trocar_instrumento(1, 'Violino Stradivarius Premium', 120000.00, 1);



-- 3 Aicionar salário mínimo pra quem tem salario igual a null --


DELIMITER //
CREATE PROCEDURE add_salario_fixo() 
MODIFIES SQL DATA
BEGIN
    -- Adiciona 1518 apenas a salários existentes (nulos)
    UPDATE musicos 
    SET salario = 1518 
    WHERE salario = 0;
END //
DELIMITER ;

call add_salario_fixo();


-- 4. Promoção de função e salário de um músico --

DELIMITER //
CREATE PROCEDURE sp_promover_musico(
    IN p_id_musico INT,
    IN p_nova_funcao VARCHAR(45),
    IN p_aumento_percentual DECIMAL(5,2)
)
BEGIN
    DECLARE v_salario_atual DECIMAL(10,2);
    DECLARE v_novo_salario DECIMAL(10,2);
    
    -- salário atual
    SELECT salario INTO v_salario_atual FROM Musicos WHERE id_musico = p_id_musico;
    
    -- novo salário
    SET v_novo_salario = v_salario_atual * (1 + (p_aumento_percentual/100));
    
    -- Atualizar função e salário
    UPDATE Musicos 
    SET funcao = p_nova_funcao,
        salario = v_novo_salario
    WHERE id_musico = p_id_musico;
    
    -- Registrar mudança 
    INSERT INTO FuncoesMusicos (id_musico, data_funcao, Musicos_id_musico)
    VALUES (p_id_musico, CURDATE(), p_id_musico);
    
    -- Retornar informações da promoção
    SELECT 
        CONCAT('Músico promovido para: ', p_nova_funcao) AS nova_funcao,
        CONCAT('Salário anterior: R$ ', FORMAT(v_salario_atual, 2)) AS salario_anterior,
        CONCAT('Novo salário: R$ ', FORMAT(v_novo_salario, 2)) AS novo_salario,
        CONCAT('Aumento: ', p_aumento_percentual, '%') AS percentual_aumento;
END //
DELIMITER ;

CALL sp_promover_musico(1, 'Maestro Assistente', 15.0);

-- 5. Procedure para Aumento Salarial Geral

DELIMITER //
CREATE PROCEDURE aumento_salarial(IN porcentagem DECIMAL(5,2))
BEGIN
    UPDATE Musicos 
    SET salario = salario * (1 + porcentagem/100)
    WHERE salario IS NOT NULL;
    
    SELECT CONCAT('Aumento de ', porcentagem, '% aplicado a ', ROW_COUNT(), ' músicos') AS resultado;
END //
DELIMITER ;


CALL aumento_salarial(5.0); -- 5% de aumento

-- 6. Procedure para Listar Sinfonias por Compositor

DELIMITER //
CREATE PROCEDURE listar_sinfonias(IN compositor VARCHAR(45))
BEGIN
    SELECT 
        s.nome AS Sinfonia,
        s.compositor AS Compositor,
        s.datacriacao AS "Data Criação",
        o.nome AS Orquestra
    FROM 
        Sinfonias s
        LEFT JOIN Orquestra_Sinfonica os ON s.id_sinfonia = os.id_sinfonia
        LEFT JOIN Orquestra o ON os.id_orquestra = o.id
    WHERE 
        compositor IS NULL OR s.compositor LIKE CONCAT('%', compositor, '%')
    ORDER BY 
        s.datacriacao DESC;
END //
DELIMITER ;

CALL listar_sinfonias(NULL);
CALL listar_sinfonias('Beethoven'); -- e os outros compositores que estão presentes no banco de dados --




-- 

