-- Inserindo um relacionamento entre estoque e medicamentos
ALTER TABLE estoque 
ADD CONSTRAINT fk_estoque_medicamentos
FOREIGN KEY(id_medicamentos) REFERENCES medicamentos(id_medicamentos);

-- Inserindo um relacionamento entre receitas_medicas e clientes
ALTER TABLE receitas_medicas
ADD CONSTRAINT fk_receitas_medicas_clientes
FOREIGN KEY(id_clientes) REFERENCES clientes(id_clientes);

-- Inserindo um relacionamento entre receitas_medicas e medicos
ALTER TABLE receitas_medicas
ADD CONSTRAINT fk_receitas_medicas_medicos
FOREIGN KEY(id_medicos) REFERENCES medicos(id_medicos);

-- Inserindo um relacionamento entre receitas_medicas e medicamentos
ALTER TABLE receitas_medicas
ADD CONSTRAINT fk_receitas_medicas_medicamentos
FOREIGN KEY(id_medicamentos) REFERENCES medicamentos(id_medicamentos);

-- Inserindo um relacionamento entre vendas e clientes
ALTER TABLE vendas
ADD CONSTRAINT fk_vendas_clientes
FOREIGN KEY(id_clientes) REFERENCES clientes(id_clientes);

-- Inserindo um relacionamento entre vendas e funcionarios
ALTER TABLE vendas
ADD CONSTRAINT fk_vendas_funcionarios
FOREIGN KEY(id_funcionarios) REFERENCES funcionarios(id_funcionarios);

-- Inserindo um relacionamento entre itens_vendas e vendas
ALTER TABLE itens_vendas
ADD CONSTRAINT fk_itens_vendas_vendas
FOREIGN KEY(id_vendas) REFERENCES vendas(id_vendas);

-- Inserindo um relacionamento entre itens_vendas e medicamentos
ALTER TABLE itens_vendas
ADD CONSTRAINT fk_itens_vendas_medicamentos
FOREIGN KEY(id_medicamentos) REFERENCES medicamentos(id_medicamentos);

-- Inserindo um relacionamento entre pagamentos e vendas
ALTER TABLE pagamentos
ADD CONSTRAINT fk_pagamentos_vendas
FOREIGN KEY(id_vendas) REFERENCES vendas(id_vendas);

ALTER TABLE medicamentos
ADD CONSTRAINT fk_medicamentos_fornecedores
FOREIGN KEY(id_fornecedores) REFERENCES fornecedores(id_fornecedores);
