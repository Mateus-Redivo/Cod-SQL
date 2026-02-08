# Aula 3 - Relacionamentos e Chaves Estrangeiras

## Objetivo
O objetivo desta aula foi aprofundar o entendimento sobre relacionamentos 1:N e a implementação de chaves primárias e estrangeiras.

## Estrutura do Código

### 1. Entidades Fortes
#### Aluno
```sql
CREATE TABLE Aluno (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
```

#### Curso
```sql
CREATE TABLE Curso (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);
```

### 2. Relacionamento N:N
#### Matrícula
```sql
CREATE TABLE Matricula (
    matricula INT,
    codigo INT,
    data_matricula DATE NOT NULL,
    PRIMARY KEY (matricula, codigo),
    FOREIGN KEY (matricula) REFERENCES Aluno(matricula),
    FOREIGN KEY (codigo) REFERENCES Curso(codigo)
);
```

### 3. View para Consultas
#### MatriculasDetalhadas
```sql
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
```

## Conclusão
Esta aula demonstrou:
- Implementação de relacionamentos N:N
- Uso de chaves primárias compostas
- Criação de chaves estrangeiras
- Utilização de views para consultas complexas
- Restrições UNIQUE em campos