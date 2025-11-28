-- listar o cliente e o saldo da conta
SELECT 
	cli.nome AS nome_cliente,
    con.saldo
FROM contas AS con
JOIN clientes AS cli ON con.id_clientes = cli.id_clientes;

-- verificando transações maiores que dez mil
SELECT * FROM transacoes 
WHERE valor > 10000;

-- criando uma view para olhar o saldo e o cliente
CREATE VIEW v_saldo_atualizado AS SELECT
cli.nome AS cliente_nome,
cont.saldo
FROM contas AS cont 
JOIN clientes AS cli ON cont.id_clientes = cli.id_clientes;

-- Visualizando a conta com menor saldo
SELECT * FROM contas
ORDER BY saldo ASC
LIMIT 1;

-- procedure para inserir dados dentro de transacoes
DELIMITER //

CREATE PROCEDURE realizar_tranferencia(IN p_id_contas BIGINT,
									  IN p_valor DECIMAL(10, 2),
									  IN p_tipo_transacao VARCHAR(10),
                                      IN p_data_transacao DATE)
BEGIN
	
    DECLARE p_saldo DECIMAL(10, 2);
    
	SELECT saldo INTO p_saldo
    FROM contas
    WHERE id_contas = p_id_contas;
    
    IF p_saldo < p_valor THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Saldo insuficiente';
    END IF;
	
	INSERT INTO transacoes(id_contas, valor, tipo_transacao, data_transacao)
    VALUES(p_id_contas_p_valor_p_tipo_transacao_p_data_transacao);
END//

DELIMITER ;

-- trigger para verificar quem alterou o saldo na conta
DELIMITER //

CREATE TRIGGER verificar_alteracao_saldo
AFTER UPDATE ON contas
FOR EACH ROW
BEGIN
	IF OLD.saldo <> NEW.saldo THEN
		INSERT INTO log_auditorias(id_clientes, data_mudanca, saldo_anterior, saldo_atual)
		VALUES(OLD.id_clientes, CURDATE(), OLD.saldo, NEW.saldo);
    END IF;
END//


DELIMITER ;

START TRANSACTION;
	INSERT INTO transacoes(id_contas, valor, tipo_transacao, data_transacao)
    VALUES(2, 234.00, 'Pix', CURDATE());
    
    UPDATE contas
	SET saldo = saldo - 234
    WHERE id_contas = 2
    LIMIT 1;


COMMIT;

-- Visualizando o cliente que realizou a transação
SELECT
	cli.nome AS nome_cliente,
    t.id_contas,
    t.valor,
    t.tipo_transacao,
    t.data_transacao
FROM transacoes AS t
JOIN contas ON t.id_contas = contas.id_clientes
JOIN clientes AS cli ON contas.id_clientes = cli.id_clientes;

SELECT SUM(valor)
FROM transacoes
WHERE tipo_transacao = 'Débito' OR tipo_transacao = 'Crédito'
GROUP BY valor;
    

	