-- Active: 1756070023709@@127.0.0.1@3306@listas
-- EXERCÍCIO 1 - CRIAÇÃO DE TABELAS (CREATE TABLE)
-- Tema: Sistema de Biblioteca

/*
INSTRUÇÕES:
Crie as seguintes tabelas para um sistema de biblioteca:

1. Tabela 'livros':
   - id (chave primária, inteiro, auto incremento)
   - titulo (texto até 200 caracteres, obrigatório)
   - autor (texto até 100 caracteres, obrigatório)
   - ano_publicacao (inteiro)
   - preco (decimal com 2 casas decimais)

2. Tabela 'clientes':
   - id (chave primária, inteiro, auto incremento)
   - nome (texto até 100 caracteres, obrigatório)
   - email (texto até 150 caracteres, único)
   - telefone (texto até 15 caracteres)
   - data_cadastro (data, padrão data atual)

3. Tabela 'emprestimos':
   - id (chave primária, inteiro, auto incremento)
   - cliente_id (inteiro, chave estrangeira para clientes)
   - livro_id (inteiro, chave estrangeira para livros)
   - data_emprestimo (data, obrigatório)
   - data_devolucao (data)
*/

-- RESOLVA AQUI:

-- Criar database (remova o comentário se necessário)
CREATE DATABASE Listas;
USE Listas;

CREATE TABLE livros (
   id INT IDENTITY(1,1) PRIMARY KEY,
   titulo VARCHAR(200) NOT NULL,
   autor VARCHAR(100) NOT NULL,
   ano_publicacao INT,
   preco DECIMAL(10,2)
);

CREATE TABLE clientes (
   id INT IDENTITY(1,1) PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(150) UNIQUE,
   telefone VARCHAR(15),
   data_cadastro DATE DEFAULT GETDATE()
);

CREATE TABLE emprestimos (
   id INT IDENTITY(1,1) PRIMARY KEY,
   cliente_id INT,
   livro_id INT,
   data_emprestimo DATE NOT NULL,
   data_devolucao DATE,
   CONSTRAINT FK_emprestimos_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id),
   CONSTRAINT FK_emprestimos_livro FOREIGN KEY (livro_id) REFERENCES livros(id)
);
