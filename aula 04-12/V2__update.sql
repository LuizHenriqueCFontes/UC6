UPDATE 
	tbcostumer
SET 
	address = 'Rua da Saudade, Florianopolis, SC',
	phone = '48-23345657'
WHERE code = 1;

SELECT * FROM tbcostumer;

DELETE tbcostumer
WHERE code = 10;