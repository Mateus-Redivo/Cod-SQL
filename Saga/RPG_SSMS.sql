-- RPG – A Saga do Aventureiro
-- Implementação SQL dos capítulos (SQL Server/SSMS)

-- Verificar se o banco existe e recriar para execução limpa
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'RPG_Saga')
BEGIN
    DROP DATABASE RPG_Saga;
END

CREATE DATABASE RPG_Saga;
GO

USE RPG_Saga;
GO

-- Início do Jogo – Criando o Mundo
-- Criando as tabelas necessárias

-- Tabela de Heróis
CREATE TABLE herois (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    classe VARCHAR(50) NOT NULL,
    hp INT NOT NULL,
    hp_max INT NOT NULL,
    mana INT NOT NULL
);

-- Tabela de Itens
CREATE TABLE itens (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descricao VARCHAR(200)
);

-- Tabela de Ambientes
CREATE TABLE ambientes (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(300)
);

-- Tabela de Inventário
CREATE TABLE inventario (
    id INT PRIMARY KEY IDENTITY(1,1),
    heroi_id INT,
    item_id INT,
    quantidade INT DEFAULT 1,
    CONSTRAINT FK_inventario_heroi FOREIGN KEY (heroi_id) REFERENCES herois(id),
    CONSTRAINT FK_inventario_item FOREIGN KEY (item_id) REFERENCES itens(id)
);

-- Tabela de Inimigos
CREATE TABLE inimigos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    hp INT NOT NULL,
    ambiente_id INT,
    ativo BIT DEFAULT 1,
    CONSTRAINT FK_inimigos_ambiente FOREIGN KEY (ambiente_id) REFERENCES ambientes(id)
);

-- ========================================
-- CAPÍTULO 1 – O Despertar no Vilarejo
-- ========================================

-- Registrar o herói principal
INSERT INTO herois (nome, classe, hp, hp_max, mana) 
VALUES ('Aventureiro', 'Guerreiro', 100, 100, 50);

-- Registrar mais dois aventureiros
INSERT INTO herois (nome, classe, hp, hp_max, mana) 
VALUES ('Elara', 'Maga', 80, 80, 120);

INSERT INTO herois (nome, classe, hp, hp_max, mana) 
VALUES ('Thorin', 'Anão', 120, 120, 30);

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 1)
-- ========================================

SELECT 
    h.nome AS 'Herói',
    h.classe AS 'Classe',
    h.hp AS 'HP',
    h.hp_max AS 'HP Max',
    h.mana AS 'Mana'
FROM herois h
ORDER BY h.id;

-- ========================================
-- CAPÍTULO 2 – O Inventário Inicial
-- ========================================

-- Criar itens iniciais
INSERT INTO itens (nome, tipo, descricao) 
VALUES ('Espada de Ferro', 'Arma', 'Uma espada simples mas resistente');

INSERT INTO itens (nome, tipo, descricao) 
VALUES ('Armadura de Couro', 'Armadura', 'Proteção básica contra ataques');

INSERT INTO itens (nome, tipo, descricao) 
VALUES ('Elmo de Ferro', 'Armadura', 'Proteção para a cabeça');

INSERT INTO itens (nome, tipo, descricao) 
VALUES ('Poção de Cura', 'Consumível', 'Restaura 30 pontos de vida');

INSERT INTO itens (nome, tipo, descricao) 
VALUES ('Chave de Carvalho', 'Especial', 'Uma chave antiga entalhada em carvalho');

-- Dar equipamentos iniciais para o herói principal (id = 1)
INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (1, 1, 1); -- Espada
INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (1, 2, 1); -- Armadura
INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (1, 3, 1); -- Elmo
INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (1, 4, 3); -- 3 Poções
INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (1, 5, 1); -- Chave

-- Dar equipamentos para os outros aventureiros
INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (2, 1, 1); -- Elara recebe espada
INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (2, 4, 2); -- Elara recebe poções

INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (3, 1, 1); -- Thorin recebe espada
INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (3, 2, 1); -- Thorin recebe armadura

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 2)
-- ========================================

SELECT 
    h.nome AS 'Herói',
    i.nome AS 'Item',
    i.tipo AS 'Tipo',
    inv.quantidade AS 'Qtd'
FROM herois h
INNER JOIN inventario inv ON h.id = inv.heroi_id
INNER JOIN itens i ON inv.item_id = i.id
WHERE inv.quantidade > 0
ORDER BY h.nome, i.tipo, i.nome;

-- ========================================
-- CAPÍTULO 3 – O Primeiro Combate
-- ========================================

-- Reduzir HP do herói principal após ataque do goblin
UPDATE herois 
SET hp = hp - 25 
WHERE id = 1;

-- Usar poção de cura (recuperar 30 HP)
UPDATE herois 
SET hp = CASE 
    WHEN hp + 30 > hp_max THEN hp_max 
    ELSE hp + 30 
END 
WHERE id = 1;

-- Remover uma poção do inventário
UPDATE inventario 
SET quantidade = quantidade - 1 
WHERE heroi_id = 1 AND item_id = 4 AND quantidade > 0;

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 3)
-- ========================================
SELECT 
    h.nome AS 'Herói',
    h.hp AS 'HP Atual',
    h.hp_max AS 'HP Máximo',
    'Sobreviveu ao combate!' AS 'Status'
FROM herois h
WHERE h.id = 1;

SELECT 
    h.nome AS 'Herói',
    i.nome AS 'Item',
    inv.quantidade AS 'Quantidade'
FROM herois h
INNER JOIN inventario inv ON h.id = inv.heroi_id
INNER JOIN itens i ON inv.item_id = i.id
WHERE h.id = 1 AND i.nome = 'Poção de Cura' AND inv.quantidade > 0;

-- ========================================
-- CAPÍTULO 4 – Perdas na Jornada
-- ========================================

-- Remover espada quebrada do inventário
DELETE FROM inventario 
WHERE heroi_id = 1 AND item_id = 1;

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 4)
-- ========================================

SELECT 
    h.nome AS 'Herói',
    i.nome AS 'Item',
    i.tipo AS 'Tipo',
    inv.quantidade AS 'Qtd',
    'Espada quebrada foi removida' AS 'Observação'
FROM herois h
INNER JOIN inventario inv ON h.id = inv.heroi_id
INNER JOIN itens i ON inv.item_id = i.id
WHERE h.id = 1 AND inv.quantidade > 0
ORDER BY i.tipo, i.nome;

-- ========================================
-- CAPÍTULO 5 – Criando o Mundo
-- ========================================

-- Registrar novos ambientes
INSERT INTO ambientes (nome, descricao) 
VALUES ('Floresta Sombria', 'Uma floresta densa e perigosa, cheia de criaturas maléficas');

INSERT INTO ambientes (nome, descricao) 
VALUES ('Montanha Gélida', 'Picos nevados habitados por monstros implacáveis');

-- Cadastrar inimigos da Floresta Sombria
INSERT INTO inimigos (nome, hp, ambiente_id) 
VALUES ('Lobo Sombrio', 40, 1);

INSERT INTO inimigos (nome, hp, ambiente_id) 
VALUES ('Aranha Venenosa', 25, 1);

INSERT INTO inimigos (nome, hp, ambiente_id) 
VALUES ('Orc Selvagem', 60, 1);

-- Cadastrar inimigos da Montanha Gélida
INSERT INTO inimigos (nome, hp, ambiente_id) 
VALUES ('Yeti', 80, 2);

INSERT INTO inimigos (nome, hp, ambiente_id) 
VALUES ('Golem de Gelo', 100, 2);

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 5)
-- ========================================

SELECT 
    a.nome AS 'Ambiente',
    a.descricao AS 'Descrição',
    i.nome AS 'Inimigo',
    i.hp AS 'HP',
    CASE WHEN i.ativo = 1 THEN 'Ativo' ELSE 'Derrotado' END AS 'Status'
FROM ambientes a
LEFT JOIN inimigos i ON a.id = i.ambiente_id
ORDER BY a.nome, i.hp DESC;

-- ========================================
-- CAPÍTULO 6 – O Boato no Vilarejo
-- ========================================

-- Listar todos os inimigos da Floresta Sombria
SELECT i.nome, i.hp, a.nome as ambiente
FROM inimigos i
INNER JOIN ambientes a ON i.ambiente_id = a.id
WHERE a.nome = 'Floresta Sombria' AND i.ativo = 1;

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 6)
-- ========================================

SELECT 
    i.nome AS 'Inimigo',
    i.hp AS 'HP',
    'AMEAÇA CONFIRMADA' AS 'Status',
    a.nome AS 'Local'
FROM inimigos i
INNER JOIN ambientes a ON i.ambiente_id = a.id
WHERE a.nome = 'Floresta Sombria' AND i.ativo = 1
ORDER BY i.hp DESC;

-- ========================================
-- CAPÍTULO 7 – Preparativos para a Viagem
-- ========================================

-- Aumentar vida máxima do herói (melhoria no equipamento)
UPDATE herois 
SET hp_max = hp_max + 20, hp = hp + 20 
WHERE id = 1;

-- Adicionar novas poções ao inventário (verificar se existe entrada)
IF EXISTS (SELECT 1 FROM inventario WHERE heroi_id = 1 AND item_id = 4)
    UPDATE inventario 
    SET quantidade = quantidade + 2 
    WHERE heroi_id = 1 AND item_id = 4;
ELSE
    INSERT INTO inventario (heroi_id, item_id, quantidade) VALUES (1, 4, 2);

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 7)
-- ========================================

SELECT 
    h.nome AS 'Herói',
    h.hp AS 'HP Atual',
    h.hp_max AS 'HP Máximo (+20)',
    h.mana AS 'Mana',
    'Preparado para a jornada!' AS 'Status'
FROM herois h
WHERE h.id = 1;

PRINT 'EXTRA - Suprimentos para a viagem:';
SELECT 
    h.nome AS 'Herói',
    i.nome AS 'Item',
    inv.quantidade AS 'Quantidade',
    CASE WHEN i.nome = 'Poção de Cura' THEN '+2 poções adicionadas' ELSE '' END AS 'Observação'
FROM herois h
INNER JOIN inventario inv ON h.id = inv.heroi_id
INNER JOIN itens i ON inv.item_id = i.id
WHERE h.id = 1 AND inv.quantidade > 0
ORDER BY i.tipo, i.nome;

-- ========================================
-- CAPÍTULO 8 – Emboscada na Estrada
-- ========================================

-- Reduzir HP após ataque dos bandidos
UPDATE herois 
SET hp = CASE WHEN hp - 30 < 0 THEN 0 ELSE hp - 30 END
WHERE id = 1;

-- Remover elmo roubado (se existir)
DELETE FROM inventario 
WHERE heroi_id = 1 AND item_id = 3;

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 8)
-- ========================================

SELECT 
    h.nome AS 'Herói',
    h.hp AS 'HP Atual (-30)',
    h.hp_max AS 'HP Máximo',
    CASE 
        WHEN h.hp <= h.hp_max * 0.3 THEN 'GRAVEMENTE FERIDO'
        WHEN h.hp <= h.hp_max * 0.6 THEN 'Ferido'
        ELSE 'Em boa forma'
    END AS 'Condição'
FROM herois h
WHERE h.id = 1;

PRINT 'EXTRA - Perdas na emboscada:';
SELECT 
    'Elmo de Ferro' AS 'Item Perdido',
    'Roubado pelos bandidos' AS 'Motivo',
    'Proteção da cabeça comprometida' AS 'Consequência';

-- ========================================
-- CAPÍTULO 9 – O Guardião da Floresta
-- ========================================

-- Verificar se possui a Chave de Carvalho
SELECT h.nome, i.nome as item
FROM herois h
INNER JOIN inventario inv ON h.id = inv.heroi_id
INNER JOIN itens i ON inv.item_id = i.id
WHERE h.id = 1 AND i.nome = 'Chave de Carvalho';

-- Entregar a chave (remover do inventário se existir)
DELETE FROM inventario 
WHERE heroi_id = 1 AND item_id = 5;

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 9)
-- ========================================

SELECT 
    'Chave de Carvalho' AS 'Item Entregue',
    'Guardião da Floresta' AS 'Destinatário',
    'Passagem liberada para a floresta' AS 'Recompensa',
    'Missão diplomática bem-sucedida' AS 'Status';

PRINT 'EXTRA - Inventário após negociação:';
SELECT 
    h.nome AS 'Herói',
    i.nome AS 'Item',
    inv.quantidade AS 'Quantidade'
FROM herois h
INNER JOIN inventario inv ON h.id = inv.heroi_id
INNER JOIN itens i ON inv.item_id = i.id
WHERE h.id = 1 AND inv.quantidade > 0
ORDER BY i.tipo, i.nome;

