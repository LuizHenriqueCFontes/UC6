CREATE TABLE #tbcostumer(
	code INT identity(1, 1), 
	nome VARCHAR(100) NULL,
	address VARCHAR(200) NULL,
	phone VARCHAR(25) NULL,
	email VARCHAR(100) NULL,
	birthdate DATETIME NOT NULL,

	PRIMARY KEY(code)
);
GO

SELECT * FROM #tbcostumer;
GO