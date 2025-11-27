CREATE DATABASE gestao_eventos;

USE gestao_eventos;

CREATE TABLE eventos(
	id_eventos BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tema VARCHAR(100) NOT NULL,
    data_evento DATE NOT NULL,
    vagas INT NOT NULL,
    
    PRIMARY KEY(id_eventos)
);

CREATE TABLE inscricoes(
	id_inscricoes BIGINT AUTO_INCREMENT,
	id_eventos BIGINT NOT NULL,
    id_participantes BIGINT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    
    PRIMARY KEY(id_inscricoes)
);	

CREATE TABLE participantes(
	id_participantes BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    categoria ENUM('Vip', 'Comum') DEFAULT 'Comum' NOT NULL,
    email VARCHAR(255) NOT NULL,

	PRIMARY KEY(id_participantes)
);

CREATE TABLE palestras(
	id_palestras BIGINT AUTO_INCREMENT,
    id_eventos BIGINT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    tema VARCHAR(100) NOT NULL,

    PRIMARY KEY(id_palestras)
);

