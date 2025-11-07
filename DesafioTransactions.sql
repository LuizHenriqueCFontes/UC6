START TRANSACTION;
	INSERT INTO pedidos (id, cliente_id, data_pedido, status, total)
    VALUES (32, 1, '2025-11-06', 'Pago', 291.33), (33, 2, '2025-11-12', 'Pago', 813.10);
    
    UPDATE produtos
    SET estoque = estoque - 1
    WHERE id = 1
    LIMIT 1;
    
    UPDATE produtos
    SET estoque = estoque - 1
    WHERE id = 2
    LIMIT 1;

COMMIT;


START TRANSACTION;
	UPDATE produtos
    SET estoque = estoque + 7
    WHERE id = 1;
    
    UPDATE produtos
    SET estoque = estoque + 5
    WHERE id = 2;
    
    UPDATE produtos
    SET estoque = estoque + 3
    WHERE id = 3;

COMMIT;


START TRANSACTION;
	UPDATE produtos
    SET preco = 178.00
    WHERE id = 1;
    
    UPDATE produtos
    SET preco = 554.45
    WHERE id = 3;
    
    UPDATE produtos
    SET preco = 22.45
    WHERE id = 10;
    
    UPDATE produtos
    SET preco = 299.90
    WHERE id = 11;
	
    SELECT categoria_id, nome, preco FROM produtos WHERE categoria_id = 3;

ROLLBACK;

SELECT id, nome, preco from produtos 
WHERE categoria_id = 3;

