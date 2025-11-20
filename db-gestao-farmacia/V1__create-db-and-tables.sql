CREATE DATABASE gestao_farmacia;

USE gestao_farmacia;

CREATE TABLE fornecedores(
	id_fornecedores BIGINT AUTO_INCREMENT,
    razao_social VARCHAR (150) NOT NULL,
    contato VARCHAR(100) NOT NULL,
    
    PRIMARY KEY(id_fornecedores)
);

CREATE TABLE medicamentos(
	id_medicamentos BIGINT AUTO_INCREMENT,
    id_fornecedores BIGINT,
    codigo VARCHAR(30) UNIQUE NOT NULL ,
    nome VARCHAR(255) NOT NULL,
    principio_ativo TINYTEXT NOT NULL,
    validade_med DATE NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
	
    PRIMARY KEY(id_medicamentos)
);

CREATE TABLE estoque(
	id_estoque BIGINT AUTO_INCREMENT,
    id_medicamentos BIGINT NOT NULL,
    quantidade INT NOT NULL,
    lote VARCHAR(35) NOT NULL,
    validade_lote DATE NOT NULL,
    data_entrada DATE NOT NULL,
    
	PRIMARY KEY(id_estoque)
);

CREATE TABLE clientes(
	id_clientes BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    
    PRIMARY KEY(id_clientes)
);

CREATE TABLE medicos(
	id_medicos BIGINT AUTO_INCREMENT,
    crm VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(40) NOT NULL,
    contato VARCHAR(14) NOT NULL,
    
    PRIMARY KEY(id_medicos)
);

CREATE TABLE receitas_medicas(
	id_receitas_medicas BIGINT AUTO_INCREMENT,
    id_clientes BIGINT NOT NULL,
    id_medicos BIGINT NOT NULL,
    id_medicamentos BIGINT NOT NULL,
    validade_receita DATE NOT NULL,
    data_emissao DATE NOT NULL,
	
    PRIMARY KEY(id_receitas_medicas)
);

CREATE TABLE funcionarios(
	id_funcionarios BIGINT AUTO_INCREMENT,
    matricula VARCHAR(25) UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(75) NOT NULL,
    turno VARCHAR(25) NOT NULL,
    
    PRIMARY KEY(id_funcionarios)
);

CREATE TABLE vendas(
	id_vendas BIGINT AUTO_INCREMENT,
    id_clientes BIGINT NOT NULL,
    id_funcionarios BIGINT NOT NULL,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
	
    PRIMARY KEY(id_vendas)
);

CREATE TABLE itens_vendas(
	id_itens_vendas BIGINT AUTO_INCREMENT,
    id_vendas BIGINT NOT NULL,
    id_medicamentos BIGINT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    
    PRIMARY KEY(id_itens_vendas)
);

CREATE TABLE pagamentos(
	id_pagamentos BIGINT AUTO_INCREMENT,
    id_vendas BIGINT NOT NULL,
    forma_pagamento ENUM('Cartão', 'Pix', 'Boleto', 'Dinheiro') NOT NULL,
    status_pagamento ENUM('Em análise', 'Aprovado', 'Recusado') DEFAULT 'Em análise',
	
	PRIMARY KEY(id_pagamentos)
);