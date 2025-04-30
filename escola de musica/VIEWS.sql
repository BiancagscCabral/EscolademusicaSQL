--  View: Músicos com Instrumentos e Orquestras
CREATE OR REPLACE VIEW vw_musicos_instrumentos_orquestras AS
SELECT 
    m.id_musico,
    m.nome AS musico, 
    i.desc AS instrumento, 
    o.nome AS orquestra,
    o.cidade AS cidade_orquestra
FROM Musicos m
JOIN Instrumentos i ON m.id_musico = i.id_musico
JOIN Orquestra o ON m.Orquestra_id = o.id;

--  View: Músicos em Orquestras Modernas (fundadas após 1950)
CREATE OR REPLACE VIEW vw_musicos_orquestras_modernas AS
SELECT 
    m.nome AS musico,
    m.funcao,
    o.nome AS orquestra, 
    o.data_fundacao,
    TIMESTAMPDIFF(YEAR, o.data_fundacao, CURDATE()) AS anos_orquestra
FROM Musicos m
JOIN Orquestra o ON m.Orquestra_id = o.id
WHERE YEAR(o.data_fundacao) > 1950;

--  View: Repertório Brasileiro
CREATE OR REPLACE VIEW vw_repertorio_brasileiro AS
SELECT 
    s.nome AS sinfonia, 
    s.compositor, 
    s.datacriacao,
    o.nome AS orquestra,
    o.cidade
FROM Sinfonias s
JOIN Orquestra_Sinfonica os ON s.id_sinfonia = os.id_sinfonia
JOIN Orquestra o ON os.id_orquestra = o.id
WHERE o.país = 'Brasil'
ORDER BY s.datacriacao DESC;

--  View: Músicos Residentes (moram na mesma cidade da orquestra)
CREATE OR REPLACE VIEW vw_musicos_residentes AS
SELECT 
    m.nome AS musico,
    m.funcao,
    em.cidade,
    o.nome AS orquestra,
    em.rua,
    em.bairro
FROM Musicos m
JOIN EnderecoMusico em ON m.id_musico = em.id_musico
JOIN Orquestra o ON m.Orquestra_id = o.id
WHERE em.cidade = o.cidade;

--  View: Sinfonias Mais Recentes por Orquestra (corrigido com ordenação)
CREATE OR REPLACE VIEW vw_sinfonias_recentes AS
SELECT 
    o.nome AS orquestra, 
    s.nome AS sinfonia, 
    s.datacriacao,
    s.compositor,
    DATEDIFF(CURDATE(), s.datacriacao) AS dias_desde_criacao
FROM Orquestra o
JOIN Orquestra_Sinfonica os ON o.id = os.id_orquestra
JOIN Sinfonias s ON os.id_sinfonia = s.id_sinfonia
WHERE s.datacriacao = (
    SELECT MAX(s2.datacriacao)
    FROM Sinfonias s2
    JOIN Orquestra_Sinfonica os2 ON s2.id_sinfonia = os2.id_sinfonia
    WHERE os2.id_orquestra = o.id
)
ORDER BY s.datacriacao DESC;

--  View: Histórico de Mudanças de Função
CREATE OR REPLACE VIEW vw_historico_funcoes AS
SELECT 
    m.nome AS musico,
    fm.data_funcao,
    fm.id_musico AS funcao_anterior, 
    m.funcao AS funcao_atual,
    TIMESTAMPDIFF(DAY, fm.data_funcao, CURDATE()) AS dias_desde_mudanca
FROM Musicos m
JOIN FuncoesMusicos fm ON m.id_musico = fm.id_musico
WHERE fm.id_musico <> m.funcao
ORDER BY fm.data_funcao DESC;

--  View: Instrumentos Mais Raros
CREATE OR REPLACE VIEW vw_instrumentos_raros AS
SELECT 
    i.desc AS instrumento, 
    COUNT(m.id_musico) AS total_musicos,
    GROUP_CONCAT(m.nome SEPARATOR ', ') AS musicos
FROM Instrumentos i
LEFT JOIN Musicos m ON i.id_musico = m.id_musico
GROUP BY i.desc
HAVING total_musicos < 3
ORDER BY total_musicos, instrumento;

--  View: Músicos Violinistas
CREATE OR REPLACE VIEW vw_violinistas AS
SELECT 
    m.nome,
    m.funcao,
    o.nome AS orquestra,
    i.desc AS instrumento,
    TIMESTAMPDIFF(YEAR, m.datanasc, CURDATE()) AS idade
FROM Musicos m
JOIN Instrumentos i ON m.id_musico = i.id_musico
JOIN Orquestra o ON m.Orquestra_id = o.id
WHERE i.desc LIKE '%Violino%'
ORDER BY m.nome;

-- View: Perfil Salarial por Função 
CREATE OR REPLACE VIEW vw_perfil_salarial AS
SELECT 
    m.funcao,
    COUNT(*) AS total_musicos,
    CONCAT('R$ ', FORMAT(MIN(m.salario), 2)) AS menor_salario,
    CONCAT('R$ ', FORMAT(AVG(m.salario), 2)) AS media_salarial,
    CONCAT('R$ ', FORMAT(MAX(m.salario), 2)) AS maior_salario
FROM 
    Musicos m
WHERE 
    m.salario IS NOT NULL
GROUP BY 
    m.funcao
ORDER BY 
    AVG(m.salario) DESC;
    
    
    -- View: Músicos Jovens
CREATE OR REPLACE VIEW vw_musicos_jovens AS
SELECT 
    m.nome,
    m.datanasc,
    TIMESTAMPDIFF(YEAR, m.datanasc, CURDATE()) AS idade,
    m.funcao,
    o.nome AS orquestra
FROM 
    Musicos m
JOIN 
    Orquestra o ON m.Orquestra_id = o.id
WHERE 
    m.datanasc > '1990-12-31'
ORDER BY 
    m.datanasc DESC;