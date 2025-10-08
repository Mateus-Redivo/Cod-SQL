/*
=============================================
 0. Criando banco e usando
=============================================
*/
IF DB_ID('RPG') IS NOT NULL
    DROP DATABASE RPG;
GO

CREATE DATABASE RPG;
GO

USE RPG;
GO

/*
=============================================
 1. Criação de Tabelas
=============================================
*/

-- Tabela de Personagens
CREATE TABLE Personagem (
    PersonagemID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL,
    Idade VARCHAR(50),
    Nivel INT DEFAULT 1,
    Hp INT DEFAULT 100,
    Inteligencia INT DEFAULT 0,
    Forca INT DEFAULT 0,
    Sorte INT DEFAULT 0,
    Experiencia INT DEFAULT 0,
    Confianca INT DEFAULT 0
);
GO

-- Tabela de Itens
CREATE TABLE Item (
    ItemID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(255)
);
GO

-- Tabela de Eventos
CREATE TABLE Evento (
    EventoID INT PRIMARY KEY IDENTITY(1,1),
    PersonagemID INT NOT NULL,
    Capitulo INT,
    Descricao VARCHAR(MAX),
    CONSTRAINT FK_PersonagemEvento FOREIGN KEY (PersonagemID) REFERENCES Personagem(PersonagemID)
);
GO

-- Tabela de Escolhas
CREATE TABLE Escolha (
    EscolhaID INT PRIMARY KEY IDENTITY(1,1),
    PersonagemID INT NOT NULL,
    Capitulo INT,
    EscolhaDescricao VARCHAR(255),
    Consequencia VARCHAR(255),
    CONSTRAINT FK_PersonagemEscolha FOREIGN KEY (PersonagemID) REFERENCES Personagem(PersonagemID)
);
GO

-- Tabela para vincular Personagem e Itens
CREATE TABLE PersonagemItem (
    PersonagemID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantidade INT DEFAULT 1,
    CONSTRAINT PK_PersonagemItem PRIMARY KEY (PersonagemID, ItemID),
    CONSTRAINT FK_PersonagemItem_Personagem FOREIGN KEY (PersonagemID) REFERENCES Personagem(PersonagemID),
    CONSTRAINT FK_PersonagemItem_Item FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);
GO

/*
=============================================
 2. Inserção de Personagens
=============================================
*/
INSERT INTO Personagem (Nome, Idade) VALUES 
('Chaoscifer', '16'),
('May', '18'),
('Seu Francisco', '71'),
('Gato', 'Não identificado'),
('Serafins', 'Não identificado'),
('Mendigo', 'Não identificado');
GO

/*
=============================================
 3. Inserção de Itens
=============================================
*/
INSERT INTO Item (Nome, Descricao) VALUES 
('Amuleto da Sorte', '+2 de sorte'),
('Poção de Cura', 'Recupera HP'),
('Camiseta', 'Roupa simples'),
('Pedra Brilhante', 'Desbloqueia caminho curto'),
('Soco Inglês', 'Arma corpo a corpo'),
('Facão', 'Arma corpo a corpo'),
('Espada', 'Arma corpo a corpo'),
('Arma de Fogo', 'Arma à distância'),
('Regata', 'Roupa de compressão'),
('Canivete', 'Pequena arma cortante'),
('Arco e Flecha', 'Arma à distância');
GO

/*
=============================================
 4. Capítulo 1
=============================================
*/
INSERT INTO Evento (PersonagemID, Capitulo, Descricao) VALUES
(1, 1, 'Chaos cai para o submundo desacordado e acorda vendo um gato preto e uma mulher misteriosa.'),
(1, 1, 'A mulher levanta Chaos, dá poção de cura e uma camiseta. O gato se encosta e um miado rouco é ouvido.');

INSERT INTO Escolha (PersonagemID, Capitulo, EscolhaDescricao, Consequencia) VALUES
(1, 1, 'Fazer carinho no gato', 'Ganha o Amuleto da Sorte (+2 de sorte)'),
(1, 1, 'Falar com a mulher', 'Não ganha nada'),
(1, 1, 'Perguntar "seguimos ele?"', 'Ganha +1 de confiança com a mulher'),
(1, 1, 'Dizer "vamos" e seguir', 'Nada acontece');

-- carinho no gato
UPDATE Personagem SET Sorte = Sorte + 2 WHERE PersonagemID = 1;
-- confiança em May
UPDATE Personagem SET Confianca = Confianca + 1 WHERE PersonagemID = 1;

INSERT INTO PersonagemItem (PersonagemID, ItemID) VALUES
(1, 1), -- Amuleto da Sorte
(1, 2), -- Poção de Cura
(1, 3); -- Camiseta
GO

/*
=============================================
 5. Capítulo 2
=============================================
*/
INSERT INTO Evento (PersonagemID, Capitulo, Descricao) VALUES
(1, 2, 'O gato segue para um beco escuro. A mulher oferece dois caminhos: longo (8h) ou curto (6h).'),
(1, 2, 'Um mendigo surge chutando caixas e pede moedas ou bebida para Chaos e May.');

INSERT INTO Escolha (PersonagemID, Capitulo, EscolhaDescricao, Consequencia) VALUES
(1, 2, 'Seguir caminho mais longo', 'Ganha mais níveis e itens adicionais'),
(1, 2, 'Cortar caminho pelo beco', 'Passa por problemas maiores, mas ganha mais experiência'),
(1, 2, 'Pegar pedra brilhante', 'Desbloqueia caminho curto'),
(1, 2, 'Ignorar pedra', 'Caminho curto bloqueado');

