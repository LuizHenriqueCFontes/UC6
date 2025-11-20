ALTER TABLE vendas
ADD COLUMN origem_vendas ENUM('Presencial', 'Online') NOT NULL;