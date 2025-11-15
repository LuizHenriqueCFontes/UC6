-- Visualizando quis entregas não foram entregues
SELECT * FROM entregas
WHERE status_entregas = 'Em transporte' OR 'Rota de entrega';

-- Visualizando as estregas concluídas
SELECT * FROM entregas
WHERE status_entregas = 'Entregue';
    
 -- implementando uma view para visualizar a distancia   
CREATE VIEW v_distancia_veiculos AS SELECT	
		v.id_veiculos AS veiculos,
		r.distancia AS distancia,
		AVG(distancia) AS media_percorrida
FROM entregas AS e
JOIN rotas AS r ON r.id_rotas = e.id_rotas
JOIN veiculos AS v ON e.id_veiculos = v.id_veiculos
GROUP BY veiculos;

-- Visualizando a maior distancia
SELECT * FROM v_distancia_veiculos
WHERE distancia = (SELECT MAX(distancia) FROM v_distancia_veiculos);

-- Visualizando quais veiculo estao em rota de entrega
SELECT * FROM entregas
WHERE status_entregas = 'Rota de entrega';

-- Visualizando o cliente, motorista, origem, destino e distancia da viagem
SELECT c.nome AS nome_cliente,
		m.nome AS nome_motorista,
        r.origem,
        r.destino,
        r.distancia
FROM entregas AS e
JOIN clientes AS c ON e.id_clientes = c.id_clientes
JOIN motoristas AS m ON e.id_clientes = m.id_motoristas
JOIN rotas AS r ON e.id_rotas = r.id_rotas;

-- Visualizando os motoristas que estão com a cnh suspensa
SELECT * FROM motoristas
WHERE condicao = 'Suspensa';

-- Visualizando os motoristas que estão com a cnh ativa
SELECT * FROM motoristas
WHERE condicao = 'Ativa';

-- Visualizando os motoristas que estão com a cnh provisória
SELECT * FROM motoristas
WHERE condicao = 'Provisória';

-- Visualizando o veiculo mais novo
SELECT * FROM veiculos
WHERE ano = (SELECT MAX(ano) FROM veiculos);

-- Visualizando o veiculo mais antigo
SELECT * FROM veiculos
WHERE ano = (SELECT MIN(ano) FROM veiculos);

-- Visualizando veiculos em manutenção
SELECT * FROM veiculos
WHERE status_veiculos = 'Em manutenção';

-- Visualizando as reclamações
SELECT * FROM ocorrencias
WHERE tipo = 'Reclamação';

-- Visualizando os elogios
SELECT * FROM ocorrencias
WHERE tipo = 'Elogio';

-- Visualizando as sugestões
SELECT * FROM ocorrencias
WHERE tipo = 'Sugestão';

-- Visualizandos os clientes dos pagamentos
SELECT
	c.nome AS nome_cliente,
    p.valor,
    p.forma,
    p.status_pagamento
FROM pagamentos AS p
JOIN clientes AS c ON c.id_clientes = p.id_clientes;

-- Visualizando os funcionarios que trabalham nos recursos humanos
SELECT * FROM funcionarios_administrativos
WHERE setor = 'Recursos Humanos';

-- Visualizando os funcionarios que trabalham no juridico
SELECT * FROM funcionarios_administrativos
WHERE setor = 'Juridico';

-- Visualizando os funcionarios que trabalham no financeiro
SELECT * FROM funcionarios_administrativos
WHERE setor = 'Financeiro';

SELECT * FROM pagamentos
WHERE status_pagamento  = 'Recusado';

SELECT * FROM pagamentos
WHERE status_pagamento = 'Aprovado';

SELECT * FROM pagamentos
WHERE status_pagamento = 'Aguardando Aprovação';






	


		
