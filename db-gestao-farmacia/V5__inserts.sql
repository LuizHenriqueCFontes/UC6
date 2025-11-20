INSERT INTO fornecedores(razao_social, contato)
VALUES
('FarmaVida Distribuidora LTDA', 'contato@farmavida.com.br'),
('MedPrime Suprimentos Médicos SA', '(11) 3892-4401'),
('BioPharma Comércio e Logística LTDA', 'atendimento@biopharma.com'),
('Saúde Total Distribuições LTDA', '(21) 99812-4420'),
('PharmaLine Importadora SA', 'vendas@pharmaline.com.br'),
('Drogasil Distribuidora Regional LTDA', '(31) 4002-8811'),
('VitalMed Produtos Hospitalares LTDA', 'suporte@vitalmed.com'),
('BemEstar Farma Suprimentos EPP', '(41) 3030-5512'),
('GlobalMed Import & Export LTDA', 'comercial@globalmed.com'),
('LifeDistribuidora Medicamentos LTDA', '(85) 98211-7754');

INSERT INTO medicamentos(id_fornecedores, codigo, nome, principio_ativo, validade_med, preco)
VALUES
(1, 'PAR1023', 'Paracetamol 750mg', 'Paracetamol', '2027-03-15', 12.90),
(2, 'IBU3341', 'Ibuprofeno 400mg', 'Ibuprofeno', '2026-11-10', 18.50),
(3, 'AMX5520', 'Amoxicilina 500mg', 'Amoxicilina', '2026-08-22', 24.90),
(4, 'DIP7742', 'Dipirona 1g', 'Metamizol', '2027-01-5', 9.80),
(5, 'LOR9031', 'Loratadina 10mg', 'Loratadina', '2028-02-01', 14.20),
(6, 'OME4410', 'Omeprazol 20mg', 'Omeprazol', '2027-06-30', 19.99),
(7, 'CET6108', 'Cetoprofeno 100mg', 'Cetoprofeno', '2026-12-18', 22.40),
(8, 'AZI8217', 'Azitromicina 500mg', 'Azitromicina', '2027-09-12', 34.80),
(9, 'HID9914', 'Hidroxicloroquina 400mg', 'Hidroxicloroquina', '2028-01-20', 57.00),
(10, 'LOS5129', 'Losartana 50mg', 'Losartana Potássica', '2027-04-14', 16.70);

INSERT INTO estoque(id_medicamentos, quantidade, lote, validade_lote, data_entrada)
VALUES
(1, 120, 'LOTE-A102', '2027-03-10', '2025-11-01'),
(2, 80, 'LOTE-B221', '2026-10-15', '2025-10-20'),
(3, 60, 'LOTE-C330', '2026-08-10', '2025-09-18'),
(4, 200, 'LOTE-D404', '2027-01-02', '2025-11-05'),
(5, 50, 'LOTE-E515', '2028-01-25', '2025-11-12'),
(6, 90, 'LOTE-F689', '2027-06-20', '2025-10-28'),
(7, 70, 'LOTE-G778', '2026-12-10', '2025-11-03'),
(8, 50, 'LOTE-H843', '2027-09-02', '2025-09-30'),
(9, 40, 'LOTE-I902', '2028-01-12', '2025-11-04'),
(10, 110, 'LOTE-J110', '2027-04-05', '2025-11-08');

-- Visualizar o no

INSERT INTO clientes(nome, telefone, cpf)
VALUES
('Ana Paula Ribeiro', '11987654321', '123.456.789-09'),
('Carlos Eduardo Silva', '11991234567', '987.654.321-00'),
('Mariana Santos Oliveira', '21999887766', '321.654.987-12'),
('Pedro Henrique Almeida', '31988776655', '852.741.963-44'),
('Júlia Ferreira Costa', '41991223344', '741.852.963-20'),
('Ricardo Monteiro Souza', '31990011223', '159.357.258-36'),
('Beatriz Carvalho Mendes', '31995544332', '258.369.147-85'),
('Fernanda Lima Duarte', '51988442211', '654.987.321-77'),
('Lucas Martins Fonseca', '11992221100', '963.258.741-19'),
('Camila Rocha Barros', '21997766554', '789.123.456-55');

