CREATE DATABASE ex28_03
GO
USE ex28_03

CREATE TABLE Funcionario(
codigo			INT				NOT NULL,
nome			VARCHAR(80)		NOT NULL,
salario			DECIMAL(7,2)	NOT NULL
PRIMARY KEY(codigo)
)
GO

CREATE TABLE Dependendente(
codigo_Funcionário			INT				NOT NULL,
nome_Funcionário			VARCHAR(80)		NOT NULL,
salario_Dependente			DECIMAL(7,2)	NOT NULL
PRIMARY KEY(codigo_Funcionário)
FOREIGN KEY (codigo_Funcionário) REFERENCES Funcionario(codigo),
)
GO

INSERT INTO Funcionario VALUES
(1,'Ana',1200.50),
(2,'Paulo',3000.50),
(3,'Renato',2000.0),
(4,'Julia',2000.50)

INSERT INTO Dependendente VALUES
(1,'Roberto',2100.50),
(2,'Junior',1000.50),
(3,'Eduardo',4000.0),
(4,'Claudia',3000.50)

CREATE FUNCTION Nome_Salarios(@codigo INT)
	RETURNS @tabela TABLE(
	nome VARCHAR(80),
	nome_Funcionário VARCHAR(80),
	salario			DECIMAL(7,2),
	salario_Dependente			DECIMAL(7,2)
	)
	AS
	BEGIN
		INSERT INTO @tabela (nome, nome_Funcionário, salario, salario_Dependente) 
		SELECT nome, nome_Funcionário, salario, salario_Dependente FROM Funcionario, Dependendente
		RETURN
	END

CREATE FUNCTION Salarios(@codigo INT)
	RETURNS DECIMAL(7,2)
	AS
	BEGIN
		DECLARE @soma INT
		SELECT	@soma = salario, salario_Dependente FROM Funcionario, Dependendente
		PRINT @soma
	END

SELECT * FROM Nome_Salarios(1)