-- Modelo Entidade-Relacionamento (MER) - Exemplo Avançado
-- Demonstração de conceitos: Entidades Fracas, Especialização/Generalização e Relacionamentos N-ários

-- Entidade: Aluno (Entidade Forte)
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY,          -- Atributo: Identificador único do aluno
    Nome VARCHAR(100) NOT NULL,       -- Atributo: Nome completo do aluno
    DataNascimento DATE               -- Atributo: Data de nascimento do aluno
);

-- Entidade: Curso (Entidade Forte - Superclasse)
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY,          -- Atributo: Identificador único do curso
    Nome VARCHAR(100) NOT NULL,       -- Atributo: Nome do curso
    CargaHoraria INT                  -- Atributo: Duração total do curso em horas
);

-- Relacionamento: Matricula (Relacionamento N:N entre Aluno e Curso)
CREATE TABLE Matricula (
    MatriculaID INT PRIMARY KEY,      -- Atributo: Identificador único da matrícula
    AlunoID INT,                      -- Atributo: Referência ao aluno matriculado
    CursoID INT,                      -- Atributo: Referência ao curso da matrícula
    DataMatricula DATE,               -- Atributo: Data de realização da matrícula
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

-- Entidade Fraca: Dependente (Depende da existência de um Aluno)
CREATE TABLE Dependente (
    AlunoID INT,                      -- Parte da chave primária, referência ao Aluno
    SequencialDep INT,                -- Parte da chave primária, número sequencial
    Nome VARCHAR(100) NOT NULL,       -- Atributo: Nome do dependente
    Parentesco VARCHAR(50),           -- Atributo: Tipo de relação com o aluno
    PRIMARY KEY (AlunoID, SequencialDep),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID)
);

-- Especialização de Curso: CursoPresencial (Subclasse de Curso)
CREATE TABLE CursoPresencial (
    CursoID INT PRIMARY KEY,          -- Atributo: Identificador herdado da superclasse
    Sala VARCHAR(20),                 -- Atributo: Número ou identificação da sala
    Bloco VARCHAR(10),                -- Atributo: Identificação do bloco ou prédio
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

-- Especialização de Curso: CursoOnline (Subclasse de Curso)
CREATE TABLE CursoOnline (
    CursoID INT PRIMARY KEY,          -- Atributo: Identificador herdado da superclasse
    Plataforma VARCHAR(50),           -- Atributo: Nome da plataforma de ensino
    LinkAcesso VARCHAR(200),          -- Atributo: URL de acesso ao curso
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

-- Entidade: Professor (Entidade Forte)
CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY,      -- Atributo: Identificador único do professor
    Nome VARCHAR(100) NOT NULL,       -- Atributo: Nome completo do professor
    Departamento VARCHAR(50)          -- Atributo: Departamento ao qual pertence
);

-- Relacionamento N-ário: AvaliacaoCurso (Entre Aluno, Curso e Professor)
CREATE TABLE AvaliacaoCurso (
    AvaliacaoID INT PRIMARY KEY,      -- Atributo: Identificador único da avaliação
    AlunoID INT,                      -- Atributo: Referência ao aluno avaliador
    CursoID INT,                      -- Atributo: Referência ao curso avaliado
    ProfessorID INT,                  -- Atributo: Referência ao professor avaliado
    Nota DECIMAL(3,1),                -- Atributo: Nota atribuída (0.0 a 10.0)
    Comentario TEXT,                  -- Atributo: Comentário da avaliação
    DataAvaliacao DATE,               -- Atributo: Data em que a avaliação foi realizada
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);