INSERT INTO medicos(crm, nome, especialidade, contato)
VALUES
('123456-SP', 'Roberto Almeida', 'Cardiologia', '11987654321'),
('234567-RJ', 'Mariana Torres', 'Pediatria', '21998877665'),
('345678-MG', 'Felipe Monteiro', 'Ortopedia', '31992233445'),
('456789-PR', 'Helena Martins', 'Ginecologia', '41991122334'),
('567890-RS', 'Gustavo Nogueira', 'Dermatologia', '51988445533'),
('678901-BA', 'Camila Vasconcelos', 'Neurologia', '71997766554'),
('789012-CE', 'Ricardo Fontes', 'Endocrinologia', '85993322110'),
('890123-SC', 'Larissa Carvalho', 'Oftalmologia', '48991234567'),
('901234-GO', 'André Silveira', 'Urologia', '62995544112'),
('012345-PE', 'Juliana Mendes', 'Psiquiatria', '81990011223');

INSERT INTO receitas_medicas(id_clientes, id_medicos, id_medicamentos, validade_receita, data_emissao)
VALUES
(1, 3, 5, '2025-12-30', '2025-11-20'),
(2, 1, 2, '2025-12-15', '2025-11-18'),
(3, 7, 8, '2026-01-10', '2025-11-19'),
(4, 5, 1, '2025-12-05', '2025-11-10'),
(5, 9, 4, '2026-02-02', '2025-11-21'),
(6, 2, 9, '2025-12-28', '2025-11-14'),
(7, 4, 6, '2026-01-30', '2025-11-16'),
(8, 8, 3, '2026-02-12', '2025-11-22'),
(9, 6, 7, '2026-01-20', '2025-11-17'),
(10, 10, 10, '2025-12-25', '2025-11-13');

INSERT INTO funcionarios(matricula, nome, cargo, turno)
VALUES
('F001', 'João Marcos Ferreira', 'Atendente', 'Manhã'),
('F002', 'Camila Ribeiro Costa', 'Farmacêutico', 'Tarde'),
('F003', 'Lucas Andrade Souza', 'Caixa', 'Noite'),
('F004', 'Mariana Lopes Silva', 'Estoquista', 'Manhã'),
('F005', 'Rafael Batista Mendes', 'Gerente', 'Integral'),
('F006', 'Ana Paula Nogueira', 'Assistente Administrativo', 'Tarde'),
('F007', 'Bruno Martins Duarte', 'Entregador', 'Manhã'),
('F008', 'Pedro Henrique Carvalho', 'Auxiliar de Limpeza', 'Tarde'),
('F009', 'Juliana Rocha Lima', 'Supervisora', 'Noite'),
('F010', 'Beatriz Monteiro Alves', 'RH', 'Manhã');

INSERT INTO vendas(id_clientes, id_funcionarios, data_venda, valor_total)
VALUES
(1, 3, '2025-11-10', 12.90),
(2, 1, '2025-11-12', 18.50),
(3, 5, '2025-11-14', 24.90),
(4, 2, '2025-11-15', 22.70),
(5, 4, '2025-11-17', 54.79),
(6, 6, '2025-11-18', 34.80),
(7, 8, '2025-11-19', 73.70),
(8, 10, '2025-11-20', 32.10),
(9, 7, '2025-11-21', 57.39),
(10, 9, '2025-11-22', 79.20);

INSERT INTO itens_vendas(id_vendas, id_medicamentos, quantidade, valor_unitario)
VALUES
(1, 3, 1, 24.90),
(2, 1, 2, 12.90),
(3, 5, 1, 14.20),
(4, 2, 3, 18.50),
(5, 4, 2, 9.80),
(6, 6, 1, 19.99),
(7, 8, 2, 34.80),
(8, 10, 1, 16.70),
(9, 7, 3, 22.40),
(10, 9, 1, 57.00);

INSERT INTO pagamentos(id_vendas, forma_pagamento, status_pagamento)
VALUES
(1, 'Cartão', 'Aprovado'),
(2, 'Pix', 'Aprovado'),
(3, 'Boleto', 'Em análise'),
(4, 'Cartão', 'Recusado'),
(5, 'Pix', 'Aprovado'),
(6, 'Boleto', 'Aprovado'),
(7, 'Cartão', 'Em análise'),
(8, 'Pix', 'Recusado'),
(9, 'Boleto', 'Aprovado'),
(10, 'Cartão', 'Aprovado');



