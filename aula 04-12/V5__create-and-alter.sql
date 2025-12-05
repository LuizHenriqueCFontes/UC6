CREATE TABLE tbcategory(
	code INT IDENTITY(1, 1) NOT NULL,
	description VARCHAR(150) NOT NULL,

	PRIMARY KEY(code)
);

ALTER TABLE tbproduct
ADD category INT NULL;

ALTER TABLE tbproduct
ADD CONSTRAINT fk_category
FOREIGN KEY(category) REFERENCES tbcategory(code);

SP_HELP tbcategory;