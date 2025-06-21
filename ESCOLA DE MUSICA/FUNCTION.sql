-- FUNCTIONS-- 

--  Function 1 (Classifica se o valor dos salario dos funcionairos é Mínimo, Médio ou Alto.)

DELIMITER //
CREATE FUNCTION fn_classificar_salario(salario DECIMAL(10,2)) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN salario >= 10000 THEN 'Alto'
        WHEN salario >= 4500 THEN 'Médio'
        WHEN salario = 1593.90 THEN 'Básico'
		WHEN salario = 0 THEN 'Alteração pendente'
        ELSE 'Não informado'
    END;
END //
DELIMITER ;

SELECT nome, funcao, salario, fn_classificar_salario(salario) AS nível FROM Musicos;


-- 2. Declarando o valor total de instrumentos em cada orquestra tocada --
DELIMITER //
CREATE FUNCTION valor_instrumentos_orquestra(p_id_orquestra INT) 
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(12,2);
    
    SELECT COALESCE(SUM(i.valor), 0) INTO v_total
    FROM Instrumentos i
    JOIN Musicos m ON i.id_musico = m.id_musico
    WHERE m.Orquestra_id = p_id_orquestra;
    
    RETURN v_total;
END //
DELIMITER ;

SELECT 
    o.id AS 'ID Orquestra',
    o.nome AS 'Nome da Orquestra',
    CONCAT('R$ ',
            FORMAT(VALOR_INSTRUMENTOS_ORQUESTRA(o.id),
                2)) AS 'Valor total dos Instrumentos'
FROM
    Orquestra o;
    
    SELECT nome, valor_instrumentos_orquestra(id) AS total_instrumentos FROM Orquestra;
    
    -- 3. Valor dos instrumentos utilizados nas orquestras

DELIMITER //
CREATE FUNCTION valor_instrumentos_orquestra(id_orquestra INT) 
RETURNS DECIMAL(12,2)
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(12,2);
    
    
    SELECT SUM(i.valor) INTO total
    FROM Instrumentos i
    JOIN Musicos m ON i.Musicos_id_musico = m.id_musico
    WHERE m.Orquestra_id = id_orquestra;
    
    RETURN IFNULL(total, 0);
END //
DELIMITER ;

SELECT nome, valor_instrumentos_orquestra(id) AS total_instrumentos FROM Orquestra;

-- 4. Lista os musicos sêniors

DELIMITER //
CREATE FUNCTION fn_eh_senior(id_musico INT) 
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE anos_experiencia INT;
    DECLARE eh_senior BOOLEAN;
    
    SELECT TIMESTAMPDIFF(YEAR, MIN(data_funcao), CURDATE()) INTO anos_experiencia
    FROM FuncoesMusicos
    WHERE Musicos_id_musico = id_musico;
    
    SET eh_senior = (anos_experiencia >= 10);
    RETURN eh_senior;
END //
DELIMITER ;


SELECT nome, fn_eh_senior(id_musico) AS eh_senior FROM Musicos;



-- 5. Verifica o Compositor Mais Executado --
DELIMITER //
CREATE FUNCTION fn_compositor_mais_executado(p_id_orquestra INT) 
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE v_compositor VARCHAR(100);
    
    SELECT s.compositor INTO v_compositor
    FROM Sinfonias s
    JOIN Orquestra_Sinfonica os ON s.id_sinfonia = os.id_sinfonia
    WHERE os.id_orquestra = p_id_orquestra
    GROUP BY s.compositor
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    
    RETURN IFNULL(v_compositor, 'Nenhuma sinfonia registrada');
END //
DELIMITER ;

SELECT nome, fn_compositor_mais_executado(id) AS compositor_principal FROM Orquestra;


-- 6. CALCULA HÁ QUANTO TEMPO QUE TOCAM NA ORQUESTRA--

DELIMITER //
CREATE FUNCTION fn_tempo_servico(p_id_musico INT) 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE v_anos INT;
    DECLARE v_meses INT;
    
    SELECT 
        TIMESTAMPDIFF(YEAR, data_entrada, CURDATE()),
        TIMESTAMPDIFF(MONTH, data_entrada, CURDATE()) % 12
    INTO v_anos, v_meses
    FROM Musicos
    WHERE id_musico = p_id_musico;
    
    RETURN CONCAT(v_anos, ' anos e ', v_meses, ' meses');
END //
DELIMITER ;

SELECT nome, data_entrada, fn_tempo_servico(id_musico) AS tempo_servico FROM Musicos;


DELIMITER //
CREATE OR REPLACE FUNCTION atualizar_status_orquestra()
RETURNS TRIGGER AS $$
BEGIN
  -- Se depois da remoção, a orquestra não tiver músicos, marca como 'Inativa'
  IF (SELECT COUNT(*) FROM Musicos WHERE Orquestra_id = OLD.Orquestra_id) = 0 THEN
    UPDATE Orquestra SET status = 'Inativa' WHERE id = OLD.Orquestra_id;
  ELSE
    UPDATE Orquestra SET status = 'Ativa' WHERE id = OLD.Orquestra_id;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DELIMITER //