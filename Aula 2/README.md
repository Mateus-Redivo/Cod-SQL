# Aula 2 - Modelo Entidade-Relacionamento (MER) Avançado

## Objetivo
O objetivo desta aula foi apresentar conceitos avançados do Modelo Entidade-Relacionamento, incluindo entidades fracas, especialização/generalização e relacionamentos N-ários.

## Estrutura do Código

### 1. Entidades Fortes
#### Aluno
```sql
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DataNascimento DATE
);
```

#### Curso (Superclasse)
```sql
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CargaHoraria INT
);
```

### 2. Entidade Fraca
#### Dependente
```sql
CREATE TABLE Dependente (
    AlunoID INT,
    SequencialDep INT,
    Nome VARCHAR(100) NOT NULL,
    Parentesco VARCHAR(50),
    PRIMARY KEY (AlunoID, SequencialDep),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID)
);
```

### 3. Especializações (Herança)
#### CursoPresencial
```sql
CREATE TABLE CursoPresencial (
    CursoID INT PRIMARY KEY,
    Sala VARCHAR(20),
    Bloco VARCHAR(10),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);
```

#### CursoOnline
```sql
CREATE TABLE CursoOnline (
    CursoID INT PRIMARY KEY,
    Plataforma VARCHAR(50),
    LinkAcesso VARCHAR(200),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);
```

### 4. Relacionamento N-ário
#### AvaliacaoCurso
```sql
CREATE TABLE AvaliacaoCurso (
    AvaliacaoID INT PRIMARY KEY,
    AlunoID INT,
    CursoID INT,
    ProfessorID INT,
    Nota DECIMAL(3,1),
    Comentario TEXT,
    DataAvaliacao DATE,
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID),
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);
```

## Conclusão
Esta aula demonstrou conceitos avançados de modelagem, incluindo:
- Entidades fracas e suas dependências
- Especialização/Generalização de entidades
- Relacionamentos N-ários
- Chaves compostas
- Herança em bancos de dados relacionais