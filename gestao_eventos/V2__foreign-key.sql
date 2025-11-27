ALTER TABLE inscricoes
ADD CONSTRAINT fk_inscricoes_eventos
FOREIGN KEY(id_eventos) REFERENCES eventos(id_eventos);

ALTER TABLE inscricoes
ADD CONSTRAINT fk_inscricoes_participantes
FOREIGN KEY(id_participantes) REFERENCES participantes(id_participantes);

ALTER TABLE palestras
ADD CONSTRAINT fk_palestras_eventos
FOREIGN KEY(id_eventos) REFERENCES eventos(id_eventos);