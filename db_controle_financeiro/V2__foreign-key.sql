ALTER TABLE contas
ADD CONSTRAINT fk_contas_clientes
FOREIGN KEY(id_clientes) REFERENCES clientes(id_clientes);

ALTER TABLE transacoes
ADD constraint fk_transacoes_contas
FOREIGN KEY(id_contas) REFERENCES contas(id_clientes);

ALTER TABLE log_auditorias
ADD CONSTRAINT fk_log_auditorias_clientes
FOREIGN KEY(id_clientes) REFERENCES clientes(id_clientes);