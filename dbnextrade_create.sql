DROP SCHEMA IF EXISTS dbnextrade;
CREATE SCHEMA dbnextrade;
USE dbnextrade;

-- tables
-- Table: CLIENTES
CREATE TABLE clientes (
    cliente_id int AUTO_INCREMENT NOT NULL,
    nome_completo varchar(200) NOT NULL,
    data_nasc date,
    cpf varchar(11) NOT NULL,
    celular varchar(13) NOT NULL,
    email varchar(100),
    cep varchar(27) NOT NULL,
    endereco varchar(100) NOT NULL,
    bairro varchar(50) NOT NULL,
    cidade varchar(50) NOT NULL,
    numero varchar (10) NOT NULL,    
    estado varchar(2) NOT NULL,	
    regiao_id int,
    CONSTRAINT PK_CLIENTES PRIMARY KEY (cliente_id)
);
	

-- tables
-- Table: PEDIDOS
CREATE TABLE pedidos (
    pedido_id int AUTO_INCREMENT NOT NULL,
    cliente_id int NOT NULL,
    produto_id int NOT NULL,
    forma_pg_id int NOT NULL,
    valor float NOT NULL,
    data_pedido date,
    CONSTRAINT PK_PEDIDOS PRIMARY KEY (pedido_id)
);
	 

-- tables
-- Table: FORMAS_PG
CREATE TABLE formas_pg (
    forma_pg_id int AUTO_INCREMENT NOT NULL,
    nome varchar(100) NOT NULL,
    CONSTRAINT PK_FORMAS_PG PRIMARY KEY (forma_pg_id)
);

-- tables
-- Table: ENTREGAS
CREATE TABLE entregas (
    data_entrega date NOT NULL,
	cliente_id int NOT NULL,
    pedido_id int NOT NULL,
    transportadora_id int NOT NULL,
    CONSTRAINT PK_ENTREGAS PRIMARY KEY (pedido_id, data_entrega)
);	 

-- tables
-- Table: PRODUTOS
CREATE TABLE produtos (
    produto_id int AUTO_INCREMENT NOT NULL,
    nome_produto varchar(100) NOT NULL,
    descricao varchar(100) NOT NULL,
    fabricante_id int NOT NULL,
    categoria_id int NOT NULL,
    valor float,
    CONSTRAINT PK_PRODUTOS PRIMARY KEY (produto_id)
);


-- tables
-- Table: TRANSPORTADORAS
CREATE TABLE transportadoras (
    transportadora_id int AUTO_INCREMENT NOT NULL,
    nome_transportadora varchar(100) NOT NULL,
    regiao_id int NOT NULL,
	CONSTRAINT PK_TRANSPORTADORAS PRIMARY KEY (transportadora_id)
);

-- tables
-- Table: FABRICANTES
CREATE TABLE fabricantes (
    fabricante_id int AUTO_INCREMENT NOT NULL,
    nome_fabricante varchar(100) NOT NULL,
    info varchar(100) NULL,
    telefone varchar(12) NOT NULL,
    email varchar(100) NOT NULL,
    CONSTRAINT PK_FABRICANTES PRIMARY KEY (fabricante_id)
);

-- tables
-- Table: CATEGORIA
CREATE TABLE categoria (
    categoria_id int AUTO_INCREMENT NOT NULL,
    nome_categoria varchar(100) NOT NULL,
    CONSTRAINT PK_CATEGORIA PRIMARY KEY (categoria_id)      
);

-- tables
-- Table: REGIAO
CREATE TABLE regiao (
    regiao_id int AUTO_INCREMENT NOT NULL,
    nome_regiao varchar(100) NOT NULL,
    CONSTRAINT PK_REGIAO PRIMARY KEY (regiao_id)      
);

-- foreign keys
-- Reference: FK_CLIENTES_REGIAO (table: CLIENTES)
ALTER TABLE clientes ADD CONSTRAINT FK_CLIENTES_REGIAO FOREIGN KEY FK_CLIENTES_REGIAO (regiao_id)
    REFERENCES regiao (regiao_id);    

-- Reference: FK_PEDIDOS_CLIENTES (table: PEDIDOS)
ALTER TABLE pedidos ADD CONSTRAINT FK_PEDIDOS_CLIENTES FOREIGN KEY FK_PEDIDOS_CLIENTES (cliente_id)
    REFERENCES clientes (cliente_id);
    
-- Reference: FK_PEDIDOS_PRODUTOS (table: PEDIDOS)
ALTER TABLE pedidos ADD CONSTRAINT FK_PEDIDOS_PRODUTOS FOREIGN KEY FK_PEDIDOS_PRODUTOS (produto_id)
    REFERENCES produtos (produto_id);
    
-- Reference: FK_PEDIDOS_FORMAS_PG (table: PEDIDOS)
ALTER TABLE pedidos ADD CONSTRAINT FK_PEDIDOS_FORMAS_PG FOREIGN KEY FK_PEDIDOS_FORMAS_PG (forma_pg_id)
    REFERENCES formas_pg (forma_pg_id);

-- Reference: FK_ENTREGAS_CLIENTES (table: ENTREGAS)
ALTER TABLE entregas ADD CONSTRAINT FK_ENTREGAS_CLIENTES FOREIGN KEY FK_ENTREGAS_CLIENTES (cliente_id)
    REFERENCES clientes (cliente_id);
    
-- Reference: FK_ENTREGAS_PEDIDOS (table: ENTREGAS)
ALTER TABLE entregas ADD CONSTRAINT FK_ENTREGAS_PEDIDOS FOREIGN KEY FK_ENTREGAS_PEDIDOS (pedido_id)
    REFERENCES pedidos (pedido_id);
    
 -- Reference: FK_ENTREGAS_TRANSPORTADORAS (table: ENTREGAS)
ALTER TABLE entregas ADD CONSTRAINT FK_ENTREGAS_TRANSPORTADORAS FOREIGN KEY FK_ENTREGAS_TRANSPORTADORAS (transportadora_id)
    REFERENCES transportadoras (transportadora_id);
    
-- Reference: FK_PRODUTOS_FABRICANTES (table: PRODUTOS)
ALTER TABLE produtos ADD CONSTRAINT FK_PRODUTOS_FABRICANTES FOREIGN KEY FK_PRODUTOS_FABRICANTES (fabricante_id)
    REFERENCES fabricantes (fabricante_id);
    
-- Reference: FK_PRODUTOS_CATEGORIA (table: PRODUTOS)
ALTER TABLE produtos ADD CONSTRAINT FK_PRODUTOS_CATEGORIA FOREIGN KEY FK_PRODUTOS_CATEGORIA (categoria_id)
    REFERENCES categoria (categoria_id);    

-- Reference: FK_TRANSPORTADORAS_REGIAO (table:TRANSPORTADORAS)
ALTER TABLE transportadoras ADD CONSTRAINT FK_TRANSPORTADORAS_REGIAO FOREIGN KEY FK_TRANSPORTADORAS_REGIAO (regiao_id)
    REFERENCES regiao (regiao_id);      

    
    