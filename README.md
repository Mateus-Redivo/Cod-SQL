# Aula 1 - Introdução ao SQL e Modelagem de Dados

## Objetivo
O objetivo desta aula foi introduzir os conceitos de modelagem de dados em SQL, incluindo entidades, atributos (simples, compostos, derivados e multivalorados) e seus relacionamentos.

## Estrutura do Código

### 1. Entidade Aluno
A primeira entidade criada representa um aluno com seus atributos básicos e um endereço como atributo composto:
```sql
CREATE TABLE Aluno (
    AlunoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DataNascimento DATE,
    Email VARCHAR(150),
    -- Atributos do endereço (composto)
    Rua VARCHAR(100),
    Numero VARCHAR(10),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(2),
    CEP VARCHAR(8)
);
```

### 2. Entidade Curso
A segunda entidade representa os cursos disponíveis:
```sql
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY,
    NomeCurso VARCHAR(100) NOT NULL,
    CargaHoraria INT,
    Nivel VARCHAR(50)
);
```

### 3. Relacionamento - Matrícula
Representa o relacionamento entre Aluno e Curso:
```sql
CREATE TABLE Matricula (
    MatriculaID INT PRIMARY KEY,
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    DataMatricula DATE,
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);
```

### 4. Atributos Especiais

#### Atributo Derivado
Exemplo de atributo derivado (idade) usando uma VIEW:
```sql
CREATE VIEW AlunoComIdade AS
SELECT *, DATEDIFF(YEAR, DataNascimento, GETDATE()) AS Idade FROM Aluno;
```

#### Atributo Multivalorado
Exemplo de atributo multivalorado (telefones) usando uma tabela separada:
```sql
CREATE TABLE TelefonesAluno (
    TelefoneID INT PRIMARY KEY,
    AlunoID INT NOT NULL,
    Telefone VARCHAR(15),
    TipoTelefone VARCHAR(20),
    PRIMARY KEY (AlunoID, TelefoneID),
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID)
);
```

## Conclusão
Esta aula demonstrou diferentes aspectos da modelagem de dados em SQL, incluindo:
- Criação de entidades (tabelas)
- Definição de atributos simples e compostos
- Implementação de relacionamentos
- Uso de atributos derivados através de VIEWs
- Implementação de atributos multivalorados