-- EXERCÍCIO 4 - CONSULTAS COM FILTROS (SELECT WHERE)
-- Tema: Sistema de Loja de Roupas

/*
INSTRUÇÕES:
Primeiro, crie as tabelas e insira os dados:

CREATE TABLE produtos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    tamanho VARCHAR(10),
    cor VARCHAR(30),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);

INSERT INTO produtos VALUES 
('Camiseta Básica', 'Camisetas', 'M', 'Branca', 39.90, 15),
('Calça Jeans', 'Calças', 'G', 'Azul', 89.90, 8),
('Vestido Floral', 'Vestidos', 'P', 'Rosa', 129.90, 5),
('Blusa de Frio', 'Blusas', 'M', 'Preta', 79.90, 12),
('Short Jeans', 'Shorts', 'M', 'Azul', 49.90, 20),
('Camiseta Estampada', 'Camisetas', 'G', 'Verde', 45.90, 10);

Agora faça as seguintes consultas:

1. produtos da categoria 'Camisetas'
2. produtos com preço menor que R$ 50,00
3. produtos tamanho 'M' ou 'G'
4. produtos com estoque maior que 10 unidades
5. produtos da cor 'Azul' ordenados por preço
6. produtos com preço entre R$ 40,00 e R$ 80,00
7. produtos que NÃO são da categoria 'Vestidos'
8. produtos com nome que contém a palavra 'Jeans'
*/

-- RESOLVA AQUI:

-- Criação da tabela
CREATE TABLE produtos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    tamanho VARCHAR(10),
    cor VARCHAR(30),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);

-- Inserção dos dados
INSERT INTO produtos (nome, categoria, tamanho, cor, preco, estoque) VALUES 
('Camiseta Básica', 'Camisetas', 'M', 'Branca', 39.90, 15),
('Calça Jeans', 'Calças', 'G', 'Azul', 89.90, 8),
('Vestido Floral', 'Vestidos', 'P', 'Rosa', 129.90, 5),
('Blusa de Frio', 'Blusas', 'M', 'Preta', 79.90, 12),
('Short Jeans', 'Shorts', 'M', 'Azul', 49.90, 20),
('Camiseta Estampada', 'Camisetas', 'G', 'Verde', 45.90, 10);

-- CONSULTAS COM FILTROS:

-- 1. produtos da categoria 'Camisetas'
SELECT * FROM produtos 
WHERE categoria = 'Camisetas';

-- 2. produtos com preço menor que R$ 50,00
SELECT * FROM produtos 
WHERE preco < 50.00;

-- 3. produtos tamanho 'M' ou 'G'
SELECT * FROM produtos 
WHERE tamanho IN ('M', 'G');

-- 4. produtos com estoque maior que 10 unidades
SELECT * FROM produtos 
WHERE estoque > 10;

-- 5. produtos da cor 'Azul' ordenados por preço
SELECT * FROM produtos 
WHERE cor = 'Azul' 
ORDER BY preco;

-- 6. produtos com preço entre R$ 40,00 e R$ 80,00
SELECT * FROM produtos 
WHERE preco BETWEEN 40.00 AND 80.00;

-- 7. produtos que NÃO são da categoria 'Vestidos'
SELECT * FROM produtos 
WHERE categoria != 'Vestidos';

-- 8. produtos com nome que contém a palavra 'Jeans'
SELECT * FROM produtos 
WHERE nome LIKE '%Jeans%';