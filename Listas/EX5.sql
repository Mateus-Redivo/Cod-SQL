-- EXERCÍCIO 5 - ATUALIZAÇÃO DE DADOS (UPDATE)
-- Tema: Sistema de Funcionários

/*
INSTRUÇÕES:
Primeiro, crie a tabela e insira os dados:

CREATE TABLE funcionarios (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    setor VARCHAR(50),
    data_admissao DATE,
    ativo BIT DEFAULT 1
);

INSERT INTO funcionarios VALUES
('Carlos Silva', 'Analista', 4500.00, 'Games', '2023-01-15', 1),
('Fernanda Costa', 'Gerente', 7500.00, 'Vendas', '2022-03-20', 1),
('Roberto Santos', 'Assistente', 2800.00, 'Administrativo', '2023-06-10', 1),
('Julia Oliveira', 'Analista', 4200.00, 'Games', '2023-02-28', 1),
('Pedro Lima', 'Coordenador', 6000.00, 'Marketing', '2022-08-05', 1);

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