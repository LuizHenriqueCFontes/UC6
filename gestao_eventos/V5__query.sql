
-- visualizando o nome do evento da palestra
SELECT 
    e.nome AS nome_evento,
    e.tema,
    p.nome
FROM palestras AS p
JOIN eventos AS e ON p.id_eventos = e.id_eventos;

SELECT * FROM eventos;

-- visualizando as datas dos eventos do proximo final de semana
SELECT * FROM eventos
WHERE data_evento = '2025-12-05' OR data_evento = '2025-12-06';

-- criando uma view para visualizar as dez maiores vagas
CREATE VIEW view_maiores_vagas AS SELECT
e.nome,
e.tema,
e.data_evento,
e.vagas
FROM eventos AS e
ORDER BY vagas desc
LIMIT 10;

SELECT * FROM view_maiores_vagas;

-- procedure para verificar se tem vagas disponiveis, e caso tiver, realizar a inscrição e diminuir as vagas disponiveis
DELIMITER //
CREATE PROCEDURE prcd_atualizar_vagas(IN prcd_evento INT)
BEGIN
	DECLARE vagas_disponiveis INT;
    
    SELECT vagas INTO vagas_disponiveis
    FROM eventos
    WHERE id_eventos = prcd_evento;
    
    IF vagas_disponiveis <= 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'vagas esgotadas';
    END IF;
    
	INSERT INTO inscricoes (id_eventos, id_participantes, valor)
	VALUES(prcd_evento, 2, 345.90);
		
	UPDATE eventos
	SET vagas = vagas - 1
	WHERE id_eventos = prcd_evento;
   

END//

DELIMITER ;

DELIMITER //

-- trigger para caso tiver uma inscrição deletada, o evento receber essa vaga de volta
CREATE TRIGGER atualizar_vagas_deletadas
AFTER DELETE ON inscricoes
FOR EACH ROW

BEGIN
	UPDATE eventos
    SET vagas = vagas + 1
    WHERE id_eventos = OLD.id_eventos;
END//

DELIMITER ;


-- Visualizando o nome do evento e do participantes da inscrição
SELECT 	
	e.nome AS nome_evento,
    p.nome AS nome_participante,
    i.valor
FROM inscricoes AS i
JOIN eventos AS e ON i.id_eventos = e.id_eventos
JOIN participantes AS p ON i.id_participantes = p.id_participantes;


	
    
