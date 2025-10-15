-- EXERCÍCIO 3 - CONSULTAS SIMPLES (SELECT)
-- Tema: Sistema de Biblioteca

/*
INSTRUÇÕES:
Crie consultas SELECT para responder às seguintes perguntas:

1. Listar todos os livros com título, autor e preço
2. Mostrar apenas os clientes que têm telefone cadastrado
3. Exibir todos os empréstimos mostrando apenas as datas
4. Listar os livros publicados antes de 1950
5. Mostrar os clientes ordenados por nome em ordem alfabética
6. Exibir o livro mais caro (maior preço)
7. Listar os empréstimos que ainda não foram devolvidos (data_devolucao é NULL)
8. Mostrar apenas o título e ano dos livros, ordenados por ano de publicação
*/

-- RESOLVA AQUI:

-- 1. Listar todos os livros com título, autor e preço
SELECT titulo, autor, preco FROM livros;

-- 2. Mostrar apenas os clientes que têm telefone cadastrado
SELECT * FROM clientes WHERE telefone IS NOT NULL;

-- 3. Exibir todos os empréstimos mostrando apenas as datas
SELECT data_emprestimo, data_devolucao FROM emprestimos;

-- 4. Listar os livros publicados antes de 1950
SELECT * FROM livros WHERE ano_publicacao < 1950;

-- 5. Mostrar os clientes ordenados por nome em ordem alfabética
SELECT * FROM clientes ORDER BY nome ASC;

-- 6. Exibir o livro mais caro (maior preço)
SELECT TOP 1 * FROM livros ORDER BY preco DESC;

-- 7. Listar os empréstimos que ainda não foram devolvidos (data_devolucao é NULL)
SELECT * FROM emprestimos WHERE data_devolucao IS NULL;

-- 8. Mostrar apenas o título e ano dos livros, ordenados por ano de publicação
SELECT titulo, ano_publicacao FROM livros ORDER BY ano_publicacao ASC;