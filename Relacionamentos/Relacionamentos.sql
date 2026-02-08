-- Exemplo de Relacionamentos e Chaves Estrangeiras
-- Demonstração de conceitos: Relacionamentos 1:N, Chaves Primárias e Estrangeiras

-- Entidade: Aluno (Entidade Forte)
CREATE TABLE Aluno (
    matricula INT PRIMARY KEY,        -- Atributo: Identificador único do aluno
    nome VARCHAR(100) NOT NULL,       -- Atributo: Nome completo do aluno
    email VARCHAR(100) UNIQUE NOT NULL -- Atributo: Email do aluno (com restrição UNIQUE)
);

-- Entidade: Curso (Entidade Forte)
CREATE TABLE Curso (
    codigo INT PRIMARY KEY,           -- Atributo: Identificador único do curso
    nome VARCHAR(100) NOT NULL,       -- Atributo: Nome do curso
    carga_horaria INT NOT NULL        -- Atributo: Duração total do curso em horas
);

-- Relacionamento: Matricula (Relacionamento N:N entre Aluno e Curso)
CREATE TABLE Matricula (
    matricula INT,                    -- Parte da chave primária composta
    codigo INT,                       -- Parte da chave primária composta
    data_matricula DATE NOT NULL,     -- Atributo: Data de realização da matrícula
    PRIMARY KEY (matricula, codigo),  -- Definição da chave primária composta
    FOREIGN KEY (matricula) REFERENCES Aluno(matricula),  -- Referência à tabela Aluno
    FOREIGN KEY (codigo) REFERENCES Curso(codigo)         -- Referência à tabela Curso
);

-- Opcional: View para consulta de matrículas com informações detalhadas
CREATE VIEW MatriculasDetalhadas AS
SELECT 
    m.matricula,
    a.nome AS nome_aluno,
    c.nome AS nome_curso,
    m.data_matricula,
    c.carga_horaria
FROM Matricula m
JOIN Aluno a ON m.matricula = a.matricula
JOIN Curso c ON m.codigo = c.codigo;
