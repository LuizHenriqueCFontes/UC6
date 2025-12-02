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


DELIMITER $$

CREATE FUNCTION recalcular_total_pedido(pedido_id_param INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
	DECLARE total_geral DECIMAL(10, 2);
    
    SELECT
		SUM(ip.quantidade * ip.preco_unitario)
	INTO total_geral
    FROM itens_pedido AS ip
    WHERE ip.pedido_id = pedido_id_param;
    
    IF total_geral IS NULL THEN
		RETURN 0.00;
        
	ELSE 
		RETURN total_geral;
        
    END IF;
END$$

DELIMITER ;

SELECT
	id,
    total AS Total_Armazenado,
    recalcular_total_pedido(id) AS Total_Recalculado
FROM pedidos;


DELIMITER $$

CREATE FUNCTION formatar_endereco(endereco_id INT)
RETURNS VARCHAR(500)
READS SQL DATA

BEGIN
	DECLARE endereco_formatado VARCHAR(500);
	
    SELECT 
		CONCAT(
			rua, ', ',
            numero, ' - ',
            bairro, ', ',
            cidade, '/',
            estado, ' - CEP: ',
            cep
        )
	INTO endereco_formatado
    WHERE id = endreco_id;
    
    RETURN endereco_formatado;
END$$

DELIMITER ;

SELECT 
	u.nome AS Cliente,
	formatar_endereco(e.id) AS Endereco_completo
FROM usuarios AS u
JOIN enderecos AS e ON u.id = e.cliente_id;
