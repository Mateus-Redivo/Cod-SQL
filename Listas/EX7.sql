-- EXERCÍCIO 7 - CONSULTAS COM INNER JOIN
-- Tema: Sistema Escolar

/*
INSTRUÇÕES:
Primeiro, crie as tabelas e insira os dados:

CREATE TABLE alunos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    idade INT,
    turma_id INT
);

CREATE TABLE turmas (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50) NOT NULL,
    professor VARCHAR(100),
    sala VARCHAR(10)
);

CREATE TABLE notas (
    id INT PRIMARY KEY IDENTITY(1,1),
    aluno_id INT,
    disciplina VARCHAR(50),
    nota DECIMAL(4,2),
    bimestre INT
);

INSERT INTO turmas VALUES
(1, '3º Ano A', 'Prof. Maria', 'Sala 101'),
(2, '3º Ano B', 'Prof. João', 'Sala 102'),
(3, '2º Ano A', 'Prof. Ana', 'Sala 201');

INSERT INTO alunos VALUES
(1, 'Carlos Silva', 17, 1),
(2, 'Ana Costa', 16, 1),
(3, 'Pedro Santos', 17, 2),
(4, 'Julia Lima', 16, 2),
(5, 'Lucas Oliveira', 15, 3);

INSERT INTO notas VALUES
(1, 1, 'Matemática', 8.5, 1),
(2, 1, 'Português', 7.0, 1),
(3, 2, 'Matemática', 9.0, 1),
(4, 3, 'História', 6.5, 1),
(5, 4, 'Matemática', 8.0, 1);

Agora faça as seguintes consultas usando INNER JOIN:

1. Liste todos os alunos com suas respectivas turmas (nome do aluno, nome da turma)
2. Mostre alunos, suas turmas e professores
3. Exiba as notas dos alunos com seus nomes e disciplinas
4. Mostre alunos da turma '3º Ano A' com suas notas
5. Liste todos os professores e quantos alunos cada um tem
6. Exiba alunos que têm nota em 'Matemática'
7. Mostre turmas que têm alunos matriculados
8. Liste alunos com nota maior que 8.0 e suas turmas
*/

-- RESOLVA AQUI: