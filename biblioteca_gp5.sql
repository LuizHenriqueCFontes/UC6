CREATE DATABASE biblioteca_gp5;

USE biblioteca_gp5;

CREATE TABLE IF NOT EXISTS alunos(
	id_alunos INT AUTO_INCREMENT,
    matricula VARCHAR(30) UNIQUE NOT NULL,
    id_usuarios INT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    
    PRIMARY KEY(id_alunos)
    
);

CREATE TABLE IF NOT EXISTS professores(
	id_professores INT AUTO_INCREMENT,
    matricula VARCHAR(30) UNIQUE NOT NULL,
    id_usuarios INT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    
    PRIMARY KEY(id_professores)

);

CREATE TABLE IF NOT EXISTS bibliotecarios(
	id_bibliotecarios INT AUTO_INCREMENT,
    matricula VARCHAR(30) UNIQUE NOT NULL,
    id_usuarios INT,
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
 
 CREATE TABLE IF NOT EXISTS exemplares(
	id_exemplares INT AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    categoria VARCHAR(70) NOT NULL,
    lancamento DATE NOT NULL,
    codigo VARCHAR(30) NOT NULL,
    
    PRIMARY KEY(id_exemplares)
 
 
 );