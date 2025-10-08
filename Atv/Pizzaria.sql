CREATE DATABASE IF NOT EXISTS PIZZARIA;

USE PIZZARIA;

CREATE TABLE PIZZAS(
	IDPIZZA int auto_increment primary key not null,
	NOME varchar(50) not null,
	DESCRICAO text,
	PRECO decimal(6,2) not null,
	TAMANHO enum('P', 'M', 'G', 'GG') not null
);

-- Tabela de clientes
CREATE TABLE CLIENTES(
	IDCLIENTE int auto_increment primary key not null,
	NOME varchar(100) not null,
	TELEFONE varchar(15) not null,
	ENDERECO varchar(200) not null,
	DATA_CADASTRO date not null
);

-- Tabela de funcionários
CREATE TABLE FUNCIONARIOS(
	IDFUNCIONARIO int auto_increment primary key not null,
	NOME varchar(100) not null,
	CARGO varchar(50) not null,
	SALARIO decimal(7,2) not null,
	DATA_CONTRATACAO date not null
);

-- Tabela de pedidos
CREATE TABLE PEDIDOS(
	IDPEDIDO int auto_increment primary key not null,
	IDCLIENTE int not null,
	IDFUNCIONARIO int not null,
	DATA_PEDIDO datetime not null,
	VALOR_TOTAL decimal(7,2) not null,
	STATUS enum('Preparando', 'Entrega', 'Concluido', 'Cancelado') not null,
	FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTES(IDCLIENTE),
	FOREIGN KEY (IDFUNCIONARIO) REFERENCES FUNCIONARIOS(IDFUNCIONARIO)
);

-- Tabela de itens do pedido
CREATE TABLE ITENS_PEDIDO(
	IDITEM int auto_increment primary key not null,
	IDPEDIDO int not null,
	IDPIZZA int not null,
	QUANTIDADE int not null,
	PRECO_UNITARIO decimal(6,2) not null,
	FOREIGN KEY (IDPEDIDO) REFERENCES PEDIDOS(IDPEDIDO),
	FOREIGN KEY (IDPIZZA) REFERENCES PIZZAS(IDPIZZA)
);

-- Tabela de ingredientes
CREATE TABLE INGREDIENTES(
	IDINGREDIENTE int auto_increment primary key not null,
	NOME varchar(50) not null,
	ESTOQUE_ATUAL decimal(8,2) not null,
	UNIDADE_MEDIDA varchar(10) not null
);

-- Tabela de relacionamento entre pizzas e ingredientes
CREATE TABLE PIZZA_INGREDIENTES(
	IDPIZZA int not null,
	IDINGREDIENTE int not null,
	QUANTIDADE decimal(6,2) not null,
	PRIMARY KEY (IDPIZZA, IDINGREDIENTE),
	FOREIGN KEY (IDPIZZA) REFERENCES PIZZAS(IDPIZZA),
	FOREIGN KEY (IDINGREDIENTE) REFERENCES INGREDIENTES(IDINGREDIENTE)
);

-- Dados de exemplo para teste
INSERT INTO PIZZAS (NOME, DESCRICAO, PRECO, TAMANHO) VALUES
('Margherita', 'Molho de tomate, mussarela e manjericão', 35.90, 'M'),
('Calabresa', 'Molho de tomate, mussarela e calabresa', 39.90, 'M'),
('Quatro Queijos', 'Molho de tomate, mussarela, provolone, parmesão e gorgonzola', 45.90, 'M'),
('Portuguesa', 'Molho de tomate, mussarela, presunto, ovos e cebola', 42.90, 'M');

INSERT INTO CLIENTES (NOME, TELEFONE, ENDERECO, DATA_CADASTRO) VALUES
('João Silva', '(11)98765-4321', 'Rua das Flores, 123', '2023-01-15'),
('Maria Santos', '(11)91234-5678', 'Av. Paulista, 1000', '2023-02-20'),
('Carlos Oliveira', '(11)99876-5432', 'Rua Augusta, 500', '2023-03-10');