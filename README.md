# Aula 4 - Cardinalidade em Modelagem de Dados

## Objetivo
O objetivo desta aula foi apresentar os diferentes tipos de cardinalidade em relacionamentos entre entidades.

## Estrutura do Código

### 1. Relacionamento Um para Um (1:1)
#### Pessoa e CPF
```sql
CREATE TABLE Pessoa (
    PessoaID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE CPF (
    Numero VARCHAR(11) PRIMARY KEY,
    PessoaID INT UNIQUE NOT NULL,
    FOREIGN KEY (PessoaID) REFERENCES Pessoa(PessoaID)
);
```

### 2. Relacionamento Um para Muitos (1:N)
#### Departamento e Funcionário
```sql
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
```

### 3. Relacionamento Muitos para Muitos (N:M)
#### Aluno e Disciplina
```sql
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
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
```

## Conclusão
Esta aula demonstrou os três principais tipos de cardinalidade:
- Relacionamento Um para Um (1:1)
- Relacionamento Um para Muitos (1:N)
- Relacionamento Muitos para Muitos (N:M)

E suas implementações práticas através de:
- Chaves primárias e estrangeiras
- Restrições UNIQUE
- Tabelas de junção para relacionamentos N:M