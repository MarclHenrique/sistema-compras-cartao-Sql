# 💳 Sistema de Compras com Cartão de Crédito

## 🧩 Desafio SQL

O objetivo deste desafio é fortalecer os conhecimentos sobre **banco de dados SQL**, abordando:
- Criação de tabelas com chaves primárias e estrangeiras  
- Definição de tipos de dados e restrições  
- Inserção e atualização de registros  
- Execução de consultas SQL com `JOIN`, `GROUP BY` e `WHERE`

---

## 🏗️ Estrutura do Banco de Dados

O banco modela um sistema de compras com cartão de crédito, composto por três entidades principais:

- **Cliente** → Armazena informações dos clientes  
- **Cartão** → Representa os cartões de crédito vinculados a clientes  
- **Compra** → Registra as compras realizadas com cada cartão  

### 🔹 Diagrama Relacional

![Diagrama do Banco de Dados](diagrama.png)

---

## 🗃️ Scripts SQL

Os scripts estão organizados por tipo no diretório [`/sql`](./sql).

### 📘 1. Estrutura das Tabelas (DDL)

Arquivo: [`01_ddl_create_tables.sql`](./sql/01_ddl_create_tables.sql)

```sql
CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE
);

CREATE TABLE cartao (
    id SERIAL PRIMARY KEY,
    numero CHAR(15) UNIQUE NOT NULL,
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
