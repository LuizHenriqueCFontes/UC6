
-- Inserindo os dados nas tabelas
INSERT INTO usuarios (login, senha)
VALUES
('luiz.teste', '1111'),
('leandro.teste', '2222'),
('carlos.teste', '3333');


INSERT INTO alunos (matricula, id_usuarios, nome, cpf)
VALUES
('3456', 11, 'Luiz', '090.900.123-00');

INSERT INTO professores (matricula, id_usuarios, nome, cpf)
VALUES
('4589000', 12, 'Leandro', '123.456.789-00');

INSERT INTO bibliotecarios (matricula, id_usuarios, nome, cpf)
VALUES
('4432432', 13, 'Carlos', '456.890.334.34');

INSERT INTO livros (nome, categoria, lancamento)
VALUES
('O senhor dos aneis', 'Fantasia', '1954-07-29'),
('Cem anos de solidão', 'Romance', '1967-05-30'),
('Dom casmurro', 'Romance classico', '1899-09-15'),
('O codigo Da Vinci', 'Mistério', '2003-03-18'),
('Harry Potter', 'Fantasia', '1997-06-26'),
('1984', 'Ficção Cientifica', '1949-06-08'),
('O pequeno principe', 'Fábula', '1943-04-06'),
('A menina que roubava livros', 'Drama', '2005-02-30'),
('O hobbit', 'Fantasia', '1937-09-21'),
('A revolução dos bichos', 'Sátira', '1945-08-17');

INSERT INTO exemplares (codigo, id_livros)
VALUES
('978-0-306-40615-7', 1),
('978-1-4028-9462-6', 2),
('978-85-359-0277-6', 3),
('978-0-316-76948-0', 4),
('978-1-56619-909-4', 5),
('978-0-7432-7356-5', 6),
('978-85-359-0277-6', 7),
('978-85-98078-11-2', 8),
('978-0-525-47540-0', 9),
('978-85-359-0450-3', 10);

INSERT INTO emprestimos (id_usuarios, id_livros, data_devolucao)
VALUES
(11, 5, '2025-11-10');

SELECT * FROM emprestimos;

INSERT INTO reservas (id_usuarios, id_livros)
VALUES
(12, 8);

INSERT INTO penalidades (id_emprestimos, multa)
VALUES
(2, 54.90);
