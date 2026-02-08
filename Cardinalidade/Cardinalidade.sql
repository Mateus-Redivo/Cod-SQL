-- Cardinalidade em Modelagem de Dados
-- Demonstração de conceitos: Cardinalidade e Tipos de Relacionamentos

/*
CARDINALIDADE:
- Cardinalidade Mínima: número mínimo de ocorrências de uma entidade em um relacionamento
  * 0 = participação opcional
  * 1 = participação obrigatória

- Cardinalidade Máxima: número máximo de ocorrências de uma entidade em um relacionamento
  * 1 = única ocorrência
  * N = múltiplas ocorrências

TIPOS DE RELACIONAMENTOS:

1. Um para Um (1:1)
   Exemplo: Pessoa -> CPF
   - Cada pessoa tem apenas um CPF
   - Cada CPF pertence a apenas uma pessoa

2. Um para Muitos (1:N)
   Exemplo: Departamento -> Funcionários
   - Um departamento pode ter vários funcionários
   - Cada funcionário pertence a um único departamento

3. Muitos para Muitos (N:M)
   Exemplo: Aluno -> Disciplinas
   - Um aluno pode cursar várias disciplinas
   - Uma disciplina pode ter vários alunos

EXEMPLO PRÁTICO DE IMPLEMENTAÇÃO:*/

-- Exemplo 1:1 (Um para Um)
-- Entidade: Pessoa (Entidade Forte)
CREATE TABLE Pessoa (
    PessoaID INT PRIMARY KEY,        -- Atributo: Identificador único da pessoa
    Nome VARCHAR(100) NOT NULL       -- Atributo: Nome da pessoa
);

-- Entidade: CPF (Entidade Fraca - depende de Pessoa)
CREATE TABLE CPF (
    Numero VARCHAR(11) PRIMARY KEY,   -- Atributo: Número do CPF (identificador único)
    PessoaID INT UNIQUE NOT NULL,     -- Atributo: Referência à pessoa (deve ser único)
    FOREIGN KEY (PessoaID) REFERENCES Pessoa(PessoaID)
);

-- Exemplo 1:N (Um para Muitos)
-- Entidade: Departamento (Entidade Forte)
CREATE TABLE Departamento (
    DepartamentoID INT PRIMARY KEY,   -- Atributo: Identificador único do departamento
    Nome VARCHAR(50) NOT NULL         -- Atributo: Nome do departamento
);

-- Entidade: Funcionario (Entidade Associada)
CREATE TABLE Funcionario (
    FuncionarioID INT PRIMARY KEY,    -- Atributo: Identificador único do funcionário
    Nome VARCHAR(100) NOT NULL,       -- Atributo: Nome do funcionário
    DepartamentoID INT NOT NULL,      -- Atributo: Referência ao departamento
    FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID)
);

-- Exemplo N:M (Muitos para Muitos)
-- Entidade: Aluno (Entidade Forte)
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY,          -- Atributo: Identificador único do aluno
    Nome VARCHAR(100) NOT NULL        -- Atributo: Nome do aluno
);

-- Entidade: Disciplina (Entidade Forte)
CREATE TABLE Disciplina (
    DisciplinaID INT PRIMARY KEY,     -- Atributo: Identificador único da disciplina
    Nome VARCHAR(50) NOT NULL         -- Atributo: Nome da disciplina
);

-- Relacionamento: AlunoDisciplina (Relacionamento N:M entre Aluno e Disciplina)
CREATE TABLE AlunoDisciplina (
    AlunoID INT,                      -- Parte da chave primária composta
    DisciplinaID INT,                 -- Parte da chave primária composta
    DataMatricula DATE NOT NULL,      -- Atributo: Data da matrícula na disciplina
    PRIMARY KEY (AlunoID, DisciplinaID),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (DisciplinaID) REFERENCES Disciplina(DisciplinaID)
);