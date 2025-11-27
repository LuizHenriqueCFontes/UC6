DELIMITER $$

CREATE PROCEDURE gerar_eventos()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 2500 DO
        INSERT INTO eventos (nome, tema, data_evento, vagas)
        VALUES (
            CONCAT('Evento ', i),
            CONCAT('Tema ', i),
            DATE_ADD(CURDATE(), INTERVAL (i % 365) DAY),
            FLOOR(50 + RAND()*450)  -- vagas entre 50 e 500
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

CALL gerar_eventos();

DELIMITER $$

CREATE PROCEDURE gerar_participantes()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 2500 DO
        INSERT INTO participantes (nome, idade, categoria, email)
        VALUES (
            CONCAT('Participante ', i),
            FLOOR(18 + RAND()*52),  -- idade 18 a 70
            IF(RAND() < 0.2, 'Vip', 'Comum'),
            CONCAT('participante', i, '@email.com')
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

CALL gerar_participantes();

DELIMITER $$

CREATE PROCEDURE gerar_inscricoes()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 2500 DO
        INSERT INTO inscricoes (id_eventos, id_participantes, valor)
        VALUES (
            FLOOR(1 + RAND()*2500),  -- id_eventos existente
            FLOOR(1 + RAND()*2500),  -- id_participantes existente
            ROUND(50 + RAND()*450, 2) -- valor entre 50 e 500
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

CALL gerar_inscricoes();

DELIMITER $$

CREATE PROCEDURE gerar_palestras()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 2500 DO
        INSERT INTO palestras (id_eventos, nome, tema)
        VALUES (
            FLOOR(1 + RAND()*2500),  -- id_eventos existente
            CONCAT('Palestra ', i),
            CONCAT('Tema Palestra ', i)
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

CALL gerar_palestras();

















