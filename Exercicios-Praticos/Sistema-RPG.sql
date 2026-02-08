-- Criar banco de dados para Jogo RPG
CREATE DATABASE IF NOT EXISTS JOGO_RPG;

USE JOGO_RPG;

-- Classes de Personagens
CREATE TABLE CLASSES(
    CLASSE_ID int auto_increment primary key not null,
    NOME_CLASSE varchar(50) not null,
    DESCRICAO text,
    HABILIDADE varchar(100),
    SAUDE_BASE int not null check (SAUDE_BASE > 0),
    MANA_BASE int not null check (MANA_BASE > 0)
);

-- Espécies/Raças de Personagens
CREATE TABLE ESPECIES(
    ESPECIE_ID int auto_increment primary key not null,
    NOME_ESPECIE varchar(50) not null,
    DESCRICAO text,
    BONUS_FORCA int default 0,
    BONUS_DESTREZA int default 0,
    BONUS_INTELIGENCIA int default 0,
    BONUS_SAUDE int default 0,
    BONUS_MANA int default 0,
    HABILIDADE_RACIAL varchar(100),
    EXPECTATIVA_VIDA int
);

-- Personagens
CREATE TABLE PERSONAGENS(
    PERSONAGEM_ID int auto_increment primary key not null,
    NOME_PERSONAGEM varchar(50) not null,
    CLASSE_ID int,
    ESPECIE_ID int,
    DESCRICAO text,
    NIVEL int default 1,
    EXPERIENCIA int default 0,
    SAUDE int not null,
    MANA int not null,
    FORCA int not null,
    DESTREZA int not null,
    INTELIGENCIA int not null,
    OURO int default 0,
    FOREIGN KEY (CLASSE_ID) REFERENCES CLASSES(CLASSE_ID),
    FOREIGN KEY (ESPECIE_ID) REFERENCES ESPECIES(ESPECIE_ID)
);

-- Itens
CREATE TABLE ITENS(
    ITEM_ID int auto_increment primary key not null,
    NOME_ITEM varchar(100) not null,
    TIPO_ITEM varchar(50) not null, -- arma, armadura, poção, etc.
    DESCRICAO text,
    VALOR int not null,
    NIVEL_MINIMO int default 1
);

-- Inventário do Personagem
CREATE TABLE INVENTARIO(
    INVENTARIO_ID int auto_increment primary key not null,
    PERSONAGEM_ID int,
    ITEM_ID int,
    QUANTIDADE int default 1,
    EQUIPADO boolean default 0,
    FOREIGN KEY (PERSONAGEM_ID) REFERENCES PERSONAGENS(PERSONAGEM_ID),
    FOREIGN KEY (ITEM_ID) REFERENCES ITENS(ITEM_ID)
);

-- Localizações/Mapas
CREATE TABLE LOCALIZACOES(
    LOCALIZACAO_ID int auto_increment primary key not null,
    NOME_LOCALIZACAO varchar(100) not null,
    DESCRICAO text,
    NIVEL_MINIMO int default 1
);

-- Monstros/Inimigos
CREATE TABLE MONSTROS(
    MONSTRO_ID int auto_increment primary key not null,
    NOME_MONSTRO varchar(50) not null,
    LOCALIZACAO_ID int,
    SAUDE int not null,
    DANO int not null,
    RECOMPENSA_EXPERIENCIA int not null,
    RECOMPENSA_OURO int not null,
    FOREIGN KEY (LOCALIZACAO_ID) REFERENCES LOCALIZACOES(LOCALIZACAO_ID)
);

-- Missões
CREATE TABLE MISSOES(
    MISSAO_ID int auto_increment primary key not null,
    NOME_MISSAO varchar(100) not null,
    DESCRICAO text,
    NIVEL_MINIMO int not null,
    RECOMPENSA_OURO int not null,
    RECOMPENSA_EXPERIENCIA int not null,
    LOCALIZACAO_ID int,
    FOREIGN KEY (LOCALIZACAO_ID) REFERENCES LOCALIZACOES(LOCALIZACAO_ID)
);

-- Missões dos Personagens (rastreia quais personagens têm quais missões)
CREATE TABLE PERSONAGEM_MISSOES(
    PERSONAGEM_ID int,
    MISSAO_ID int,
    STATUS varchar(20) default 'ATIVA', -- ATIVA, CONCLUIDA, FALHOU
    DATA_INICIO datetime default NOW(),
    DATA_CONCLUSAO datetime null,
    PRIMARY KEY (PERSONAGEM_ID, MISSAO_ID),
    FOREIGN KEY (PERSONAGEM_ID) REFERENCES PERSONAGENS(PERSONAGEM_ID),
    FOREIGN KEY (MISSAO_ID) REFERENCES MISSOES(MISSAO_ID)
);

-- Dados de exemplo para Classes
INSERT INTO CLASSES (NOME_CLASSE, DESCRICAO, SAUDE_BASE, MANA_BASE)
VALUES 
    ('Guerreiro', 'Lutador corpo a corpo forte com alta defesa', 150, 50),
    ('Mago', 'Poderoso lançador de feitiços com alta inteligência', 75, 150),
    ('Ladino', 'Lutador ágil especializado em furtividade e golpes críticos', 100, 75);

-- Dados de exemplo para Espécies
INSERT INTO ESPECIES (NOME_ESPECIE, DESCRICAO, BONUS_FORCA, BONUS_DESTREZA, BONUS_INTELIGENCIA, BONUS_SAUDE, BONUS_MANA, HABILIDADE_RACIAL, EXPECTATIVA_VIDA)
VALUES 
    ('Humano', 'Versateis e adaptaveis', 1, 1, 1, 5, 0, 'Versatilidade', 80),
    ('Elfo', 'Ageis e inteligentes com longa vida', 0, 2, 2, 0, 5, 'Visao noturna', 700),
    ('Anao', 'Resistentes e fortes', 2, 0, 0, 10, 0, 'Resistencia a venenos', 350),
    ('Orc', 'Brutal e resistente', 3, 0, -1, 15, 0, 'Fúria de batalha', 60);

-- Dados de exemplo para Localizações
INSERT INTO LOCALIZACOES (NOME_LOCALIZACAO, DESCRICAO, NIVEL_MINIMO)
VALUES
    ('Floresta Verde', 'Uma floresta pacífica com alguns animais selvagens', 1),
    ('Caverna Escura', 'Uma caverna perigosa cheia de monstros', 5),
    ('Montanha do Dragão', 'Lar de dragões poderosos', 15);


SELECT * FROM ESPECIES;