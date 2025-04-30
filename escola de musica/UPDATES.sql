-- update
-- mudando a nacionalidade de um musico especifico
UPDATE Musicos 
SET nacionalidade = 'Brasileiro' 
WHERE id_musico = 1;

-- mudando a função do musico
UPDATE Musicos 
SET funcao = 'Violinista' 
WHERE funcao = 'Violinista Experiente' AND Orquestra_id = 1;

-- atualizando uma data de criação do compositor
UPDATE Sinfonias 
SET datacriacao = '1788-07-26' 
WHERE compositor = 'Wolfgang Amadeus Mozart' AND nome LIKE 'Sinfonia nº 40%';

-- atualizando o endereço de um musico
UPDATE EnderecoMusico 
SET cidade = 'São Paulo', bairro = 'Jardins', cep = '01416-001' 
WHERE id_musico = 2;

-- mudando a descrição do instrumento
UPDATE Instrumentos 
SET `desc` = CONCAT(`desc`, ' - Modelo Profissional') 
WHERE id_instrumento BETWEEN 1 AND 5;

-- Atualizando o complemento de endereço para NULL onde está vazio
UPDATE EnderecoMusico 
SET complemento = NULL 
WHERE complemento = '' OR complemento = ' ';

-- atualizando salario de um musico
UPDATE Musicos 
SET salario = salario * 1.1  -- Aumento de 10%
WHERE funcao IN ('Primeiro Violino', 'Spalla');

-- atualizando um nome de um musico especifico
UPDATE Musicos
SET nome = 'Carlos Silva Santos'
WHERE id_musico = 1;

-- atualizando a função do musico
UPDATE Musicos
SET funcao = 'Maestro'
WHERE id_musico = 5;

-- mudando a data de uma sinfonia
UPDATE Sinfonias
SET datacriacao = '1791-03-15'
WHERE id_sinfonia = 16;

DESCRIBE Musicos;

UPDATE Musicos SET salario = 
  CASE 
    WHEN funcao = 'Maestro' THEN 15000.00
    WHEN funcao = 'Pianista' THEN 8000.00
    WHEN funcao = 'Solista' THEN 7000.00
    WHEN funcao = 'Músico Titular' THEN 5000.00
    WHEN funcao = 'Músico Auxiliar' THEN 3500.00
    ELSE 0
  END;
  
  UPDATE Musicos SET salario = 12000.00 WHERE id_musico = 6;  -- Maestro principal
UPDATE Musicos SET salario = 9500.00 WHERE id_musico = 20;   -- Solista destacado

UPDATE Musicos
SET Orquestra_id = 10  -- Substitua pelo ID de uma orquestra válida
WHERE Orquestra_id IN (
    SELECT id FROM Orquestra WHERE data_fundacao < '1900-01-01'
);

-- adicionando genero M
UPDATE Musicos 
SET genero = 'M'
WHERE nome IN ('Carlos Silva', 'Lucas Pereira', 'Pedro Almeida', 'Rafael Souza', 'Gustavo Rocha', 'Daniel Martins', 'Marcos Ferreira', 'Roberto Nunes', 'Eduardo Barros', 'Felipe Cardoso', 'Diego Morales', 'Michael Johnson', 'Giovanni Rossi');

-- adicionando genero feminino
UPDATE Musicos 
SET genero = 'F'
WHERE nome IN ('Ana Oliveira', 'Mariana Santos', 'Juliana Costa', 'Fernanda Lima', 'Patrícia Mendes', 'Camila Gonçalves', 'Tatiana Ramos', 'Vanessa Castro', 'Isabela Teixeira', 'Larissa Moura', 'Camila Fernandes', 'Sophie Dubois', 'Yuki Tanaka', 'Beatriz Costa');

-- adicionando telefone no endereco

UPDATE enderecoMusico 
SET telefone = CASE id_musico
    WHEN 1 THEN '98765-4321'
    WHEN 2 THEN '99876-5432'
    WHEN 3 THEN '98765-1234'
    WHEN 4 THEN '99654-3210'
    WHEN 5 THEN '98765-0001'
    WHEN 6 THEN '99999-8888'
    WHEN 7 THEN '98888-7777'
    WHEN 8 THEN '97777-6666'
    WHEN 9 THEN '96666-5555'
    WHEN 10 THEN '95555-4444'
    WHEN 11 THEN '94444-3333'
    WHEN 12 THEN '93333-2222'
    WHEN 13 THEN '92222-1111'
    WHEN 14 THEN '91111-0000'
    WHEN 15 THEN '90000-9999'
    WHEN 16 THEN '91234-5678'
    WHEN 17 THEN '92345-6789'
    WHEN 18 THEN '93456-7890'
    WHEN 19 THEN '94567-8901'
    WHEN 20 THEN '95678-9012'
    WHEN 21 THEN '96789-0123'
    WHEN 22 THEN '97890-1234'
    WHEN 23 THEN '98901-2345'
    WHEN 24 THEN '99012-3456'
    WHEN 25 THEN '90123-4567'
    WHEN 26 THEN '91234-5670'
    WHEN 27 THEN '92345-6781'
    WHEN 28 THEN '93456-7892'
    WHEN 29 THEN '94567-8903'
    WHEN 30 THEN '95678-9014'
END
WHERE id_musico BETWEEN 1 AND 30;

UPDATE enderecoMusico 
SET cidade = 'Recife' 
WHERE id_musico IN (28, 29);
 
 
 -- adiiconando valor dos instrumentos
UPDATE Instrumentos SET valor = 
CASE id_instrumento
    WHEN 1 THEN 15000000.00  -- Violino Stradivarius
    WHEN 2 THEN 8000000.00   -- Violoncelo Montagnana
    WHEN 3 THEN 5000.00      -- Flauta Transversal Yamaha
    WHEN 4 THEN 150000.00    -- Piano Steinway
    WHEN 5 THEN 3500.00      -- Trompete Bach Stradivarius
    WHEN 6 THEN 10000000.00  -- Violino Guarneri
    WHEN 7 THEN 12000000.00  -- Violoncelo Stradivarius
    WHEN 8 THEN 800.00       -- Flauta Doce Mollenhauer
    WHEN 9 THEN 250000.00    -- Piano Bösendorfer
    WHEN 10 THEN 2800.00     -- Trompete Yamaha
    WHEN 11 THEN 50000.00    -- Violino Francês
    WHEN 12 THEN 60000.00    -- Violoncelo Francês
    WHEN 13 THEN 4500.00     -- Flauta Alemã
    WHEN 14 THEN 120000.00   -- Piano Italiano
    WHEN 15 THEN 3000.00     -- Trompete Americano
    WHEN 16 THEN 20000.00    -- Violino Chinês
    WHEN 17 THEN 35000.00    -- Violoncelo Japonês
    WHEN 18 THEN 6000.00     -- Flauta Japonesa
    WHEN 19 THEN 180000.00   -- Piano Francês
    WHEN 20 THEN 3200.00     -- Trompete Alemão
    WHEN 21 THEN 55000.00    -- Violino Francês
    WHEN 22 THEN 75000.00    -- Violoncelo Italiano
    WHEN 23 THEN 95000.00    -- Piano Yamaha
    WHEN 24 THEN 5200.00     -- Flauta Transversal
    WHEN 25 THEN 3800.00     -- Trompete Bach
    WHEN 26 THEN 150.00      -- Batuta
    WHEN 27 THEN 45000.00    -- Harpa de Concerto
END;