-- ========================================
-- CAPÍTULO 10 – O Confronto Final
-- ========================================

-- Criar o registro do Dragão Sombrio
INSERT INTO inimigos (nome, hp, ambiente_id) 
VALUES ('Dragão Sombrio', 200, 1);

-- Reduzir HP após ataque do dragão
UPDATE herois 
SET hp = CASE WHEN hp - 50 < 0 THEN 0 ELSE hp - 50 END
WHERE id = 1;

-- Usar poções para se recuperar (usar 2 poções se disponível)
DECLARE @pocoes_disponiveis INT;
SELECT @pocoes_disponiveis = ISNULL(quantidade, 0) FROM inventario WHERE heroi_id = 1 AND item_id = 4;

IF @pocoes_disponiveis >= 2
BEGIN
    UPDATE herois 
    SET hp = CASE 
        WHEN hp + 60 > hp_max THEN hp_max 
        ELSE hp + 60 
    END 
    WHERE id = 1;
    
    -- Remover poções utilizadas
    UPDATE inventario 
    SET quantidade = quantidade - 2 
    WHERE heroi_id = 1 AND item_id = 4;
END
ELSE IF @pocoes_disponiveis = 1
BEGIN
    UPDATE herois 
    SET hp = CASE 
        WHEN hp + 30 > hp_max THEN hp_max 
        ELSE hp + 30 
    END 
    WHERE id = 1;
    
    -- Remover poção utilizada
    DELETE FROM inventario WHERE heroi_id = 1 AND item_id = 4;
END

-- Remover o Dragão Sombrio após derrota
UPDATE inimigos 
SET ativo = 0 
WHERE nome = 'Dragão Sombrio';

-- ========================================
-- EXTRA - Consulta do Estado (Capítulo 10)
-- ========================================

SELECT 
    i.nome AS 'Boss Final',
    i.hp AS 'HP Original',
    CASE WHEN i.ativo = 1 THEN 'VIVO' ELSE 'DERROTADO' END AS 'Status',
    a.nome AS 'Local da Batalha'
FROM inimigos i
INNER JOIN ambientes a ON i.ambiente_id = a.id
WHERE i.nome = 'Dragão Sombrio';

PRINT 'EXTRA - Estado do Herói após uso de poções:';
SELECT 
    h.nome AS 'Herói',
    h.hp AS 'HP Final',
    h.hp_max AS 'HP Máximo',
    CAST((CAST(h.hp AS FLOAT) / h.hp_max * 100) AS INT) AS '% HP',
    CASE 
        WHEN h.hp > 0 THEN 'SOBREVIVENTE!'
        ELSE 'Derrotado'
    END AS 'Resultado'
FROM herois h
WHERE h.id = 1;

-- ========================================
-- EPÍLOGO - Estado Final do Herói
-- ========================================

-- Exibir estado final do herói vencedor
SELECT 
    h.nome,
    h.classe,
    h.hp as 'HP Atual',
    h.hp_max as 'HP Máximo',
    h.mana,
    'VENCEDOR DA SAGA!' as status
FROM herois h
WHERE h.id = 1;

-- Exibir inventário final
SELECT 
    h.nome as Herói,
    i.nome as Item,
    inv.quantidade
FROM herois h
INNER JOIN inventario inv ON h.id = inv.heroi_id
INNER JOIN itens i ON inv.item_id = i.id
WHERE h.id = 1 AND inv.quantidade > 0;

-- ========================================
-- EXTRA - Relatório Final da Saga
-- ========================================
SELECT 
    'SAGA CONCLUÍDA' AS 'Status',
    COUNT(CASE WHEN i.ativo = 0 THEN 1 END) AS 'Inimigos Derrotados',
    COUNT(CASE WHEN i.ativo = 1 THEN 1 END) AS 'Inimigos Restantes',
    COUNT(a.id) AS 'Ambientes Explorados'
FROM inimigos i
CROSS JOIN ambientes a;

PRINT 'EXTRA - Heróis Participantes da Saga:';
SELECT 
    h.nome AS 'Herói',
    h.classe AS 'Classe',
    h.hp AS 'HP Final',
    CASE 
        WHEN h.id = 1 THEN 'PROTAGONISTA - Vencedor da Saga'
        ELSE 'Companheiro de Aventura'
    END AS 'Papel na História'
FROM herois h
ORDER BY h.id;
