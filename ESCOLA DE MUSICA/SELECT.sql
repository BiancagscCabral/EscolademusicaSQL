-- Relatórios
--  Lista de músicos com seus instrumentos e orquestras 
SELECT m.nome AS Musico, i.desc AS Instrumento, o.nome AS Orquestra
FROM Musicos m
JOIN Instrumentos i ON m.id_musico = i.id_musico
JOIN Orquestra o ON m.Orquestra_id = o.id;

-- Músicos que tocam em orquestras fundadas após 1950 
SELECT m.nome, m.funcao, o.nome AS Orquestra, o.data_fundacao
FROM Musicos m
JOIN Orquestra o ON m.Orquestra_id = o.id
WHERE o.id IN (
    SELECT id FROM Orquestra WHERE YEAR(data_fundacao) > 1950
);

-- Sinfonias apenas de orquestras brasileiras
SELECT s.nome AS Sinfonia, s.compositor, o.nome AS Orquestra
FROM Sinfonias s
JOIN Orquestra_Sinfonica os ON s.id_sinfonia = os.id_sinfonia
JOIN Orquestra o ON os.id_orquestra = o.id
WHERE o.país = 'Brasil';

-- músicos que moram na mesma cidade da orquestra
SELECT m.nome AS Musico, em.cidade, o.nome AS Orquestra
FROM Musicos m
JOIN EnderecoMusico em ON m.id_musico = em.id_musico
JOIN Orquestra o ON m.Orquestra_id = o.id
WHERE em.cidade = o.cidade;



-- Orquestras e sinfonias mais recentes (ele não tá botando na ordem ?)
SELECT o.nome AS Orquestra, s.nome AS Sinfonia, s.datacriacao
FROM Orquestra o
JOIN Orquestra_Sinfonica os ON o.id = os.id_orquestra
JOIN Sinfonias s ON os.id_sinfonia = s.id_sinfonia
WHERE s.datacriacao = (
    SELECT MAX(s2.datacriacao)
    FROM Sinfonias s2
    JOIN Orquestra_Sinfonica os2 ON s2.id_sinfonia = os2.id_sinfonia
    WHERE os2.id_orquestra = o.id
);

-- musicos que mudaram de função
SELECT m.nome, fm.data_funcao, fm.id_musico AS Funcao_Anterior, m.funcao AS Funcao_Atual
FROM Musicos m
JOIN FuncoesMusicos fm ON m.id_musico = fm.id_musico
WHERE fm.id_musico <> m.funcao;

-- média de musicos por orquestra
SELECT AVG(contagem) AS Media_Musicos_Por_Orquestra
FROM (
    SELECT COUNT(*) AS contagem
    FROM Musicos
    GROUP BY Orquestra_id
) AS contagens;

-- Relação completa de músicos, instrumentos, funções e sinfonias 
SELECT m.nome AS Musico, m.funcao, i.desc AS Instrumento, 
       o.nome AS Orquestra, s.nome AS Sinfonia, s.compositor
FROM Musicos m
JOIN Instrumentos i ON m.id_musico = i.id_musico
JOIN Orquestra o ON m.Orquestra_id = o.id
LEFT JOIN Orquestra_Sinfonica os ON o.id = os.id_orquestra
LEFT JOIN Sinfonias s ON os.id_sinfonia = s.id_sinfonia
ORDER BY o.nome, m.nome;

-- Composições mais populares entre as orquestras
SELECT s.nome, s.compositor, COUNT(os.id_orquestra) AS qtd_orquestras
FROM Sinfonias s
JOIN Orquestra_Sinfonica os ON s.id_sinfonia = os.id_sinfonia
GROUP BY s.id_sinfonia
ORDER BY qtd_orquestras DESC
LIMIT 5;

-- nome/função e salário (falta colocar salário)
SELECT m.nome, m.funcao, m.salario
FROM Musicos m
WHERE m.salario = (
    SELECT MAX(salario) 
    FROM Musicos 
    WHERE funcao = m.funcao
);

-- Relação de idade dos músicos por orquestra  
SELECT o.nome AS orquestra, 
       AVG(TIMESTAMPDIFF(YEAR, m.datanasc, CURDATE())) AS idade_media,
       MIN(TIMESTAMPDIFF(YEAR, m.datanasc, CURDATE())) AS mais_jovem,
       MAX(TIMESTAMPDIFF(YEAR, m.datanasc, CURDATE())) AS mais_velho
FROM Orquestra o
JOIN Musicos m ON o.id = m.Orquestra_id
GROUP BY o.id;


-- Instrumentos mais caros, por musico e orquestra
SELECT 
    m.nome AS 'Músico',
    i.desc AS 'Instrumento',
    CONCAT('R$ ', FORMAT(i.valor, 2, 'pt_BR')) AS 'Valor',
    o.nome AS 'Orquestra',
    em.cidade AS 'Localização'
FROM 
    Instrumentos i
JOIN 
    Musicos m ON i.Musicos_id_musico = m.id_musico
JOIN 
    Orquestra o ON m.Orquestra_id = o.id
JOIN 
    EnderecoMusico em ON m.id_musico = em.id_musico
ORDER BY 
    i.valor DESC
LIMIT 10;


-- Tipos de instrumentos, quantidade e valor total da soma deles de cada tipo
SELECT 
    CASE 
        WHEN `desc` LIKE '%Violino%' THEN 'Violino'
        WHEN `desc` LIKE '%Violoncelo%' THEN 'Violoncelo'
        WHEN `desc` LIKE '%Piano%' THEN 'Piano'
        WHEN `desc` LIKE '%Flauta%' THEN 'Flauta'
        WHEN `desc` LIKE '%Trompete%' THEN 'Trompete'
        ELSE 'Outros'
    END AS tipo_instrumento,
    COUNT(*) AS quantidade,
    CONCAT('R$ ', FORMAT(SUM(valor), 2, 'pt_BR')) AS valor_total
FROM 
    Instrumentos
GROUP BY 
    tipo_instrumento
ORDER BY 
    SUM(valor) DESC;

-- Instrumentos mais raros 

SELECT i.desc AS instrumento, COUNT(DISTINCT m.id_musico) AS qtd_musicos
FROM Instrumentos i
LEFT JOIN Musicos m ON i.id_musico = m.id_musico
GROUP BY i.desc
HAVING qtd_musicos < 3
ORDER BY qtd_musicos;


-- Nome/Gênero de cada musico
SELECT nome, genero 
FROM Musicos 
ORDER BY nome;

-- Nome/ nacionalidade/ idade e função
SELECT 
    nome AS 'Nome do Músico',
    nacionalidade AS 'Nacionalidade',
    TIMESTAMPDIFF(YEAR, datanasc, CURDATE()) AS 'Idade',
    funcao AS 'Função'
FROM 
    Musicos
ORDER BY 
    nome ASC;
    
    -- Função/ instrumento que toca e o salário
    SELECT 
    m.funcao AS 'Função',
    i.desc AS 'Instrumento',
    CONCAT('R$ ', FORMAT(m.salario, 2, 'pt_BR')) AS 'Salário'
FROM 
    Musicos m
JOIN 
    Instrumentos i ON m.id_musico = i.id_musico
WHERE 
    m.salario IS NOT NULL
ORDER BY 
    m.funcao, i.desc;
    
    -- quantos musicos tocam violino
    SELECT m.nome 
FROM Musicos m
JOIN Instrumentos i ON m.id_musico = i.id_musico
WHERE i.desc LIKE '%Violino%';

-- musicos que nasceram depois de 1990
SELECT nome, datanasc 
FROM Musicos 
WHERE datanasc > '1990-12-31';

-- Média dos intrumentos mais usados
SELECT i.desc, COUNT(*) AS total
FROM Instrumentos i
GROUP BY i.desc
ORDER BY total DESC;
    

  
  