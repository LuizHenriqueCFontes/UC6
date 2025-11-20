-- Procedure para verificar vendas por cliente
DELIMITER //

CREATE PROCEDURE vendas_por_cliente(IN id_cliente_param BIGINT)
BEGIN
	SELECT 
		c.nome AS nome_cliente,
        f.nome AS nome_funcionario,
        v.data_venda,
        v.valor_total
	FROM vendas AS v
    JOIN clientes AS c ON v.id_clientes = c.id_clientes
    JOIN funcionarios AS  f ON v.id_funcionarios = f.id_funcionarios
    WHERE v.id_clientes = id_cliente_param;
    
END//

DELIMITER ;

-- Visualizando pedidos aprovados
SELECT * FROM pagamentos 
WHERE status_pagamento = 'Aprovado';

-- Visualizando a maior venda por cliente
SELECT
	c.nome AS nome_cliente,
    f.nome AS nome_funcionario,
    v.data_venda,
    v.valor_total
FROM vendas AS v 
JOIN clientes AS c ON v.id_clientes = c.id_clientes
JOIN funcionarios AS f ON v.id_funcionarios = f.id_funcionarios
WHERE v.valor_total = (SELECT MAX(valor_total) FROM vendas);

-- Verificando o produto que esta mais proximo de vencer
SELECT * FROM estoque
WHERE validade_lote = (SELECT MIN(validade_lote) FROM estoque);

-- Simulando uma venda com procedure
DELIMITER //

CREATE PROCEDURE registrar_venda(IN id_estoque_param BIGINT, IN quantidade_atualizada INT)

BEGIN

UPDATE estoque
SET quantidade = quantidade - quantidade_atualizada
WHERE id_estoque = id_estoque_param;

END//

DELIMITER ;

-- Visualizando os produtos que tiveram mais quantidades vendidas
SELECT * FROM itens_vendas
ORDER BY quantidade DESC
LIMIT 3;

-- Visualizando o nome dos remedios
SELECT 
	m.nome AS nome_medicamento,
    iv.quantidade,
    iv.valor_unitario
FROM itens_vendas AS iv
JOIN medicamentos AS m ON iv.id_medicamentos = m.id_medicamentos; 

-- Visualizando os funcionarios que trabalham no periodo da manhã
SELECT * FROM funcionarios 
WHERE turno = 'Manhã';

-- Visualizando o produto que tem o maior preço
	SELECT * FROM medicamentos 
    WHERE preco = (SELECT MAX(preco) FROM medicamentos);
    
    -- Visualizando o produto que tem maior estoque
SELECT 
	m.nome AS nome_medicamento,
    e.quantidade,
    e.lote,
    e.validade_lote,
    e.data_entrada
FROM estoque AS e
JOIN medicamentos AS m ON e.id_medicamentos = m.id_medicamentos
WHERE e.quantidade = (SELECT MAX(quantidade) FROM estoque);

-- Visualizando a data de emissao mais recente
SELECT * FROM receitas_medicas
WHERE data_emissao = (SELECT MIN(data_emissao) FROM receitas_medicas);

-- Visualizando qual medico trabalha na area de oftalmologia
SELECT * FROM medicos
WHERE especialidade = 'Oftalmologia';

-- Visualizando quantos pagamentos foram no pix
SELECT * FROM pagamentos
WHERE forma_pagamento = 'Pix';

-- Visualizando o produto que esta mais distante de vencer
SELECT * FROM medicamentos
WHERE validade_med = (SELECT MAX(validade_med) FROM medicamentos);

-- Visualizando pagamentos realizados no cartão
SELECT * FROM pagamentos
WHERE forma_pagamento = 'Cartão';

-- Visualizando pagamentos realizados no boleto
SELECT * FROM pagamentos
WHERE forma_pagamento = 'Boleto';

-- visualizando o nome do cliente e do medico, na receita
SELECT 
	c.nome AS nome_cliente,
    m.nome AS nome_medico,
    medc.nome AS nome_medicamento,
    rm.validade_receita,
    rm.data_emissao
FROM receitas_medicas AS rm
JOIN clientes AS c ON rm.id_clientes = c.id_clientes
JOIN medicos AS m ON rm.id_medicos = m.id_medicos
JOIN medicamentos AS medc ON rm.id_medicamentos = medc.id_medicamentos;

-- Verificando o nome do fornecedor dos medicamentos
SELECT 
	f.razao_social AS nome_fornecedor,
    m.codigo,
    m.nome,
    m.principio_ativo,
    m.validade_med,
    m.preco
FROM medicamentos AS m
JOIN fornecedores AS f ON m.id_fornecedores = f.id_fornecedores;

-- Aplicando um desconto
START TRANSACTION;
	UPDATE medicamentos
    SET preco = preco - 5
    WHERE id_medicamentos = 1;
    
    UPDATE medicamentos 
    SET preco = preco - 12
    WHERE id_medicamentos = 9;
    
    SELECT * FROM medicamentos;

ROLLBACK;

SELECT * FROM medicamentos;

-- Visualizando os pagamentos que foram recusados
SELECT * FROM pagamentos
WHERE status_pagamento = 'Recusado';