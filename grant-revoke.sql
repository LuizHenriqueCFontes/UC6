CREATE USER 'gestor_preco'@'%' IDENTIFIED BY 'preco_123';

GRANT SELECT ON ecommerce.produtos TO 'gestor_preco'@'%';

GRANT UPDATE (preco) ON ecommerce.produtos TO 'gestor_preco'@'%';

-- USUARIO LOG
CREATE USER 'log_atend'@'%' IDENTIFIED BY 'log_456';

GRANT SELECT ON ecommerce.usuarios TO 'log_atend'@'%';
GRANT SELECT ON ecommerce.produtos TO 'log_atend'@'%';
GRANT SELECT ON ecommerce.pedidos TO 'log_atend'@'%';

-- USUARIO ESTOQUE
CREATE USER 'integracao_estoque'@'%' IDENTIFIED BY 'int_789';

GRANT UPDATE(estoque) ON ecommerce.produtos TO 'integracao_estoque1'@'%';

GRANT INSERT(estoque) ON ecommerce.produtos TO 'integracao_estoaque'@'%';

-- USUARIO AUDITOR
CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'audit_101';

GRANT SELECT ON *.* TO 'auditor'@'localhost';

-- aplicando o revoke
REVOKE SELECT ON ecommerce.produtos FROM 'gestor_preco'@'%';

GRANT SELECT (id_produto, nome_produto, preco) ON ecommerces.produtos TO 'gestor_preco'@'%';

-- revoke and drop
REVOKE UPDATE(estoque) ON ecommerce.produtos FROM 'integracao_estoque''%';
REVOKE INSERT (estoque) ON ecommerce.produtos FROM 'integracao_estoque'@'%';

DROP USER 'integraacao_estoque'@'%'







