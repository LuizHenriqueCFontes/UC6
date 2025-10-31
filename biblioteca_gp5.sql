
CREATE DATABASE biblioteca_gp5;

USE biblioteca_gp5;
 -- Criando as tabelas do db
 
 -- a tabela alunos vai se relacionar com usuarios
CREATE TABLE IF NOT EXISTS alunos(
	id_alunos INT AUTO_INCREMENT,
    matricula VARCHAR(30) UNIQUE NOT NULL,
    id_usuarios INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    
    PRIMARY KEY(id_alunos)
    
);
-- A tabela professores vai se relacionar com usuarios
CREATE TABLE IF NOT EXISTS professores(
	id_professores INT AUTO_INCREMENT,
    matricula VARCHAR(30) UNIQUE NOT NULL,
    id_usuarios INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    
    PRIMARY KEY(id_professores)

);

-- A tabela bibliotecarios vai se relacionar com usuarios
CREATE TABLE IF NOT EXISTS bibliotecarios(
	id_bibliotecarios INT AUTO_INCREMENT,
    matricula VARCHAR(30) UNIQUE NOT NULL,
    id_usuarios INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
	
	PRIMARY KEY(id_bibliotecarios)
    
);

 CREATE TABLE IF NOT EXISTS usuarios(
	id_usuarios INT AUTO_INCREMENT,
    login VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    
    PRIMARY KEY(id_usuarios)
 
 );
 
 CREATE TABLE IF NOT EXISTS livros(
	id_livros INT AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    categoria VARCHAR(70) NOT NULL,
    lancamento DATE NOT NULL,
	
    PRIMARY KEY(id_livros)
 );
 
 -- A tabela exemplares vai se relacionar com livros
 CREATE TABLE IF NOT EXISTS exemplares(
	id_exemplares INT AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    categoria VARCHAR(70) NOT NULL,
    lancamento DATE NOT NULL,
    codigo VARCHAR(30) NOT NULL,
    id_livros INT NOT NULL,
    
    PRIMARY KEY(id_exemplares)
 
 
 );
 
 -- A tabela emprestimos vai se relacionar com as tabelas usuarios e livros
 CREATE TABLE IF NOT EXISTS emprestimos(
	id_emprestimos INT AUTO_INCREMENT,
    id_usuarios INT	NOT NULL,
    id_livros INT NOT NULL,
    data_devolucao DATE NOT NULL,
    
    PRIMARY KEY(id_emprestimos)
 
 );
 
 -- A tabela reservas vai se relacionar com as tabelas usuarios e livros
 CREATE TABLE IF NOT EXISTS reservas(
	id_reservas INT AUTO_INCREMENT,
    id_usuarios INT NOT NULL,
    id_livros INT NOT NULL,
    
    PRIMARY KEY(id_reservas)
 
 );
 
 -- A tabela penalidades vai se relacionar com emprestimos
 CREATE TABLE IF NOT EXISTS penalidades(
	id_penalidades INT AUTO_INCREMENT,
    id_emprestimos INT NOT NULL,
	multa DECIMAL(10, 2) NOT NULL,
 
	PRIMARY KEY(id_penalidades)
 );
 
 -- Essa parte sera adicionada as constraint de foreign para aplicar os relacionamento entre as tabelas
 ALTER TABLE alunos
 ADD CONSTRAINT fk_alunos_usuarios
 FOREIGN KEY(id_usuarios) REFERENCES usuarios(id_usuarios);
 
 ALTER TABLE professores
 ADD CONSTRAINT fk_professores_usuarios
 FOREIGN KEY(id_usuarios) REFERENCES usuarios(id_usuarios);
 
 ALTER TABLE bibliotecarios
 ADD CONSTRAINT fk_bibliotecarios_usuarios
 FOREIGN KEY(id_usuarios) REFERENCES usuarios(id_usuarios);
 
 ALTER TABLE exemplares
 ADD CONSTRAINT fk_exemplares_livros
 FOREIGN KEY(id_livros) REFERENCES livros(id_livros);
 
 ALTER TABLE emprestimos
 ADD CONSTRAINT fk_emprestimos_usuarios
 FOREIGN KEY(id_usuarios) REFERENCES usuarios(id_usuarios);
 
 ALTER TABLE emprestimos
 ADD CONSTRAINT fk_emprestimo_livros
 FOREIGN KEY(id_livros) REFERENCES livros(id_livros);
 
 ALTER TABLE reservas
 ADD CONSTRAINT fk_reservas_usuarios
 FOREIGN KEY(id_usuarios) REFERENCES usuarios(id_usuarios);
 
 ALTER TABLE reservas
 ADD CONSTRAINT fk_reservas_livros
 FOREIGN KEY(id_livros) REFERENCES livros(id_livros);
 
 ALTER TABLE penalidades
 ADD CONSTRAINT fk_penalidades_emprestimos
 FOREIGN KEY(id_emprestimos) REFERENCES emprestimos(id_emprestimos);

-- Essa parte ficara a criação dos indices
CREATE INDEX idx_alunos_cpf ON alunos(cpf);

CREATE INDEX idx_professores_cpf ON professores(cpf);

CREATE INDEX idx_bibliotecarios_cpf ON bibliotecarios(cpf);

CREATE INDEX idx_livros_nome ON livros(nome);

CREATE INDEX idx_exemplares_codigo ON exemplares(codigo);

CREATE INDEX idx_emprestimos_data_devolucao ON emprestimos(data_devolucao);

CREATE INDEX idx_reservas_id_livros ON reservas(id_livros);

