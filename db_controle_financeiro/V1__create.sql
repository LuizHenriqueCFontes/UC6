CREATE DATABASE controle_financeiro;

USE controle_financeiro;

CREATE TABLE clientes(
	id_clientes BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    
    PRIMARY KEY(id_clientes)
); 

CREATE TABLE contas(
	id_contas BIGINT AUTO_INCREMENT,
    numero_conta VARCHAR(40) UNIQUE NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL,
    id_clientes BIGINT NOT NULL,
    
    PRIMARY KEY(id_contas)
);

CREATE TABLE transacoes(
	id_transacoes BIGINT AUTO_INCREMENT,
    id_contas BIGINT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    tipo_transacao ENUM('Pix', 'Crédito', 'Débito') NOT NULL,
    data_transacao DATE NOT NULL,
    
    PRIMARY KEY(id_transacoes)

);

CREATE TABLE log_auditorias(
	id_auditorias BIGINT AUTO_INCREMENT,
    id_clientes BIGINT NOT NULL,
    data_mudanca DATE NOT NULL,
    saldo_anterior DECIMAL(10, 2) NOT NULL,
    saldo_atual DECIMAL(10, 2) NOT NULL,
    
    PRIMARY KEY(id_auditorias)
);

