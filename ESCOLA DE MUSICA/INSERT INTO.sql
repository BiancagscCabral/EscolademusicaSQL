

INSERT INTO Orquestra_Sinfonica (id_orquestra, id_sinfonia) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15), (16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

INSERT INTO orquestra (nome, cidade, país, data_fundacao, Orquestra_Sinfonica_id) VALUES 
('Filarmônica de Berlim', 'Berlim', 'Alemanha', '1882-05-01', 1),
('Orquestra Sinfônica de Viena', 'Viena', 'Áustria', '1842-11-28', 2),
('Orquestra do Concertgebouw', 'Amsterdã', 'Holanda', '1888-11-03', 3),
('Filarmônica de Nova York', 'Nova York', 'EUA', '1842-12-07', 4),
('Orquestra Sinfônica de Chicago', 'Chicago', 'EUA', '1891-10-16', 5),
('Orquestra Filarmônica de Londres', 'Londres', 'Reino Unido', '1932-10-07', 6),
('Orquestra Sinfônica de Boston', 'Boston', 'EUA', '1881-10-22', 7),
('Orquestra Filarmônica de São Petersburgo', 'São Petersburgo', 'Rússia', '1882-07-16', 8),
('Orquestra Sinfônica da Rádio Bavária', 'Munique', 'Alemanha', '1949-07-01', 9),
('Orquestra Sinfônica de São Paulo', 'São Paulo', 'Brasil', '1954-02-18', 10),
('Orquestra Sinfônica Brasileira', 'Rio de Janeiro', 'Brasil', '1940-07-11', 11),
('Orquestra Filarmônica de Paris', 'Paris', 'França', '1928-05-18', 12),
('Orquestra Sinfônica de Montreal', 'Montreal', 'Canadá', '1934-01-14', 13),
('Orquestra Sinfônica de Sydney', 'Sydney', 'Austrália', '1932-01-01', 14),
('Orquestra Filarmônica Real', 'Estocolmo', 'Suécia', '1902-05-02', 15),
('Orquestra Sinfônica de Tóquio', 'Tóquio', 'Japão', '1926-10-05', 16),
('Orquestra Sinfônica de Seul', 'Seul', 'Coreia do Sul', '1965-02-25', 17),
('Orquestra Filarmônica de Israel', 'Tel Aviv', 'Israel', '1936-12-26', 18),
('Orquestra Sinfônica Nacional da China', 'Pequim', 'China', '1956-03-01', 19),
('Orquestra Sinfônica de Minas Gerais', 'Belo Horizonte', 'Brasil', '1975-08-15', 20);

INSERT INTO Sinfonias (id_sinfonia, nome, compositor, datacriacao, Orquestra_Sinfonica_id) VALUES 
(1, 'Sinfonia nº 5', 'Ludwig van Beethoven', '1808-12-22', 1),
(2, 'Sinfonia nº 9', 'Ludwig van Beethoven', '1824-05-07', 2),
(3, 'Sinfonia nº 40', 'Wolfgang Amadeus Mozart', '1788-07-25', 3),
(4, 'Sinfonia nº 41', 'Wolfgang Amadeus Mozart', '1788-08-10', 4),
(5, 'Sinfonia nº 6', 'Pyotr Ilyich Tchaikovsky', '1893-10-28', 5),
(6, 'Sinfonia nº 9', 'Antonin Dvorak', '1893-12-16', 6),
(7, 'Sinfonia nº 3', 'Johannes Brahms', '1883-12-02', 7),
(8, 'Sinfonia nº 5', 'Gustav Mahler', '1904-10-18', 8),
(9, 'Sinfonia nº 7', 'Anton Bruckner', '1883-12-30', 9),
(10, 'Sinfonia nº 1', 'Sergei Prokofiev', '1918-04-21', 10),
(11, 'Sinfonia nº 2', 'Jean Sibelius', '1902-03-08', 11),
(12, 'Sinfonia nº 4', 'Robert Schumann', '1841-12-06', 12),
(13, 'Sinfonia nº 8', 'Franz Schubert', '1822-03-01', 13),
(14, 'Sinfonia nº 1', 'Johannes Brahms', '1876-11-04', 14),
(15, 'Sinfonia nº 4', 'Johannes Brahms', '1885-10-25', 15),
(16, 'Sinfonia nº 94', 'Joseph Haydn', '1791-03-23', 16),
(17, 'Sinfonia nº 101', 'Joseph Haydn', '1794-03-03', 17),
(18, 'Sinfonia nº 3', 'Ludwig van Beethoven', '1805-04-07', 18),
(19, 'Sinfonia Fantástica', 'Hector Berlioz', '1830-12-05', 19),
(20, 'Sinfonia nº 2', 'Dmitri Shostakovich', '1927-11-05', 20);

-- EnderecoMusico
INSERT INTO enderecoMusico (id_musico, cep, rua, bairro, cidade, complemento) VALUES 
(1, '20040-010', 'Av. Rio Branco', 'Centro', 'Rio de Janeiro', 'Apto 101'),
(2, '01310-100', 'Av. Paulista', 'Bela Vista', 'São Paulo', 'Sala 202'),
(3, '30120-010', 'Av. Afonso Pena', 'Funcionários', 'Belo Horizonte', 'Bloco B'),
(4, '90010-150', 'Rua dos Andradas', 'Centro Histórico', 'Porto Alegre', 'Casa 3'),
(5, '40010-010', 'Rua Chile', 'Comércio', 'Salvador', 'Apto 501'),
(6, '80060-160', 'Rua XV de Novembro', 'Centro', 'Curitiba', 'Sobrado'),
(7, '50030-230', 'Rua do Bom Jesus', 'Recife Antigo', 'Recife', 'Apto 302'),
(8, '29010-090', 'Av. Jerônimo Monteiro', 'Centro', 'Vitória', 'Casa 5'),
(9, '57020-630', 'Rua do Sol', 'Centro', 'Maceió', 'Apto 103'),
(10, '78005-100', 'Av. Getúlio Vargas', 'Centro Sul', 'Cuiabá', 'Sala 10'),
(11, '69005-140', 'Av. Eduardo Ribeiro', 'Centro', 'Manaus', 'Apto 201'),
(12, '58013-420', 'Av. Epitácio Pessoa', 'Tambiá', 'João Pessoa', 'Casa 2'),
(13, '64000-280', 'Rua Areolino de Abreu', 'Centro', 'Teresina', 'Apto 401'),
(14, '88010-400', 'Rua Felipe Schmidt', 'Centro', 'Florianópolis', 'Sala 5'),
(15, '49010-100', 'Rua Laranjeiras', 'Centro', 'Aracaju', 'Apto 601'),
(16, '77001-014', 'Av. NS-2', 'Centro', 'Palmas', 'Bloco C'),
(17, '70070-350', 'SHS Quadra 2', 'Asa Sul', 'Brasília', 'Apto 102'),
(18, '59010-200', 'Av. Rio Branco', 'Ribeira', 'Natal', 'Casa 4'),
(19, '66010-010', 'Av. Presidente Vargas', 'Campina', 'Belém', 'Apto 303'),
(20, '79002-141', 'Rua 14 de Julho', 'Centro', 'Campo Grande', 'Sala 8');

INSERT INTO EnderecoMusico (id_musico, cep, rua, bairro, cidade, complemento) VALUES
(21, '01310-000', 'Rua Augusta', 'Consolação', 'São Paulo', 'Apto 1201'),
(22, '20040-020', 'Rua do Ouvidor', 'Centro', 'Rio de Janeiro', 'Sala 305'),
(23, '100-0001', 'Chiyoda-ku', 'Marunouchi', 'Tóquio', 'Torre Norte'),
(24, '75008', 'Avenue des Champs-Élysées', '8ème arrondissement', 'Paris', 'Apto 42'),
(25, '10001', 'Broadway', 'Manhattan', 'Nova York', 'Suite 1500'),
(26, '10115', 'Unter den Linden', 'Mitte', 'Berlim', 'Apto 5B'),
(27, '1200-425', 'Rua das Flores', 'Belém', 'Lisboa', 'Casa 3');

INSERT INTO EnderecoMusico (id_musico, cep, rua, bairro, cidade, complemento) VALUES 
(28, '01310-000', 'Rua Augusta', 'Consolação', 'São Paulo', 'Apto 1201'),
(29, '20040-020', 'Rua do Ouvidor', 'Centro', 'Rio de Janeiro', 'Sala 305'),
(30, '100-0001', 'Chiyoda-ku', 'Marunouchi', 'Tóquio', 'Torre Norte'),
(31, '75008', 'Avenue des Champs-Élysées', '8ème arrondissement', 'Paris', 'Apto 42'),
(32, '10001', 'Broadway', 'Manhattan', 'Nova York', 'Suite 1500'),
(33, '10115', 'Unter den Linden', 'Mitte', 'Berlim', 'Apto 5B');

INSERT INTO enderecoMusico (id_musico, cep, rua, bairro, cidade, complemento) VALUES 
(35, '8525-988', 'AV Barros Lima', 'Centro', 'Campo Grande', 'Casa 53'),
(36, '8569-852', 'AV João De Barros', 'Centro', 'João Pessoa', 'Apto 202'),
(37, '8563-857', 'Rua 9 de Junho', 'Asa Sul', 'Brasília', 'Casa 350');





INSERT INTO Musicos (id_musico, nome, genero, identidade, nacionalidade, datanasc, funcao, EnderecoMusico_id, Orquestra_id) Values
(1, 'Carlos Silva', 'M', '123456789', 'Brasileira', '1980-05-15', 'Violinista', 1, 1),
(2, 'Ana Oliveira','F','987654321', 'Brasileira', '1985-08-22', 'Violoncelista', 2, 2),
(3, 'Lucas Pereira','M', '456789123', 'Brasileira', '1978-03-10', 'Flautista', 3, 3),
(4, 'Mariana Santos', 'F', '789123456', 'Brasileira', '1990-11-30', 'Pianista', 4, 4),
(5, 'Pedro Almeida', 'M', '321654987', 'Brasileira', '1982-07-18', 'Trompetista', 5, 5),
(6, 'Juliana Costa','F','654987321', 'Brasileira', '1992-04-25', 'Violinista', 6, 6),
(7, 'Rafael Souza', 'M', '987321654', 'Brasileira', '1975-09-12', 'Violoncelista', 7, 7),
(8, 'Fernanda Lima', 'F', '321987654', 'Brasileira', '1988-12-05', 'Flautista', 8, 8),
(9, 'Gustavo Rocha', 'M', '654321987', 'Brasileira', '1983-06-20', 'Pianista', 9, 9),
(10, 'Patrícia Mendes', 'F', '789456123', 'Brasileira', '1995-01-15', 'Trompetista', 10, 10),
(11, 'Daniel Martins', 'M', '123789456', 'Brasileira', '1979-10-08', 'Violinista', 11, 11),
(12, 'Camila Gonçalves', 'F', '456123789', 'Brasileira', '1987-07-22', 'Violoncelista', 12, 12),
(13, 'Marcos Ferreira', 'M', '789456321', 'Brasileira', '1981-03-30', 'Flautista', 13, 13),
(14, 'Tatiana Ramos', 'F',  '321456789', 'Brasileira', '1993-08-17', 'Pianista', 14, 14),
(15, 'Roberto Nunes', 'M', '654789321', 'Brasileira', '1976-05-24', 'Trompetista', 15, 15),
(16, 'Vanessa Castro', 'F', '987654123', 'Brasileira', '1989-02-11', 'Violinista', 16, 16),
(17, 'Eduardo Barros', 'M', '123987456', 'Brasileira', '1984-09-28', 'Violoncelista', 17, 17),
(18, 'Isabela Teixeira', 'F', '456321789', 'Brasileira', '1991-06-14', 'Flautista', 18, 18),
(19, 'Felipe Cardoso', 'M', '789123654', 'Brasileira', '1977-12-03', 'Pianista', 19, 19),
(20, 'Larissa Moura', 'F',  '321789654', 'Brasileira', '1994-04-19', 'Trompetista', 20, 20),
(21, 'Andrew Kaue', 'M', '594672358', 'Brasileiro', '2007-06-18', 'Pianista', 21, 21),
(22, 'Miguel Ramos', 'M', '958826584', 'Brasileiro', '1998-08-25', 'Trompetista', 22, 22),
(23, 'Bianca Guimarães', 'F', '8726357', 'Brasileiro', '2000-08-08', 'Flautista', 23, 23);


INSERT INTO FuncoesMusicos (id_musico, data_funcao, Musicos_id_musico) VALUES 
(1, '2010-01-15', 1),
(2, '2012-03-22', 2),
(3, '2008-05-10', 3),
(4, '2015-07-30', 4),
(5, '2009-09-18', 5),
(6, '2018-11-25', 6),
(7, '2005-02-12', 7),
(8, '2013-04-05', 8),
(9, '2011-06-20', 9),
(10, '2019-08-15', 10),
(11, '2007-10-08', 11),
(12, '2014-12-22', 12),
(13, '2006-03-30', 13),
(14, '2017-05-17', 14),
(15, '2004-07-24', 15),
(16, '2020-09-11', 16),
(17, '2016-11-28', 17),
(18, '2019-01-14', 18),
(19, '2003-04-03', 19),
(20, '2018-06-19', 20);

INSERT INTO Instrumentos (id_instrumento, id_musico, `desc`, Musicos_id_musico) VALUES 
(1, 1, 'Violino Stradivarius', 1),
(2, 2, 'Violoncelo Montagnana', 2),
(3, 3, 'Flauta Transversal Yamaha', 3),
(4, 4, 'Piano Steinway', 4),
(5, 5, 'Trompete Bach Stradivarius', 5),
(6, 6, 'Violino Guarneri', 6),
(7, 7, 'Violoncelo Stradivarius', 7),
(8, 8, 'Flauta Doce Mollenhauer', 8),
(9, 9, 'Piano Bösendorfer', 9),
(10, 10, 'Trompete Yamaha', 10),
(11, 11, 'Violino Francês', 11),
(12, 12, 'Violoncelo Francês', 12),
(13, 13, 'Flauta Alemã', 13),
(14, 14, 'Piano Italiano', 14),
(15, 15, 'Trompete Americano', 15),
(16, 16, 'Violino Chinês', 16),
(17, 17, 'Violoncelo Japonês', 17),
(18, 18, 'Flauta Japonesa', 18),
(19, 19, 'Piano Francês', 19),
(20, 20, 'Trompete Alemão', 20);


INSERT INTO Instrumentos (id_instrumento, id_musico, `desc`, Musicos_id_musico) VALUES 
(21, 21, 'Violino Francês', 21),
(22, 22, 'Violoncelo Italiano', 22),
(23, 23, 'Piano Yamaha', 23),
(24, 24, 'Flauta Transversal', 24),
(25, 25, 'Trompete Bach', 25),
(26, 26, 'Batuta', 26),
(27, 27, 'Harpa de Concerto', 27);

INSERT INTO TipoInstrumento (categoria, subcategoria, descricao) VALUES
('Cordas', 'Arco', 'Instrumentos tocados com arco'),
('Cordas', 'Dedilhado', 'Instrumentos tocados com os dedos'),
('Sopro', 'Madeiras', 'Instrumentos de sopro tradicionalmente feitos de madeira'),
('Sopro', 'Metais', 'Instrumentos de sopro feitos de metal'),
('Percussão', NULL, 'Instrumentos percutidos'),
('Teclas', NULL, 'Instrumentos com teclado');

INSERT INTO EnderecoMusico (id_musico, cep, rua, bairro, cidade)
VALUES (1000, '50000-000', 'Rua Augustro vaz de Oliveira', 'Centro', 'Recife');

INSERT INTO EnderecoMusico (id_musico, cep, rua, bairro, cidade, telefone)
VALUES (1002, '50000-000', 'Rua Chá grande', 'Centro', 'Cruz de rebouças', '98765-4321');

INSERT INTO Orquestra (id, nome, cidade, país, data_fundacao, Orquestra_Sinfonica_id, status)
VALUES (999, 'Orquestra PE', 'Recife', 'Brasil', '2020-07-02', 1, 'Ativa');