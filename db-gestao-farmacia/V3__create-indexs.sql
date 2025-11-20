-- Criando um index na tabela de medicamentos na coluna nome
CREATE INDEX idx_medicamentos_nome ON medicamentos(nome);

-- Criando um index na tabela clientes na coluna cpf
CREATE INDEX idx_clientes_cpf ON clientes(cpf);

-- Criando um index na tabela medicos na columa crm
CREATE INDEX idx_medicos_crm ON medicos(crm);