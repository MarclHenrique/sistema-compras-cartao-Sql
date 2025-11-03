-- Clientes
INSERT INTO Cliente (nome, cpf, data_nascimento)
VALUES ('João Silva', '12456789000', '1990-01-15');

INSERT INTO Cliente (nome, cpf, data_nascimento)
VALUES ('Maria Oliveira', '98765432100', '1995-03-22');

-- Cartões
INSERT INTO Cartao (numero, limite, saldo_disponivel, id_cliente)
VALUES ('1234123412341234', 5000.00, 5000.00, 1);

INSERT INTO Cartao (numero, limite, saldo_disponivel, id_cliente)
VALUES ('4321432143214321', 3000.00, 3000.00, 2);

-- Compras
INSERT INTO Compra (descricao, valor, id_cartao)
VALUES ('Notebook', 2500.00, 1);

INSERT INTO Compra (descricao, valor, id_cartao)
VALUES ('Mouse', 150.00, 1);

INSERT INTO Compra (descricao, valor, id_cartao)
VALUES ('Teclado', 200.00, 1);

INSERT INTO Compra (descricao, valor, id_cartao)
VALUES ('Monitor', 1200.00, 2);

INSERT INTO Compra (descricao, valor, id_cartao)
VALUES ('Impressora', 800.00, 2);
