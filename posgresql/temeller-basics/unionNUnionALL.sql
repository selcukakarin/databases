/*
	UNION
*/
-- distinct - tekillik var
-- İki tablolada da aynı anda bulunan kayıtları getirir
SELECT customer_id FROM customer
UNION
SELECT customer_id FROM payment;

/*
	UNION ALL
*/

-- İki tablolada da var olan tüm kayıtları getirir
SELECT customer_id FROM customer
UNION ALL
SELECT customer_id FROM payment;

SELECT customer_id FROM customer
UNION ALL
SELECT customer_id FROM payment
ORDER BY customer_id ASC;
