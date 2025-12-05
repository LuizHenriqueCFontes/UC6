SELECT 
	code,
	nome,
	address,
	phone,
	birthdate
FROM tbcostumer
WHERE code > 7;

SELECT 
	code,
	nome, 
	address,
	phone,
	birthdate
FROM tbcostumer
WHERE code > 7
AND birthdate > '1980-01-01';

SELECT 
	code,
	nome, 
	address,
	phone,
	birthdate
FROM tbcostumer
WHERE code > 7
OR birthdate > '1980-01-01';

SELECT	
	code,
	nome,
	address,
	phone,
	birthdate
FROM tbcostumer
WHERE nome LIKE '%Dutra%';

SELECT TOP 3
	code,
	nome,
	address,
	phone
FROM tbcostumer
WHERE nome LIKE '%Silva%';

SELECT 
	code,
	nome, 
	address,
	phone
FROM tbcostumer
ORDER BY nome;
	