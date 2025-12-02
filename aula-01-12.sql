DELIMITER $$

CREATE FUNCTION cacular_total_item(item_id INT)
RETURNS DECIMAL(10,2)
READS SQL DATA

BEGIN
	DECLARE total DECIMAL(10, 2);
    
    SELECT quantidade * preco_unitario
    INTO total
    FROM itens_pedido
    WHERE id = item_id;
    
    RETURN total;
END$$

DELIMITER ;

SELECT calcular_total_item(1);

DELIMITER $$

CREATE FUNCTION verificar_nivel_estoque(produto_id INT)
RETURNS VARCHAR(20)
READS SQL DATA

BEGIN
	DECLARE nivel_estoque INT;
    DECLARE status_estoque VARCHAR(20);
    
    SELECT estoque
    INTO nivel_estoque
    FROM produtos
    WHERE id = produto_id;
    
    IF nivel_estoque IS NULL THEN
		SET status_estoque = 'Produto Inexistente';
    
    ELSEIF nivel_estoque < 10 THEN
		SET status_estoque = 'Estoque Baixo';
    
    ELSE 
		SET status_estoque = 'Estoque OK';
        
	END IF;
    
    RETURN status_estoque;
END$$

DELIMITER ;

SELECT nome, estoque, verificar_nivel_estoque(id)
FROM produtos;


