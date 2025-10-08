-- EXERCÍCIO 10 - SISTEMA COM RELACIONAMENTO
-- Tema: Loja Online

/*
INSTRUÇÕES:

1. CRIAR 2 tabelas relacionadas:
   
   produtos:
   - id INT PRIMARY KEY IDENTITY(1,1)
   - nome VARCHAR(50)
   - categoria VARCHAR(30)
   - preco DECIMAL(8,2)
   - estoque INT
   
   pedidos:
   - id INT PRIMARY KEY IDENTITY(1,1)
   - produto_id INT
   - cliente VARCHAR(30)
   - quantidade INT
   - data_pedido DATE

2. INSERIR dados:
   - 5 produtos de diferentes categorias
   - 6 pedidos de diferentes clientes

3. CONSULTAS (use JOIN quando necessário):
   - Todos os produtos ordenados por preço
   - Pedidos com nome do produto e cliente
   - Total vendido por categoria (quantidade * preco)
   - Cliente que mais comprou (em quantidade)
   - Produtos nunca vendidos

4. ATUALIZAÇÕES:
   - Aumentar preço de produtos de 'Eletrônicos' em 10%
   - Reduzir estoque conforme pedidos realizados
   - Atualizar categoria de um produto

5. EXCLUSÃO:
   - Remover produtos com estoque zero

6. RELATÓRIO FINAL:
   - Liste produtos com total vendido e estoque atual
*/

-- RESOLVA AQUI: