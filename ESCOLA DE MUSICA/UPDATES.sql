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
UPDATE Instrumentos 
SET valor = CASE id_instrumento
    WHEN 1 THEN 250000.00   -- Violino Stradivarius (R$ 250.000)
    WHEN 2 THEN 180000.00   -- Violoncelo Montagnana (R$ 180.000)
    WHEN 3 THEN 8500.00     -- Flauta Transversal Yamaha (R$ 8.500)
    WHEN 4 THEN 120000.00   -- Piano Steinway (R$ 120.000)
    WHEN 5 THEN 12500.00    -- Trompete Bach Stradivarius (R$ 12.500)
    WHEN 6 THEN 220000.00   -- Violino Guarneri (R$ 220.000)
    WHEN 7 THEN 190000.00   -- Violoncelo Stradivarius (R$ 190.000)
    WHEN 8 THEN 1500.00     -- Flauta Doce Mollenhauer (R$ 1.500)
    WHEN 9 THEN 150000.00   -- Piano Bösendorfer (R$ 150.000)
    WHEN 10 THEN 8000.00    -- Trompete Yamaha (R$ 8.000)
    WHEN 11 THEN 45000.00   -- Violino Francês (R$ 45.000)
    WHEN 12 THEN 65000.00   -- Violoncelo Francês (R$ 65.000)
    WHEN 13 THEN 6000.00    -- Flauta Alemã (R$ 6.000)
    WHEN 14 THEN 95000.00   -- Piano Italiano (R$ 95.000)
    WHEN 15 THEN 9000.00    -- Trompete Americano (R$ 9.000)
    WHEN 16 THEN 15000.00   -- Violino Chinês (R$ 15.000)
    WHEN 17 THEN 28000.00   -- Violoncelo Japonês (R$ 28.000)
    WHEN 18 THEN 7500.00    -- Flauta Japonesa (R$ 7.500)
    WHEN 19 THEN 110000.00  -- Piano Francês (R$ 110.000)
    WHEN 20 THEN 8500.00    -- Trompete Alemão (R$ 8.500)
    WHEN 21 THEN 38000.00   -- Violino Francês (R$ 38.000)
    WHEN 22 THEN 42000.00   -- Violoncelo Italiano (R$ 42.000)
    WHEN 23 THEN 75000.00   -- Piano Yamaha (R$ 75.000)
    WHEN 24 THEN 5500.00    -- Flauta Transversal (R$ 5.500)
    WHEN 25 THEN 11000.00   -- Trompete Bach (R$ 11.000)
    WHEN 26 THEN 300.00     -- Batuta (R$ 300)
    WHEN 27 THEN 32000.00   -- Harpa de Concerto (R$ 32.000)
    ELSE valor
END;


-- Atualizar tabela EnderecoMusico para formato internacional de telefone
UPDATE EnderecoMusico SET telefone = CONCAT('+55 ', telefone) 
WHERE telefone IS NOT NULL AND telefone NOT LIKE '+%';

-- Adicionar validação para e-mail na tabela Musicos
ALTER TABLE Musicos 
MODIFY COLUMN email VARCHAR(100) CHECK (email LIKE '%@%.%');

-- Atualizar os instrumentos existentes com suas categorias
UPDATE Instrumentos i SET id_tipo = 
    CASE 
        WHEN i.desc LIKE '%Violino%' THEN 1 
        WHEN i.desc LIKE '%Violoncelo%' THEN 1
        WHEN i.desc LIKE '%Flauta%' THEN 3
        WHEN i.desc LIKE '%Trompete%' THEN 4
        WHEN i.desc LIKE '%Piano%' THEN 6
        WHEN i.desc LIKE '%Harpa%' THEN 2
        ELSE 5
    END;
    
    -- Atualizar salários baseados na função e experiência
UPDATE Musicos m
JOIN (
    SELECT id_musico, TIMESTAMPDIFF(YEAR, MIN(data_funcao), CURDATE()) AS anos_experiencia
    FROM FuncoesMusicos 
    GROUP BY id_musico
) exp ON m.id_musico = exp.id_musico
SET m.salario = 
    CASE m.funcao
        WHEN 'Violinista' THEN 5000 + (exp.anos_experiencia * 300)
        WHEN 'Violoncelista' THEN 4500 + (exp.anos_experiencia * 280)
        WHEN 'Pianista' THEN 6000 + (exp.anos_experiencia * 350)
        WHEN 'Trompetista' THEN 4800 + (exp.anos_experiencia * 250)
        WHEN 'Flautista' THEN 4200 + (exp.anos_experiencia * 200)
        ELSE 4000
    END;
    
    UPDATE Instrumentos
SET valor = 
    CASE 
        WHEN `desc` LIKE '%Stradivarius%' THEN 250000.00
        WHEN `desc` LIKE '%Francês%' THEN 180000.00
        WHEN `desc` LIKE '%Steinway%' THEN 150000.00
        WHEN `desc` LIKE '%Yamaha%' THEN 80000.00
        WHEN `desc` LIKE '%Bach%' THEN 70000.00
        ELSE 30000.00
    END
WHERE valor IS NULL OR valor = 0;

-- adicionando data de entrada dos musicos --

UPDATE Musicos SET data_entrada = 
    CASE id_musico
        WHEN 1 THEN '2015-03-15'  -- Carlos Silva
        WHEN 2 THEN '2017-08-22'  -- Ana Oliveira
        WHEN 3 THEN '2014-05-10'  -- Lucas Pereira
        WHEN 4 THEN '2018-11-30'  -- Mariana Santos
        WHEN 5 THEN '2013-09-18'  -- Pedro Almeida
        WHEN 6 THEN '2019-04-25'  -- Juliana Costa
        WHEN 7 THEN '2012-07-12'  -- Rafael Souza
        WHEN 8 THEN '2016-12-05'  -- Fernanda Lima
        WHEN 9 THEN '2015-06-20'  -- Gustavo Rocha
        WHEN 10 THEN '2020-01-15' -- Patrícia Mendes
        WHEN 11 THEN '2014-10-08' -- Daniel Martins
        WHEN 12 THEN '2017-07-22' -- Camila Gonçalves
        WHEN 13 THEN '2013-03-30' -- Marcos Ferreira
        WHEN 14 THEN '2018-08-17' -- Tatiana Ramos
        WHEN 15 THEN '2011-05-24' -- Roberto Nunes
        WHEN 16 THEN '2019-02-11' -- Vanessa Castro
        WHEN 17 THEN '2016-09-28' -- Eduardo Barros
        WHEN 18 THEN '2018-06-14' -- Isabela Teixeira
        WHEN 19 THEN '2012-12-03' -- Felipe Cardoso
        WHEN 20 THEN '2019-04-19' -- Larissa Moura
        WHEN 21 THEN '2021-06-18' -- Andrew Kaue
        WHEN 22 THEN '2019-08-25' -- Miguel Ramos
        WHEN 23 THEN '2020-08-08' -- Bianca Guimarães
    END
WHERE id_musico BETWEEN 1 AND 23;

