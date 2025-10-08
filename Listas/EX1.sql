-- EXERCÍCIO 1 - CRIAÇÃO DE TABELAS (CREATE TABLE)
-- Tema: Sistema de Biblioteca

/*
INSTRUÇÕES:
Crie as seguintes tabelas para um sistema de biblioteca:

1. Tabela 'livros':
   - id (chave primária, inteiro, auto incremento)
   - titulo (texto até 200 caracteres, obrigatório)
   - autor (texto até 100 caracteres, obrigatório)
   - ano_publicacao (inteiro)
   - preco (decimal com 2 casas decimais)

2. Tabela 'clientes':
   - id (chave primária, inteiro, auto incremento)
   - nome (texto até 100 caracteres, obrigatório)
   - email (texto até 150 caracteres, único)
   - telefone (texto até 15 caracteres)
   - data_cadastro (data, padrão data atual)

3. Tabela 'emprestimos':
   - id (chave primária, inteiro, auto incremento)
   - cliente_id (inteiro, chave estrangeira para clientes)
   - livro_id (inteiro, chave estrangeira para livros)
   - data_emprestimo (data, obrigatório)
   - data_devolucao (data)
*/

-- RESOLVA AQUI:
