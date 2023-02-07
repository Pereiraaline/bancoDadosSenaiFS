-- INICIO SCRIPT
--DDL (CRIA A ESTRUTURA DO BANCO DE DADOS)
CREATE DATABASE RpgDbSenaiFull
GO

USE RpgDbSenaiFull
GO

CREATE TABLE Usuarios (
	IdUsuario INT PRIMARY kEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL,
)
GO

CREATE TABLE Classes(
	IdClasse INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens(
	IdPersonagem INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) UNIQUE NOT NULL,
	IdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	IdClasse INT UNIQUE FOREIGN KEY REFERENCES Classes(IdClasse),
)
GO

CREATE TABLE Habilidades(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)
GO

CREATE TABLE ClassesHabilidades(
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade),
)
GO

--DML (INSER��O/MANIPULA��O DO BANCO DE DADOS)
-------- INSERE DADOS PERSONAGEM 'DEUBUG'-------- 
INSERT INTO Usuarios(Senha, Email) VALUES(123456, 'email@email.com')
INSERT INTO Classes VALUES('B�rbaro','Descri��o Classe B�rbaro')
INSERT INTO Habilidades VALUES('Lan�a Mortal','Descri��o Lan�a Mortal'), ('Escudo Supremo','Descri��o Escudo Supremo')

INSERT INTO Personagens VALUES('DeuBug', 1,1)
INSERT INTO ClassesHabilidades VALUES(1,1)
INSERT INTO ClassesHabilidades VALUES(1,2)


-------- INSERE DADOS PERSONAGEM 'BITBUG'-------- 
INSERT INTO Usuarios(Senha, Email) VALUES(123456, 'bitbug@email.com')
INSERT INTO Classes VALUES('Monge','Descri��o Classe Monge')
INSERT INTO Habilidades VALUES('Recuperar Vida','Descri��o Recuperar Vida')

INSERT INTO Personagens VALUES('BitBug', 2, 2)
INSERT INTO ClassesHabilidades VALUES(2,2)
INSERT INTO ClassesHabilidades VALUES(2,3)


--------UPDATE => ATUALIZA DADOS DA TABELA -------- 
UPDATE Usuarios SET Email = 'deubug@email.com' WHERE IdUsuario = 1



--DQL (SELECT * FROM => SELECIONA TODOS OS ELEMENTOS DE DETERMINADA TABELA)
SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Personagens
SELECT * FROM Habilidades
SELECT * FROM ClassesHabilidades

-- SELECT Senha, Email FROM Usuarios => SELECIONA OS ELEMENTOS ESPECIFICADOS DE DETERMINADA TABELA
SELECT Email, Senha FROM Usuarios


--JOIN (FAZ JUN��O DE DADOS)
-- INNER  JOIN (JUN��O TABELAS / IGNORA LINHAS VAZIAS)
SELECT * FROM Personagens INNER JOIN Classes ON Personagens.IdClasse = Classes.IdClasse

--INNER JOIN ESPECIFICANDO COLUNAS
SELECT Personagens.Nome, Classes.Descricao FROM Personagens
INNER JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse

-- ABREVIANDO NOME DAS TABELAS E DANDO APELIDOS A COLUNAS
SELECT P.Nome, C.Nome 'Classe', C.Descricao FROM Personagens P
JOIN Classes C
ON P.IdClasse = C.IdClasse

-- CRIANDO UMA PERMISSÃO
CREATE LOGIN aluno
WITH PASSWORD = '1234'

CREATE USER aluno FOR LOGIN aluno
GRANT SELECT TO aluno

-- FIM DO SCRIPT