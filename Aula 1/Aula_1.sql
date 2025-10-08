-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS Aulas_BD;

-- Seleciona o banco de dados para uso
USE Aulas_BD;


-- Entidade: Aluno
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY,          -- Atributo: Identificador único do aluno
    Nome VARCHAR(100) NOT NULL,       -- Atributo: Nome do aluno
    DataNascimento DATE,              -- Atributo: Data de nascimento
    Email VARCHAR(150),               -- Atributo: Email do aluno
    -- Atributo Composto: Endereço
    Rua VARCHAR(100),                 -- Atributo: Rua do endereço
    Numero VARCHAR(10),               -- Atributo: Número do endereço
    Bairro VARCHAR(50),               -- Atributo: Bairro do endereço
    Cidade VARCHAR(50),               -- Atributo: Cidade do endereço
    Estado VARCHAR(2),                -- Atributo: Estado do endereço
    CEP VARCHAR(8)                    -- Atributo: CEP do endereço
) ENGINE=InnoDB;

-- Entidade: Curso
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY,          -- Atributo: Identificador único do curso
    NomeCurso VARCHAR(100) NOT NULL,  -- Atributo: Nome do curso
    CargaHoraria INT,                 -- Atributo: Carga horária do curso
    Nivel VARCHAR(50)                 -- Atributo: Nível do curso (Ex: Básico, Intermediário, Avançado)
) ENGINE=InnoDB;

-- Entidade: Matrícula
CREATE TABLE Matricula (
    MatriculaID INT PRIMARY KEY,      -- Atributo: Identificador único da matrícula
    AlunoID INT NOT NULL,             -- Atributo: Referência ao Aluno
    CursoID INT NOT NULL,             -- Atributo: Referência ao Curso
    DataMatricula DATE,               -- Atributo: Data da matrícula
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
) ENGINE=InnoDB;

-- Atributos Derivados -> São atributos que podem ser derivados de outros atributos
-- Exemplo adicionando idade (derivada da data de nascimento)

CREATE VIEW AlunoComIdade AS
SELECT 
    AlunoID, 
    Nome, 
    DataNascimento, 
    Email,
    Rua,
    Numero, 
    Bairro,
    Cidade,
    Estado,
    CEP,
    TIMESTAMPDIFF(YEAR, DataNascimento, CURDATE()) AS Idade 
FROM Aluno;

-- Atributos Multivalorados -> São atributos que podem ter múltiplos valores
-- Exemplo: Telefone (um aluno pode ter mais de um telefone)
-- Para representar isso, criamos uma tabela separada para os telefones

CREATE TABLE TelefonesAluno (
    TelefoneID INT,                  -- Parte da chave primária
    AlunoID INT NOT NULL,             -- Parte da chave primária, referência ao Aluno
    Telefone VARCHAR(15),
    TipoTelefone VARCHAR(20),
    PRIMARY KEY (AlunoID, TelefoneID),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID)
) ENGINE=InnoDB;