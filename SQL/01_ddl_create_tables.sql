CREATE TABLE cliente (
                         id SERIAL PRIMARY KEY,
                         nome VARCHAR(100) NOT NULL,
                         cpf CHAR(11) UNIQUE NOT NULL,
                         data_nascimento DATE
);

CREATE TABLE cartao (
                        id SERIAL PRIMARY KEY,
                        numero VARCHAR(255) UNIQUE NOT NULL,
                        limite DECIMAL(10,2) NOT NULL,
                        saldo_disponivel DECIMAL(10,2) NOT NULL,
                        id_cliente INTEGER NOT NULL,
                        CONSTRAINT fk_cartao_cliente
                            FOREIGN KEY (id_cliente)
                                REFERENCES cliente (id)
                                ON DELETE CASCADE
);

CREATE TABLE compra (
                        id SERIAL PRIMARY KEY,
                        descricao VARCHAR(255) NOT NULL,
                        valor DECIMAL(10,2) NOT NULL,
                        data_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        id_cartao INTEGER NOT NULL,
                        CONSTRAINT fk_compra_cartao
                            FOREIGN KEY (id_cartao)
                                REFERENCES cartao (id)
                                ON DELETE CASCADE
);