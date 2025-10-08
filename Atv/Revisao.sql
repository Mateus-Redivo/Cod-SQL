-- Verificar se o banco existe antes de deletar
IF DB_ID('Revisao') IS NOT NULL
    DROP DATABASE Revisao;

-- Criar banco de dados
CREATE DATABASE Revisao;
USE Revisao;

-- Pessoa e CPF (1:1)
CREATE TABLE Pessoa (
    PessoaID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);
CREATE TABLE CPF (
    Numero VARCHAR(11) PRIMARY KEY,
    PessoaID INT UNIQUE NOT NULL,
    FOREIGN KEY (PessoaID) REFERENCES Pessoa(PessoaID)
);

-- Departamento e Funcionário (1:N)
CREATE TABLE Departamento (
    DepartamentoID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);
CREATE TABLE Funcionario (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DepartamentoID INT NOT NULL,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID)
);

-- Endereço (Atributo Composto)
CREATE TABLE Endereco (
    EnderecoID INT PRIMARY KEY,
    Rua VARCHAR(100),
    Numero INT,
    Bairro VARCHAR(50),
    Cidade VARCHAR(50)
);

-- Aluno e Disciplina (N:M), com EnderecoID já inclusos
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DataNascimento DATE,
    EnderecoID INT,
    FOREIGN KEY (EnderecoID) REFERENCES Endereco(EnderecoID)
);
CREATE TABLE Disciplina (
    DisciplinaID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);
CREATE TABLE AlunoDisciplina (
    AlunoID INT,
    DisciplinaID INT,
    DataMatricula DATE NOT NULL,
    PRIMARY KEY (AlunoID, DisciplinaID),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (DisciplinaID) REFERENCES Disciplina(DisciplinaID)
);

-- Telefones do Aluno (Atributo Multivalorado)
CREATE TABLE TelefoneAluno (
    AlunoID INT,
    Telefone VARCHAR(20),
    PRIMARY KEY (AlunoID, Telefone),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID)
);

-- Dependente (Entidade Fraca)
CREATE TABLE Dependente (
    DependenteID INT,
    AlunoID INT,
    Nome VARCHAR(100),
    PRIMARY KEY (DependenteID, AlunoID),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID)
);

-- Curso, CursoPresencial e CursoOnline (Especialização/Generalização)
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY,
    Nome VARCHAR(100)
);
CREATE TABLE CursoPresencial (
    CursoID INT PRIMARY KEY,
    Sala VARCHAR(20),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);
CREATE TABLE CursoOnline (
    CursoID INT PRIMARY KEY,
    Plataforma VARCHAR(50),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

-- Professor e AvaliacaoCurso (Relacionamento N-ário)
CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY,
    Nome VARCHAR(100)
);
CREATE TABLE AvaliacaoCurso (
    AlunoID INT,
    CursoID INT,
    ProfessorID INT,
    Nota DECIMAL(3,1),
    PRIMARY KEY (AlunoID, CursoID, ProfessorID),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);
-- Inserts para popular o banco de dados

-- Pessoa e CPF
INSERT INTO Pessoa (PessoaID, Nome) VALUES (1, 'João Silva'), (2, 'Maria Souza');
INSERT INTO CPF (Numero, PessoaID) VALUES ('12345678901', 1), ('98765432100', 2);

-- Departamento e Funcionário
INSERT INTO Departamento (DepartamentoID, Nome) VALUES (1, 'RH'), (2, 'TI');
INSERT INTO Funcionario (FuncionarioID, Nome, DepartamentoID) VALUES (1, 'Carlos Lima', 1), (2, 'Ana Paula', 2);

-- Endereço
INSERT INTO Endereco (EnderecoID, Rua, Numero, Bairro, Cidade) VALUES
  (1, 'Rua das Flores', 100, 'Centro', 'São Paulo'),
  (2, 'Av. Brasil', 200, 'Jardins', 'Rio de Janeiro');

-- Aluno
INSERT INTO Aluno (AlunoID, Nome, DataNascimento, EnderecoID) VALUES
  (1, 'Lucas Pereira', '2000-05-10', 1),
  (2, 'Fernanda Costa', '1998-11-23', 2);

-- Disciplina
INSERT INTO Disciplina (DisciplinaID, Nome) VALUES (1, 'Matemática'), (2, 'História');

-- AlunoDisciplina
INSERT INTO AlunoDisciplina (AlunoID, DisciplinaID, DataMatricula) VALUES
  (1, 1, '2024-02-01'),
  (1, 2, '2024-02-01'),
  (2, 1, '2024-02-01');

-- Telefones do Aluno
INSERT INTO TelefoneAluno (AlunoID, Telefone) VALUES (1, '11999999999'), (1, '11888888888'), (2, '21777777777');

-- Dependente
INSERT INTO Dependente (DependenteID, AlunoID, Nome) VALUES (1, 1, 'Pedro Pereira'), (2, 2, 'Julia Costa');

-- Curso
INSERT INTO Curso (CursoID, Nome) VALUES (1, 'Engenharia'), (2, 'Direito');
INSERT INTO CursoPresencial (CursoID, Sala) VALUES (1, 'A101');
INSERT INTO CursoOnline (CursoID, Plataforma) VALUES (2, 'Moodle');

-- Professor
INSERT INTO Professor (ProfessorID, Nome) VALUES (1, 'Prof. Roberto'), (2, 'Profª. Camila');

-- AvaliacaoCurso
INSERT INTO AvaliacaoCurso (AlunoID, CursoID, ProfessorID, Nota) VALUES
  (1, 1, 1, 8.5),
  (2, 2, 2, 9.0);
SELECT Nome, YEAR(GETDATE()) - YEAR(DataNascimento) AS Idade FROM Aluno;

-- Fim do script

CREATE TABLE Atividade (
    AtividadeID INT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Nota INT 
);

INSERT INTO Atividade (AtividadeID, Titulo, Descricao, Nota) VALUES
    (1, 'Trabalho de Matemática', 'Resolver problemas de álgebra', 10),
    (2, 'Redação de História', 'Escrever sobre a Revolução Francesa', 8);

