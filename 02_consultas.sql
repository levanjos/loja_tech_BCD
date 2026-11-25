USE loja_tech;

SELECT nome, email
FROM clientes;

SELECT nome, preco
FROM produtos
WHERE preco < 500.00;

SELECT *
FROM pedidos
WHERE status = 'pendente';

SELECT nome, estoque
FROM produtos
WHERE id_categoria = 3
AND estoque > 40;

SELECT COUNT(*) AS total_clientes
FROM clientes;

SELECT SUM(valor_total) AS faturamento_bruto 
FROM pedidos;

SELECT p.nome AS produto, c.nome AS categoria
FROM produtos p 
INNER JOIN categorias c ON  p.id_categoria = c.id_categoria;

SELECT pe.id_pedido, pe.status, pe.valor_total
FROM pedidos pe
INNER JOIN clientes c ON pe.id_cliente = c.id_cliente
WHERE c.nome = 'Ana Silva';