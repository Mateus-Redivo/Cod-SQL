-- EXERCÍCIO 2 - INSERÇÃO DE DADOS (INSERT)
-- Tema: Sistema de Biblioteca

/*
INSTRUÇÕES:
Usando as tabelas criadas no EX1, insira os seguintes dados:

1. Na tabela 'livros', adicione:
   - "O Pequeno Príncipe", autor "Antoine de Saint-Exupéry", ano 1943, preço 25.90
   - "1984", autor "George Orwell", ano 1949, preço 32.50
   - "Dom Casmurro", autor "Machado de Assis", ano 1899, preço 18.75
   - "O Alquimista", autor "Paulo Coelho", ano 1988, preço 29.90

2. Na tabela 'clientes', adicione:
   - Nome "Maria Silva", email "maria@email.com", telefone "11999887766"
   - Nome "João Santos", email "joao@email.com", telefone "11888776655"
   - Nome "Ana Costa", email "ana@email.com", telefone "11777665544"

3. Na tabela 'emprestimos', adicione:
   - Cliente Maria (id 1) pegou o livro "1984" (id 2) em 2024-10-01
   - Cliente João (id 2) pegou o livro "O Pequeno Príncipe" (id 1) em 2024-10-02
   - Cliente Ana (id 3) pegou o livro "Dom Casmurro" (id 3) em 2024-10-03
*/

-- RESOLVA AQUI:

-- 1. Inserindo dados na tabela 'livros'
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 25.90),
('1984', 'George Orwell', 1949, 32.50),
('Dom Casmurro', 'Machado de Assis', 1899, 18.75),
('O Alquimista', 'Paulo Coelho', 1988, 29.90);

-- 2. Inserindo dados na tabela 'clientes'
INSERT INTO clientes (nome, email, telefone) VALUES
('Maria Silva', 'maria@email.com', '11999887766'),
('João Santos', 'joao@email.com', '11888776655'),
('Ana Costa', 'ana@email.com', '11777665544');

-- 3. Inserindo dados na tabela 'emprestimos'
INSERT INTO emprestimos (cliente_id, livro_id, data_emprestimo) VALUES
(1, 2, '2024-10-01'),  -- Maria pegou 1984
(2, 1, '2024-10-02'),  -- João pegou O Pequeno Príncipe
(3, 3, '2024-10-03');  -- Ana pegou Dom Casmurro

