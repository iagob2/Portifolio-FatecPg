-- ============================================
-- Script: Atividade 02 - Banco de Dados Relacional
-- Descrição: Criação de tabelas e prática com DDL
-- ============================================

-- ============================================
-- CRIAÇÃO DAS TABELAS
-- ============================================

-- Tabela PRODUTO
-- Armazena informações dos produtos disponíveis
CREATE TABLE PRODUTO (
    cd_produto INTEGER PRIMARY KEY,           -- Código único do produto (chave primária)
    nm_produto VARCHAR(30) NOT NULL,          -- Nome do produto (obrigatório)
    vl_produto NUMBER(10,2) DEFAULT 10.50,    -- Valor do produto (padrão: 10.50)
    qt_produto INTEGER                        -- Quantidade em estoque
);

-- Tabela CLIENTE
-- Armazena informações dos clientes cadastrados
CREATE TABLE CLIENTE (
    cd_cliente INTEGER PRIMARY KEY,           -- Código único do cliente (chave primária)
    nm_cliente VARCHAR(40) NOT NULL,          -- Nome do cliente (obrigatório)
    cd_telefone_cliente NUMBER(11),           -- Telefone do cliente
    dt_cadastro_client DATE                   -- Data de cadastro
);

-- Tabela COMPRA
-- Registra as compras realizadas pelos clientes
-- Possui chave primária composta (dt_compra + cd_cliente)
CREATE TABLE COMPRA (
    dt_compra DATE,                           -- Data da compra
    cd_cliente INTEGER,                       -- Código do cliente
    vl_compra NUMBER(10,2),                   -- Valor total da compra
    
    -- Chave primária composta
    CONSTRAINT compra_pk PRIMARY KEY (dt_compra, cd_cliente),
    
    -- Chave estrangeira referenciando CLIENTE
    CONSTRAINT compra_fk FOREIGN KEY (cd_cliente) 
        REFERENCES CLIENTE(cd_cliente)
);

-- Tabela ITEM_COMPRA
-- Tabela associativa que resolve o relacionamento N:N entre COMPRA e PRODUTO
-- Cada item representa um produto dentro de uma compra
CREATE TABLE ITEM_COMPRA (
    cd_cliente INTEGER,                       -- Código do cliente
    dt_compra DATE,                           -- Data da compra
    cd_produto INTEGER,                       -- Código do produto
    
    -- Chave primária composta (3 colunas)
    CONSTRAINT item_pk PRIMARY KEY (cd_cliente, dt_compra, cd_produto),
    
    -- FK referenciando PRODUTO
    CONSTRAINT item_fk1 FOREIGN KEY (cd_produto) 
        REFERENCES PRODUTO(cd_produto),
    
    -- FK composta referenciando COMPRA (cd_cliente + dt_compra)
    CONSTRAINT item_fk2 FOREIGN KEY (cd_cliente, dt_compra) 
        REFERENCES COMPRA(cd_cliente, dt_compra)
);

-- ============================================
-- ALTERAÇÕES NAS TABELAS (ALTER TABLE)
-- ============================================

-- Adicionar coluna de quantidade na tabela ITEM_COMPRA
ALTER TABLE ITEM_COMPRA ADD qt_compra INTEGER;

-- Adicionar colunas de email e tipo na tabela CLIENTE
ALTER TABLE CLIENTE ADD email VARCHAR(100);
ALTER TABLE CLIENTE ADD tipo CHAR(1);

-- Modificar tamanho do campo email (aumentar para 150 caracteres)
ALTER TABLE CLIENTE MODIFY email VARCHAR(150);

-- Renomear coluna 'tipo' para 'ic_tipo' (seguindo padrão de nomenclatura)
ALTER TABLE CLIENTE RENAME COLUMN tipo TO ic_tipo;

-- Renomear coluna 'email' para 'nm_email' (seguindo padrão de nomenclatura)
ALTER TABLE CLIENTE RENAME COLUMN email TO nm_email;

-- ============================================
-- CONSTRAINTS (Restrições)
-- ============================================

-- CHECK: Garantir que ic_tipo aceite apenas 'F' (Física) ou 'J' (Jurídica)
ALTER TABLE CLIENTE ADD CONSTRAINT cliente_ck CHECK (ic_tipo IN ('F','J'));

-- UNIQUE: Garantir que o email seja único (sem duplicatas)
ALTER TABLE CLIENTE ADD CONSTRAINT cliente_uk UNIQUE(nm_email);

-- ============================================
-- CONSULTAS DE VERIFICAÇÃO (DESC)
-- ============================================

-- Visualizar estrutura das tabelas criadas
DESC CLIENTE;
DESC PRODUTO;
DESC COMPRA;
DESC ITEM_COMPRA;

-- ============================================
-- OPERAÇÕES EXTRAS
-- ============================================

-- Exemplo de como adicionar uma coluna
-- ALTER TABLE PRODUTO ADD tipo_produto VARCHAR(10);

-- Exemplo de como remover uma coluna (DROP COLUMN)
-- ALTER TABLE PRODUTO DROP COLUMN tipo_produto;


