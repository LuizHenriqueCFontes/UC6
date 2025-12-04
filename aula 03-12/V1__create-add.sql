
CREATE TABLE tbcostumer(
	code INT IDENTITY(1, 1),
	nome VARCHAR(100) NULL,
	address VARCHAR(250) NULL,
	phone VARCHAR(25) NULL,
	email VARCHAR(100) NULL,

	PRIMARY KEY(code)
);
GO

SP_help'tbcostumer'
GO

ALTER TABLE tbcostumer
ADD birthdate DATETIME NULL;