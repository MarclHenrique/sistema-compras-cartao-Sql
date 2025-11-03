--Listar todas as compras realizadas por um cliente específico --

SELECT
    c.nome AS cliente,
    cp.descricao AS produto,
    cp.valor,
    cp.data_compra
FROM cliente c
         JOIN cartao ca ON c.id = ca.id_cliente
         JOIN compra cp ON ca.id = cp.id_cartao
WHERE c.nome = 'João Silva';

-- Mostrar o saldo disponível de um cartão após todas as compras --
SELECT
    ca.numero AS Cartao,
    ca.limite - SUM(cp.valor) AS saldo_disponivel
FROM cartao ca
         LEFT JOIN compra cp ON ca.id = cp.id_cartao
WHERE ca.numero = '1234123412341234'
GROUP BY ca.id, ca.numero, ca.limite;

-- Exibir um resumo detalhado das compras realizadas por cliente --
SELECT
    c.nome AS cliente,
    ca.numero AS numero_cartao,
    SUM(cp.valor) AS total_gasto,
    COUNT(cp.id) AS quantidade_compras
FROM cliente c
         JOIN cartao ca ON c.id = ca.id_cliente
         JOIN compra cp ON ca.id = cp.id_cartao
GROUP BY c.nome, ca.numero;

--Listar os clientes que realizaram compras acima de um valor específico --
SELECT
    c.nome AS cliente
FROM cliente c
         JOIN cartao ca ON c.id = ca.id_cliente
         JOIN compra cp ON ca.id = cp.id_cartao
WHERE cp.valor > 2000.00;