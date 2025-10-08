-- EXERCÍCIO 6 - EXCLUSÃO DE DADOS (DELETE)
-- Tema: Sistema de Pedidos

/*
INSTRUÇÕES:
Primeiro, crie a tabela e insira os dados:

CREATE TABLE pedidos (
    id INT PRIMARY KEY IDENTITY(1,1),
    cliente VARCHAR(100) NOT NULL,
    produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Pendente'
);

INSERT INTO pedidos VALUES
('Ana Silva', 'Notebook Dell', 1, 2500.00, '2024-09-15', 'Entregue'),
('João Costa', 'Mouse Gamer', 2, 150.00, '2024-09-20', 'Pendente'),
('Maria Santos', 'Teclado Mecânico', 1, 300.00, '2024-09-25', 'Cancelado'),
('Pedro Lima', 'Monitor 24"', 1, 800.00, '2024-10-01', 'Pendente'),
('Carla Souza', 'Webcam HD', 1, 200.00, '2024-10-02', 'Processando'),
('Lucas Oliveira', 'Headset Gamer', 1, 250.00, '2024-08-10', 'Cancelado'),
('Fernanda Rocha', 'SSD 500GB', 2, 400.00, '2024-10-03', 'Entregue'),
('Roberto Alves', 'Placa de Vídeo', 1, 1500.00, '2024-09-30', 'Pendente');

Agora execute as seguintes exclusões:

1. Exclua todos os pedidos com status 'Cancelado'
2. Remova os pedidos com valor total menor que R$ 200,00
3. Exclua o pedido do cliente 'João Costa'
4. Remova todos os pedidos feitos antes de setembro de 2024
5. Exclua os pedidos de produtos que contenham a palavra 'Gamer'
6. Remova pedidos com quantidade maior que 1 unidade
7. Exclua todos os pedidos já 'Entregue'
8. Confirme que restaram apenas pedidos 'Pendente' ou 'Processando'

Após cada DELETE, execute um SELECT para verificar o resultado.
*/

-- RESOLVA AQUI: