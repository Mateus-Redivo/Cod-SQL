-- EXERCÍCIO 9 - CRUD COMPLETO
-- Tema: Sistema de Estoque

/*
INSTRUÇÕES:

1. CRIAR tabela 'produtos' com:
   - id INT PRIMARY KEY IDENTITY(1,1)
   - nome VARCHAR(50)
   - categoria VARCHAR(30)
   - preco DECIMAL(8,2)
   - estoque INT
   - fornecedor VARCHAR(30)

2. INSERIR estes produtos:
   - Notebook, Eletrônicos, 2500.00, estoque 10, fornecedor Dell
   - Mouse, Acessórios, 45.90, estoque 50, fornecedor Logitech
   - Teclado, Acessórios, 120.00, estoque 25, fornecedor Razer
   - Monitor, Eletrônicos, 800.00, estoque 8, fornecedor Samsung
   - Impressora, Eletrônicos, 350.00, estoque 15, fornecedor HP

3. CONSULTAS (5 consultas):
   - Todos os produtos ordenados por categoria e nome
   - Produtos da categoria 'Eletrônicos' com estoque > 10
   - Produtos com preço entre 100 e 1000
   - Valor total do estoque por categoria (estoque * preco)
   - Fornecedor com mais produtos cadastrados

4. ATUALIZAÇÕES (4 operações):
   - Aumentar preço de produtos 'Eletrônicos' em 8%
   - Reduzir estoque do Mouse em 10 unidades
   - Trocar fornecedor do Monitor para 'LG'
   - Adicionar 20 unidades ao estoque da Impressora

5. EXCLUSÕES:
   - Remover produtos com estoque menor que 12
   - Excluir produtos da categoria 'Descontinuado' (se houver)

6. RELATÓRIO FINAL: 
   - Liste produtos com nome, categoria, estoque, valor unitário
   - Adicione coluna STATUS: 'Crítico' se < 15, 'Baixo' se 15-30, 'OK' se > 30
   - Adicione coluna VALOR_TOTAL (estoque * preco)
   - Ordene por valor total decrescente
*/

-- RESOLVA AQUI: