-- Adicionando as chaves estrangeiras na tabela de entregas 
ALTER TABLE entregas
ADD CONSTRAINT fk_entregas_clientes
FOREIGN KEY(id_clientes) REFERENCES clientes(id_clientes);

ALTER TABLE entregas
ADD CONSTRAINT fk_entregas_motoristas
FOREIGN KEY(id_motoristas) REFERENCES motoristas(id_motoristas);

ALTER TABLE entregas
ADD CONSTRAINT fk_entregas_veiculos
FOREIGN KEY(id_veiculos) REFERENCES veiculos(id_veiculos);

ALTER TABLE entregas
ADD CONSTRAINT fk_entregas_rotas
FOREIGN KEY(id_rotas) REFERENCES rotas(id_rotas);

-- Adicionando a chave estrangeira na tabela de ocorrencias
ALTER TABLE ocorrencias
ADD CONSTRAINT fk_ocorrencias_entregas
FOREIGN KEY(id_entregas) REFERENCES entregas(id_entregas);

-- Adicionando as chaves estrangeiras na tabela de pagamentos
ALTER TABLE pagamentos
ADD CONSTRAINT fk_pagamentos_clientes
FOREIGN KEY(id_clientes) REFERENCES clientes(id_clientes);

ALTER TABLE pagamentos
ADD CONSTRAINT fk_pagamentos_entregas
FOREIGN KEY(id_entregas) REFERENCES entregas(id_entregas);