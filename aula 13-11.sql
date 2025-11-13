CREATE VIEW v_pedido_detalhados AS 
SELECT
	p.id AS id_pedido,
    u.nome AS nome_cliente,
    p.status AS	status_pedido,
    pr.nome AS nome_produto,
    ip.quantidade AS quantidade_comprada,
    ip.preco_unitario AS preco_unitario
FROM
	pedidos AS p
JOIN
	usuarios AS u ON u.id = p.cliente_id
JOIN
	itens_pedido AS ip ON p.id = ip.pedido_id
JOIN
	produtos AS pr ON pr.id = ip.produto_id;
    
    SELECT * FROM v_pedido_detalhados;

CREATE VIEW v_clientes_sem_senha AS
SELECT 
	id, 
    nome, 
    email, 
    celular,
    criado_em
FROM
	usuarios;
    
	SELECT * FROM v_clientes_sem_senha;
    
CREATE VIEW v_resumo_estoque_baixo AS
SELECT 
	p.id AS id_produto,
    p.nome AS nome_produto,
    p.estoque AS estoque_atual,
    p.preco AS preco_venda,
    c.nome AS categoria
FROM
	produtos AS p
JOIN
	categorias AS c ON c.id = p.categoria_id
WHERE
	p.estoque < 10;
    
SELECT * FROM v_resumo_estoque_baixo;
    