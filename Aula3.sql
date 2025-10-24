ALTER TABLE  enderecos
ADD CONSTRAINT fk_endereco_usuario
FOREIGN KEY(cliente_id) REFERENCES usuarios(id);

ALTER TABLE produtos
ADD CONSTRAINT fk_produto_categoria
FOREIGN KEY(categoria_id) REFERENCES categorias(id);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedido_usuario
FOREIGN KEY(cliente_id) REFERENCES usuarios(id);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itens_pedido_pedido
FOREIGN KEY(pedido_id) REFERENCES pedidos(id);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itens_pedido_produto
FOREIGN KEY(produto_id) REFERENCES produtos(id);
