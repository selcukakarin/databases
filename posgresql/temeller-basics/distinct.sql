/* 
	Veri Tekilleştirmek
	
	Syntax
		
		SELECT DISTINCT column1, column2
		FROM table_name
		ORDER BY
			column1 ASC,
			column2 DESC;
*/

SELECT film_id
FROM inventory
ORDER BY film_id ASC;

SELECT DISTINCT film_id
FROM inventory
ORDER BY film_id ASC;