SELECT * FROM usuarios;

SELECT nome, email FROM usuarios;

SELECT * FROM produtos;

SELECT * FROM pedidos WHERE status = 'Pendente';

SELECT nome, preco FROM produtos WHERE preco > 500;

 SELECT * FROM usuarios WHERE nome LIKE 'A%';
 
 SELECT * FROM enderecos WHERE estado = 'SP';
 
 SELECT * FROM pedidos WHERE status = 'Enviado' AND data_pedido > '2025-01-01';
 
 SELECT * FROM produtos WHERE estoque = 0;
 
 SELECT DISTINCT nome FROM categorias;
 
 SELECT * FROM usuarios ORDER BY nome;
 
 SELECT nome, preco FROM produtos ORDER BY preco DESC LIMIT 5;
 
 SELECT COUNT(*) FROM usuarios;
 
 SELECT AVG(preco) FROM produtos;
 
 SELECT SUM(total) FROM pedidos;
 
 SELECT COUNT(*) FROM pedidos WHERE STATUS = 'Pago';
 
 SELECT nome, preco FROM produtos ORDER BY preco ASC LIMIT 1;
 
 SELECT SUM(quantidade) FROM itens_pedido;
 
 SELECT SUM(estoque) FROM produtos;
 
 SELECT * FROM categorias ORDER BY id ASC LIMIT 10;
 
SELECT u.nome, e.rua
FROM usuarios AS u 
JOIN enderecos AS e ON u.id = e.cliente_id;

SELECT p.nome AS produto, c.nome AS categoria
FROM produtos AS p
JOIN categorias AS c ON p.categoria_id = c.id;

SELECT u.nome, p.status
FROM usuarios AS u
JOIN pedidos AS p ON u.id = p.cliente_id;

SELECT ip.pedido_id, prod.nome AS nome_produto
FROM itens_pedido AS ip
JOIN produtos AS prod ON ip.produto_id = prod.id;

SELECT u.nome AS cliente, p.status AS status_pedido, prod.nome AS nome_produto
FROM pedidos AS p
JOIN usuarios AS u ON p.cliente_id = u.id
JOIN itens_pedido AS ip ON p.id = ip.pedido_id
JOIN produtos AS prod ON ip.produto_id = prod.id;

SELECT p.nome AS nome_produto, ip.quantidade, ip.preco_unitario
FROM produtos AS p
JOIN itens_pedido AS ip ON p.id = ip.produto_id;
 
 