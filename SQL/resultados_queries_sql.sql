use ecommerce;
-- Filtros com WHERE Statement
-- -------------------------------------------
SELECT * FROM product WHERE category = 'Eletrônico';
-- Recupera todos os pedidos confirmados da tabela 'orders'
SELECT * FROM orders WHERE orderStatus = 'Confirmado';
-- Recupera todos os produtos com avaliação maior que 1 da tabela 'product'
SELECT * FROM product WHERE avaliação > 1;
-- --------------------------------------------
-- Crie expressões para gerar atributos derivados
SELECT AVG(avaliação) AS average_rating
FROM product;
-- ----------------------------------------------
-- Defina ordenações dos dados com ORDER BY
-- Recupera os produtos da categoria 'Alimentos' ordenados pelo nome
SELECT * FROM product WHERE category = 'Alimentos' ORDER BY Pname;
-- Recupera os clientes ordenados pelo sobrenome em ordem decrescente
SELECT * FROM clients ORDER BY Lname DESC;

-- -----------------------------------------
-- Defina ordenações dos dados com HAVING 
-- Recupera a média de avaliação por categoria de produto, apenas para categorias com média maior que 4
SELECT category, AVG(avaliação) AS media_avaliacao FROM product GROUP BY category HAVING AVG(avaliação) > 4;


-- Quantos pedidos foram feitos por cada cliente?
SELECT clients.Fname, clients.Lname, COUNT(orders.idOrder) AS total_pedidos
FROM clients
LEFT JOIN orders ON clients.idClient = orders.IdOrderClient
GROUP BY clients.idClient;

-- Algum vendedor também é fornecedor?
SELECT seller.socialName AS vendedor, supplier.socialName AS fornecedor
FROM seller
INNER JOIN supplier ON seller.socialName = supplier.socialName;

-- Relação de produtos fornecedores e estoques:
SELECT product.Pname AS produto, supplier.socialName AS fornecedor, productStorage.quantity AS estoque
FROM product
INNER JOIN productSupplier ON product.idProduct = productSupplier.IdsPproduct
INNER JOIN supplier ON productSupplier.idPsSupplier = supplier.idSupplier
INNER JOIN productStorage ON product.idProduct = productStorage.idProductStorage;

-- Relação de nomes dos fornecedores e nomes dos produtos:
SELECT supplier.socialName AS fornecedor, GROUP_CONCAT(product.Pname ORDER BY product.Pname ASC) AS produtos_fornecidos
FROM supplier
INNER JOIN productSupplier ON supplier.idSupplier = productSupplier.idPsSupplier
INNER JOIN product ON productSupplier.IdsPproduct = product.idProduct
GROUP BY supplier.idSupplier;

