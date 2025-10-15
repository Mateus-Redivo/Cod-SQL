-- Active: 1756070023709@@127.0.0.1@3306@teste
-- EXERCÍCIO 5 - ATUALIZAÇÃO DE DADOS (UPDATE)
-- Tema: Sistema de Funcionários

/*
INSTRUÇÕES:
Primeiro, crie a tabela e insira os dados:

CREATE TABLE funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    setor VARCHAR(50),
    data_admissao DATE,
    ativo BOOLEAN DEFAULT TRUE
);

INSERT INTO funcionarios (nome, cargo, salario, setor, data_admissao, ativo) VALUES
('Carlos Silva', 'Analista', 4500.00, 'Games', '2023-01-15', TRUE),
('Fernanda Costa', 'Gerente', 7500.00, 'Vendas', '2022-03-20', TRUE),
('Roberto Santos', 'Assistente', 2800.00, 'Administrativo', '2023-06-10', TRUE),
('Julia Oliveira', 'Analista', 4200.00, 'Games', '2023-02-28', TRUE),
('Pedro Lima', 'Coordenador', 6000.00, 'Marketing', '2022-08-05', TRUE);

Agora faça as seguintes atualizações:

1. Aumente o salário de todos os funcionários do setor 'Games' em 10%
2. Mude o cargo de 'Roberto Santos' para 'Supervisor'
3. Atualize o salário do funcionário 'Pedro Lima' para R$ 6500,00
4. Marque como inativo (ativo = 0) todos os funcionários com salário menor que R$ 3000,00
5. Mude o setor de todos os 'Analistas' para 'Desenvolvimento'
6. Aumente em R$ 500,00 o salário de todos os funcionários admitidos em 2023
7. Atualize a data de admissão de 'Fernanda Costa' para '2022-01-10'
8. Dê um aumento de 15% para todos os funcionários do cargo 'Gerente'
*/

-- RESOLVA AQUI:

DROP TABLE IF EXISTS funcionarios;

-- Criação da tabela
CREATE TABLE funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    setor VARCHAR(50),
    data_admissao DATE,
    ativo BOOLEAN DEFAULT TRUE
);

-- Inserção dos dados
INSERT INTO funcionarios (nome, cargo, salario, setor, data_admissao, ativo) VALUES
('Carlos Silva', 'Analista', 4500.00, 'Games', '2023-01-15', TRUE),
('Fernanda Costa', 'Gerente', 7500.00, 'Vendas', '2022-03-20', TRUE),
('Roberto Santos', 'Assistente', 2800.00, 'Administrativo', '2023-06-10', TRUE),
('Julia Oliveira', 'Analista', 4200.00, 'Games', '2023-02-28', TRUE),
('Pedro Lima', 'Coordenador', 6000.00, 'Marketing', '2022-08-05', TRUE);

SELECT * FROM funcionarios;

-- 1. Aumente o salário de todos os funcionários do setor 'Games' em 10%
UPDATE funcionarios SET salario = salario * 1.10 WHERE setor = 'Games';

-- 2. Mude o cargo de 'Roberto Santos' para 'Supervisor'
UPDATE funcionarios SET cargo = 'Supervisor' WHERE nome = 'Roberto Santos';

-- 3. Atualize o salário do funcionário 'Pedro Lima' para R$ 6500,00
UPDATE funcionarios SET salario = 6500.00 WHERE nome = 'Pedro Lima';

-- 4. Marque como inativo (ativo = 0) todos os funcionários com salário menor que R$ 3000,00
UPDATE funcionarios SET ativo = 0 WHERE salario < 3000.00;

-- 5. Mude o setor de todos os 'Analistas' para 'Desenvolvimento'
UPDATE funcionarios SET setor = 'Desenvolvimento' WHERE setor = 'Analistas'

-- 6. Aumente em R$ 500,00 o salário de todos os funcionários admitidos em 2023
UPDATE funcionarios SET salario = salario + 500 WHERE data_admissao >= '2023-01-01';

-- 7. Atualize a data de admissão de 'Fernanda Costa' para '2022-01-10'
UPDATE funcionarios SET data_admissao = '2022-01-10' WHERE nome = 'Fernanda Costa';

-- 8. Dê um aumento de 15% para todos os funcionários do cargo 'Gerente'
UPDATE funcionarios SET salario = salario * 1.15 WHERE cargo = 'Gerente';

