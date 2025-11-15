CREATE DATABASE interprise_logisticas;

USE interprise_logisticas;

CREATE TABLE clientes(
	id_clientes BIGINT AUTO_INCREMENT,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    status_pagamento ENUM('Aprovado', 'Recusado', 'Aguardando aprovação') NOT NULL DEFAULT 'Aguardando aprovação',
    
	PRIMARY KEY(id_clientes)
);

CREATE TABLE motoristas(
	id_motoristas BIGINT AUTO_INCREMENT,
    cnh VARCHAR(11),
    nome VARCHAR(255),
    telefone VARCHAR(18),
    condicao ENUM('Ativa', 'Suspensa', 'Vencida', 'Provisória'),
    
    PRIMARY KEY(id_motoristas)
);


CREATE TABLE veiculos(
	id_veiculos BIGINT AUTO_INCREMENT,
    placa VARCHAR(8) UNIQUE NOT NULL,
    ano YEAR NOT NULL,
    capacidade TINYINT NOT NULL,
    status_veiculos ENUM ('Ativo', 'Inativo', 'Em manutenção') NOT NULL,
    
    PRIMARY KEY(id_veiculos)
);

-- O prazo sera armazenado no conceito de dias
-- a distancia sera armazenada em km
CREATE TABLE rotas(
	id_rotas BIGINT AUTO_INCREMENT,
    origem VARCHAR(40) NOT NULL,
    destino VARCHAR(40) NOT NULL,
    distancia DECIMAL(6, 2) NOT NULL,
    prazo INT NOT NULL,
    
    PRIMARY KEY(id_rotas)
);

CREATE TABLE entregas(
	id_entregas BIGINT AUTO_INCREMENT,
    id_clientes BIGINT NOT NULL,
    id_motoristas BIGINT NOT NULL,
    id_veiculos BIGINT NOT NULL,
    id_rotas BIGINT NOT NULL,
    data_saida DATE NOT NULL,
    previsao DATE NOT NULL,
    entrega_real VARCHAR(15)NOT NULL DEFAULT 'Em transporte',
    status_entregas ENUM('Entregue', 'Em transporte', 'Rota de entrega') DEFAULT 'Em transporte',
	
    PRIMARY KEY(id_entregas)
);
    
CREATE TABLE ocorrencias(
	id_ocorrencias BIGINT AUTO_INCREMENT,
    id_entregas BIGINT NOT NULL,
    tipo ENUM('Reclamação', 'Elogio', 'Sugestão') NOT NULL,
    descricao TEXT NOT NULL,
    data_ocorrencia DATE NOT NULL,
    
    PRIMARY KEY(id_ocorrencias)
);

    CREATE TABLE pagamentos(
	id_pagamentos BIGINT AUTO_INCREMENT,
    id_clientes BIGINT NOT NULL,
    id_entregas BIGINT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    forma ENUM('Cartão', 'Pix', 'Boleto') NOT NULL,
    status_pagamento ENUM('Aprovado', 'Recusado', 'Aguardando aprovação') NOT NULL DEFAULT 'Aguardando Aprovação',
    
    PRIMARY KEY(id_pagamentos)
);

CREATE TABLE funcionarios_administrativos(
	id_funcionarios_administrativos BIGINT AUTO_INCREMENT,
    matricula VARCHAR(9),
    nome VARCHAR(255),
    setor ENUM('Recursos Humanos', 'Juridico', 'Financeiro') NOT NULL,
    
    PRIMARY KEY(id_funcionarios_administrativos)
);




