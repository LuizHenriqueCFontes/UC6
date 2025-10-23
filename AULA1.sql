CREATE DATABASE ecommerce
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE ecommerce;

CREATE TABLE usuarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(10) NOT NULL,
    celular VARCHAR(20) NOT NULL,
    cpf VARCHAR(15),
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE enderecos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    rua VARCHAR(100),
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    cep VARCHAR(9)

);

CREATE TABLE categorias(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT

);

CREATE TABLE produtos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2),
    estoque INT,
    categoria_id TINYINT

);

CREATE TABLE pedidos(
	id INT,
    cliente_id INT,
    data_pedido TIMESTAMP,
    status TINYTEXT,
    total DECIMAL(10, 2),
    
    PRIMARY KEY(id)

);

CREATE TABLE itens_pedido(
	id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL

);

ALTER TABLE clientes
CHANGE COLUMN telefone celular VARCHAR(15);

DESCRIBE clientes;

RENAME TABLE clientes TO usuarios;

SHOW TABLES;

ALTER TABLE usuarios
ADD COLUMN telefone VARCHAR(12) AFTER email;

ALTER TABLE usuarios
ADD COLUMN cpf VARCHAR(15) AFTER telefone;

ALTER TABLE usuarios
MODIFY celular VARCHAR(20);




ALTER TABLE usuarios
DROP COLUMN telefone;

ALTER TABLE enderecos
ADD COLUMN cep VARCHAR(9);






