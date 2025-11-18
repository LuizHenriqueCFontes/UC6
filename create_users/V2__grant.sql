GRANT CREATE VIEW ON ecommerce.* TO 'suporte_ti'@'localhost';
GRANT CREATE ROUTINE ON ecommerce.* TO 'suporte_ti'@'localhost';

GRANT SELECT ON ecommerce.* TO 'bi_analista'@'%';

GRANT SELECT ON ecommerce.pedidos TO 'devolucoes'@'%';
GRANT DELETE ON ecommerce.itens_pedido TO 'devolucoes'@'%';

GRANT DROP ON *.* TO 'teste_dev'@'localhost';