UPDATE Personagem SET Nivel = Nivel + 1, Experiencia = Experiencia + 5 WHERE PersonagemID = 1;
GO

/*
=============================================
 6. Capítulo 3
=============================================
*/
INSERT INTO Evento (PersonagemID, Capitulo, Descricao) VALUES
(1, 3, 'Chaos pega a pedra brilhante e desbloqueia caminho curto. Dois gatos aparecem e seguem por trilhas diferentes.'),
(1, 3, 'Caminho curto: Chaos entra em beco com neblina, tem alucinações e encontra sua mãe em visão.'),
(1, 3, 'Caminho longo: Chaos e May encontram Seu Francisco, que os treina em stealth e combate por 2 semanas.');

INSERT INTO Escolha (PersonagemID, Capitulo, EscolhaDescricao, Consequencia) VALUES
(1, 3, 'Seguir caminho curto', 'Chaos ganha +2 Força, +3 Experiência, obtém Soco Inglês. May ganha um Facão.'),
(1, 3, 'Seguir caminho longo', 'Chaos ganha +2 Inteligência, +3 Confiança em May, +3 Experiência. Recebe Espada, Arma de Fogo e Regata. May recebe um Canivete.');

-- Caminho curto
UPDATE Personagem SET Forca = Forca + 2, Experiencia = Experiencia + 3 WHERE PersonagemID = 1;
INSERT INTO PersonagemItem (PersonagemID, ItemID) VALUES (1, 5), (2, 6);

-- Caminho longo
UPDATE Personagem SET Inteligencia = Inteligencia + 2, Confianca = Confianca + 3, Experiencia = Experiencia + 3 WHERE PersonagemID = 1;
INSERT INTO PersonagemItem (PersonagemID, ItemID) VALUES (1, 7), (1, 8), (1, 9), (2, 10);
GO

/*
=============================================
 7. Capítulo 4
=============================================
*/
INSERT INTO Evento (PersonagemID, Capitulo, Descricao) VALUES
(1, 4, 'Chaos e May chegam a um portão metálico. O gato passa, eles ficam em silêncio.'),
(1, 4, 'Do outro lado há um grupo de Serafins. Caminho longo: Chaos e May lutam em sincronia. Caminho curto: Chaos é atingido por uma flecha.'),
(1, 4, 'Um Serafim peculiar aparece: um olho gigante com asas angelicais, deixando mensagens enigmáticas.');

INSERT INTO Escolha (PersonagemID, Capitulo, EscolhaDescricao, Consequencia) VALUES
(1, 4, 'Lutar em sincronia com May (caminho longo)', '+2 Experiência'),
(1, 4, 'Atacar sem pensar (caminho curto)', '-20 HP, continua luta');

-- Caminho longo
UPDATE Personagem SET Experiencia = Experiencia + 2 WHERE PersonagemID = 1;
-- Caminho curto
UPDATE Personagem SET Hp = Hp - 20 WHERE PersonagemID = 1;
GO

/*
=============================================
 8. Capítulo 5
=============================================
*/
INSERT INTO Evento (PersonagemID, Capitulo, Descricao) VALUES
(1, 5, 'Chaos e May enfrentam dilema após a batalha com Serafins. May trai Chaos colocando faca em seu pescoço.'),
(1, 5, 'Caminho longo: Chaos tenta conversar, May se arrepende e juntos voltam ao mundo superior.'),
(1, 5, 'Caminho curto: Chaos se enfurece, asas crescem novamente, batalha intensa contra May.');

INSERT INTO Escolha (PersonagemID, Capitulo, EscolhaDescricao, Consequencia) VALUES
(1, 5, 'Dialogar com May (caminho longo)', 'May se arrepende e retorna com Chaos ao mundo superior'),
(1, 5, 'Lutar contra May (caminho curto)', 'Chaos perde 20 HP, May perde 45 HP. Chaos fica desacordado, May foge.');

-- Caminho longo
UPDATE Personagem SET Confianca = Confianca + 2 WHERE PersonagemID = 1;
-- Caminho curto
UPDATE Personagem SET Hp = Hp - 20 WHERE PersonagemID = 1;
-- May perde HP
UPDATE Personagem SET Hp = Hp - 45 WHERE PersonagemID = 2;
GO

/*
=============================================
 9. Consultas de teste
=============================================
*/

-- Histórico completo do personagem
SELECT Capitulo, Descricao
FROM Evento
WHERE PersonagemID = 1
ORDER BY Capitulo;

-- Escolhas feitas pelo jogador
SELECT Capitulo, EscolhaDescricao, Consequencia
FROM Escolha
WHERE PersonagemID = 1
ORDER BY Capitulo;

-- Itens do personagem Chaos
SELECT p.Nome AS Personagem, i.Nome AS Item, pi.Quantidade
FROM PersonagemItem pi
JOIN Personagem p ON pi.PersonagemID = p.PersonagemID
JOIN Item i ON pi.ItemID = i.ItemID
WHERE p.PersonagemID = 1;

-- Atributos atuais do Chaos
SELECT Nome, Nivel, Hp, Forca, Inteligencia, Sorte, Experiencia, Confianca
FROM Personagem
WHERE PersonagemID = 1;
