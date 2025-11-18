REVOKE SELECT ON ecommerce.* FROM 'bi_analista'@'%';

GRANT SELECT ON ecommerce.categorias TO 'bi_analista'@'%';
GRANT SELECT ON ecommerce.enderecos TO 'bi_analista'@'%';
GRANT SELECT ON ecommerce.itens_pedido TO 'bi_analista'@'%';
GRANT SELECT ON ecommerce.pedidos TO 'bi_analista'@'%';
GRANT SELECT ON ecommerce.produtos TO 'bi_analista'@'%';	
GRANT SELECT(id, nome, email, telefone, celular, cpf, criado_em) ON ecommerce.usuarios TO 'bi_analista'@'%';