-- adicionando email dos musicos--
UPDATE Musicos SET email = 
    CASE id_musico
        WHEN 1 THEN 'carlos.silva@orquestra.com.br'       -- Carlos Silva Santos
        WHEN 2 THEN 'ana.oliveira@orquestra.com.br'       -- Ana Oliveira
        WHEN 3 THEN 'lucas.pereira@orquestra.com.br'      -- Lucas Pereira
        WHEN 4 THEN 'mariana.santos@orquestra.com.br'     -- Mariana Santos
        WHEN 5 THEN 'pedro.almeida@orquestra.com.br'      -- Pedro Almeida
        WHEN 6 THEN 'juliana.costa@orquestra.com.br'      -- Juliana Costa
        WHEN 7 THEN 'rafael.souza@orquestra.com.br'       -- Rafael Souza
        WHEN 8 THEN 'fernanda.lima@orquestra.com.br'      -- Fernanda Lima
        WHEN 9 THEN 'gustavo.rocha@orquestra.com.br'      -- Gustavo Rocha
        WHEN 10 THEN 'patricia.mendes@orquestra.com.br'   -- Patrícia Mendes
        WHEN 11 THEN 'daniel.martins@orquestra.com.br'    -- Daniel Martins
        WHEN 12 THEN 'camila.goncalves@orquestra.com.br'  -- Camila Gonçalves
        WHEN 13 THEN 'marcos.ferreira@orquestra.com.br'   -- Marcos Ferreira
        WHEN 14 THEN 'tatiana.ramos@orquestra.com.br'     -- Tatiana Ramos
        WHEN 15 THEN 'roberto.nunes@orquestra.com.br'     -- Roberto Nunes
        WHEN 16 THEN 'vanessa.castro@orquestra.com.br'    -- Vanessa Castro
        WHEN 17 THEN 'eduardo.barros@orquestra.com.br'    -- Eduardo Barros
        WHEN 18 THEN 'isabela.teixeira@orquestra.com.br'  -- Isabela Teixeira
        WHEN 19 THEN 'felipe.cardoso@orquestra.com.br'    -- Felipe Cardoso
        WHEN 20 THEN 'larissa.moura@orquestra.com.br'     -- Larissa Moura
        WHEN 21 THEN 'andrew.kaue@orquestra.com.br'       -- Andrew Kaue
        WHEN 22 THEN 'miguel.ramos@orquestra.com.br'      -- Miguel Ramos
        WHEN 23 THEN 'bianca.guimaraes@orquestra.com.br'  -- Bianca Guimarães
    END
WHERE id_musico BETWEEN 1 AND 23;

-- gêneros de acordo com cada orquestra -- 
UPDATE Orquestra SET genero_principal = 
    CASE nome
        WHEN 'Filarmônica de Berlim' THEN 'Clássico'
        WHEN 'Orquestra Sinfônica de Viena' THEN 'Clássico'
        WHEN 'Orquestra do Concertgebouw' THEN 'Clássico/Romântico'
        WHEN 'Filarmônica de Nova York' THEN 'Sinfônico'
        WHEN 'Orquestra Sinfônica de Chicago' THEN 'Sinfônico'
        WHEN 'Orquestra Filarmônica de Londres' THEN 'Clássico/Moderno'
        WHEN 'Orquestra Sinfônica de Boston' THEN 'Sinfônico'
        WHEN 'Orquestra Filarmônica de São Petersburgo' THEN 'Romântico'
        WHEN 'Orquestra Sinfônica da Rádio Bavária' THEN 'Clássico'
        WHEN 'Orquestra Sinfônica de São Paulo' THEN 'Brasileiro/Clássico'
        WHEN 'Orquestra Sinfônica Brasileira' THEN 'Brasileiro/Clássico'
        WHEN 'Orquestra Filarmônica de Paris' THEN 'Clássico/Francês'
        WHEN 'Orquestra Sinfônica de Montreal' THEN 'Clássico/Contemporâneo'
        WHEN 'Orquestra Sinfônica de Sydney' THEN 'Clássico/Australiano'
        WHEN 'Orquestra Filarmônica Real' THEN 'Clássico/Nórdico'
        WHEN 'Orquestra Sinfônica de Tóquio' THEN 'Clássico/Japonês'
        WHEN 'Orquestra Sinfônica de Seul' THEN 'Clássico/Coreano'
        WHEN 'Orquestra Filarmônica de Israel' THEN 'Clássico/Judaico'
        WHEN 'Orquestra Sinfônica Nacional da China' THEN 'Clássico/Chinês'
        WHEN 'Orquestra Sinfônica de Minas Gerais' THEN 'Brasileiro/Clássico'
        ELSE 'Clássico' -- Valor padrão para orquestras não listadas
    END;
    
    UPDATE Orquestra
SET status = 'Inativa'
WHERE id = 999 AND NOT EXISTS (
    SELECT 1 FROM Musicos WHERE Orquestra_id = 999
);


UPDATE Orquestra
SET nome = 'Orquestra PE'
WHERE id = 999;