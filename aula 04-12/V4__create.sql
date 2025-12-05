CREATE TABLE tbproduct(
	code INT IDENTITY(1, 1) NOT NULL,
	description VARCHAR (150) NULL,
	salevalue DECIMAL(18, 2) NULL,
	active BIT DEFAULT 1,

	PRIMARY KEY(code)
);

CREATE TABLE tbsale(
	code INT IDENTITY(1, 1) NOT NULL,
	costumer INT NULL REFERENCES tbcostumer(code),
	saledate DATETIME DEFAULT GETDATE(),

	PRIMARY KEY(code)
);


CREATE TABLE tbsaledetail(
	sale INT NOT NULL REFERENCES tbsale(code)
						ON DELETE NO ACTION,
	product INT NOT NULL,
	quantity INT NOT NULL,
	salevalue DECIMAL(18, 2) NULL,

	PRIMARY KEY(product, sale)
);

SP_HELP tbsale;
SP_HELP tbsaledetail;

ALTER TABLE tbsaledetail
ADD CONSTRAINT fk_sale_detail_product
FOREIGN KEY(product) REFERENCES tbproduct(code);

SELECT * FROM tbsaledetail;