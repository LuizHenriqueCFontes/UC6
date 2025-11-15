INSERT INTO clientes(cnpj, nome, status_pagamento)
VALUES
	('76.448.302/0001-99', 'Carlos Eduardo', 'Aprovado'),
	('77.663.359/0001-73', 'Luiz Henrique', 'Aguardando aprovação'),
    ('73.618.483/0001-66', 'Leandro Almeida', 'Recusado'),
    ('27.393.634/0001-08', 'Emily Leopodino', 'Aprovado'),
    ('60.911.988/0001-72', 'Anderson Rodriges', 'Recusado'),
    ('67.944.391/0001-73', 'Fernanda Lima', 'Aprovado'),
    ('61773571000153', 'Cassio Rodrigues', 'Aprovado');
    
    
    
    INSERT INTO motoristas(cnh, nome, telefone, condicao)
VALUES
	('27969521482', 'Lucas Lima', '7935854326', 'Ativa'),
    ('54558041750', 'Pedro Garcia', '9639465196', 'Provisória'),
    ('82248652990', 'Lorena Almeida', '8425385445', 'Vencida'),
    ('62530399260', 'Andre Gomes', '9530499330', 'Ativa'),
    ('52025738309', 'Veronica Anderson', '6433836446', 'Suspensa'),
    ('57180919591', 'Leoncio Ferreira', '6337810389', 'Suspensa'),
    ('28461321501', 'Leonardo Gomes', '8427510722', 'Provisória');
    
    INSERT INTO veiculos(placa, ano, capacidade, status_veiculos)
VALUES
	('JPJ6883', '2014', 3, 'Ativo'),
    ('MBY4560', '2010', 2, 'Em manutenção'),
    ('MVL0517', '2024', 5, 'Inativo'),
    ('HMN9573', '2000', 2, 'Ativo'),
    ('HPZ4163', '2025', 5, 'Ativo'),
    ('KEO1327', '2005', 3, 'Em manutenção'),
    ('LKM7595', '2004', 4, 'Ativo');

INSERT INTO rotas(origem, destino, distancia, prazo)
VALUES
	('Campinas - SP', 'Brasilia - DF', 145.9, 5),
    ('Tunas do Paraná', 'Braúnas', 45.9, 15),
    ('Heitoraí', 'Domingos Martins', 34.8, 13),
    ('Campina do Simão', 'Sentinela do Sul', 45.8, 13),
    ('Branquinha', 'Caracaraí', 54.8, 23),
    ('Parnarama', 'Carlinda', 32.5, 12),
    ('Marcação', 'São João da Baliza', 54.7, 23);
    
    INSERT INTO entregas(id_clientes, id_motoristas, id_veiculos, id_rotas, data_saida,  previsao, entrega_real, status_entregas)
VALUES
	(1, 1, 1, 1, '2025-11-15', '2025-12-01', 'Em transporte', 'Rota de entrega'),
    (2, 2, 2, 2, '2025-11-15', '2024-11-12', 'Em transporte', 'Rota de entrega'),
    (3, 3, 3, 3, '2025-12-09', '2025-12-20', 'Em transpote', 'Em transporte'),
    (4, 4, 4, 4, '2025-11-01', '2025-11-10', '2025-11-10','Entregue'),
    (5, 5, 5, 5, '2025-10-01', '2025-10-20', '2025-10-20', 'Entregue'),
    (6, 6, 6, 6, '2025-11-20', '2025-12-03', 'Em transporte', 'Em transporte'),
    (7, 7, 7, 7, '2025-12-01', '2025-12-15', 'Em transporte', 'Rota de entrega');
    

INSERT INTO ocorrencias(id_entregas, tipo, descricao, data_ocorrencia)
VALUES
	(1, 'Reclamação', 'Atrasou dois dias', CURDATE()),
    (2, 'Elogio', 'chegou dois dias antes', '2025-10-11'),
    (3, 'Sugestão', 'Poderia adicionar mais frotas', '2024-07-02'),
    (4, 'Elogio', 'Otimo atendimento', '2025-07-10'),
    (5, 'Elogio', 'Otimo suporte técnico', CURDATE()),
    (6, 'Reclamação', 'Chegou amassado', '2025-09-10'),
    (7, 'Sugestão', 'Poderia ter mais variedades de itens', CURDATE());
    
    CREATE TABLE pagamentos(
	id_pagamentos BIGINT AUTO_INCREMENT,
    id_clientes BIGINT NOT NULL,
    id_entregas BIGINT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    forma ENUM('Cartão', 'Pix', 'Boleto') NOT NULL,
    status_pagamento ENUM('Aprovado', 'Recusado', 'Aguardando aprovação') NOT NULL DEFAULT 'Aguardando Aprovação',
    
    PRIMARY KEY(id_pagamentos)
);

INSERT INTO pagamentos(id_clientes, id_entregas, valor, forma, status_pagamento)
VALUES
	(1, 1, 345.90, 'Cartão', 'Aprovado'),
    (2, 2, 129.90, 'Pix', 'Aguardando Aprovação'),
    (3, 3, 344.89, 'Boleto', 'Recusado'),
    (4, 4, 345.98, 'Pix', 'Aprovado'),
    (5, 5, 233.56, 'Cartão', 'Recusado'),
    (6, 6, 222.90, 'Pix', 'Aprovado'),
    (7, 7, 150.00, 'Pix', 'Aprovado');
    
    INSERT INTO funcionarios_administrativos(matricula, nome, setor)
VALUES
	('44563', 'Luzia Alves', 'Recursos Humanos'),
    ('23455', 'Antonio de Miranda', 'Juridico'),
    ('23312', 'Marcos Ferreira', 'Financeiro'),
    ('12233', 'Juridico', 'Juridico'),
    ('23456', 'Thaynara Leandrina', 'Recursos Humanos'),
    ('23466', 'Lucas Gabriel', 'Financeiro'),
    ('12290', 'Marcos Antonio', 'Recursos Humanos');