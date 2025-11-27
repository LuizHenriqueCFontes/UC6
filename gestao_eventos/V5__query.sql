SELECT 
    e.nome AS nome_evento,
    e.tema,
    p.nome
FROM palestras AS p
JOIN eventos AS e ON p.id_eventos = e.id_eventos;

SELECT * FROM eventos;

SELECT * FROM eventos
WHERE data_evento = '2025-12-05' OR data_evento = '2025-12-06';

CREATE VIEW view_maiores_vagas AS SELECT
e.nome,
e.tema,
e.data_evento,
e.vagas
FROM eventos AS e
ORDER BY vagas desc
LIMIT 10;

SELECT * FROM view_maiores_vagas;

DELIMITER //

CREATE PROCEDURE prcd_atualizar_vagas()
BEGIN
	IF(SELECT vagas FROM eventos WEHRE id_eventos = 2) THEN
    
    END IF
    UPDATE eventos
    SET vagas = vagas - 1
    WHERE id_eventos = 2;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER atualizar_vagas_deletadas
AFTER DELETE ON inscricoes
FOR EACH ROW

BEGIN
	UPDATE eventos
    SET vagas = vagas + 1
    WHERE id_eventos = OLD.id_eventos;
END//

DELIMITER ;


	
    