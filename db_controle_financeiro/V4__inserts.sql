DELIMITER //

CREATE PROCEDURE InserirClientes()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 170 DO
        INSERT INTO clientes (nome, cpf, email, telefone)
        VALUES (
            CONCAT('Cliente ', i),
            CONCAT(LPAD(i,3,'0'), '.', LPAD(i,3,'0'), '.', LPAD(i,3,'0'), '-', LPAD(i%100,2,'0')),
            CONCAT('cliente', i, '@email.com'),
            CONCAT('119', LPAD(i,8,'0'))
        );
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL InserirClientes();

DELIMITER //

CREATE PROCEDURE InserirContas()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE saldo DECIMAL(10,2);

    WHILE i <= 170 DO
        SET saldo = ROUND(1000 + RAND()*4000, 2); -- saldo aleatório entre 1000 e 5000
        INSERT INTO contas (id_clientes, numero_conta, saldo)
        VALUES (
            i,
            CONCAT(LPAD(i,4,'0'), '-001'),
            saldo
        );
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL InserirContas();

DELIMITER //

CREATE PROCEDURE InserirTransacoes()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE valor DECIMAL(10,2);
    DECLARE tipo ENUM('Pix', 'Crédito', 'Débito');
    DECLARE data_transacao DATE;

    WHILE i <= 170 DO
        SET valor = ROUND(10 + RAND()*990, 2); -- valor aleatório entre 10 e 1000
        SET tipo = ELT(FLOOR(1 + RAND()*3), 'Pix', 'Crédito', 'Débito');
        SET data_transacao = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*365) DAY);

        INSERT INTO transacoes (id_contas, valor, tipo_transacao, data_transacao)
        VALUES (i, valor, tipo, data_transacao);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL InserirTransacoes();





