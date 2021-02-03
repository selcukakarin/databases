/*
	INTERSECT - Kesişim
	
	Syntax
	
		SELECT
			column_list
		FROM A
		INTERSECT
		SELECT
			column_list
		FROM B;
*/

SELECT store_id FROM customer
INTERSECT
SELECT store_id FROM staff;

SELECT customer_id FROM customer
INTERSECT
SELECT customer_id FROM payment;