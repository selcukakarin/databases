/* 
	LIMIT ve OFFSET operatörleri
	
	Syntax
		
		SELECT *
		FROM table_name
		LIMIT n;
		
		SELECT *
		FROM table_name
		LIMIT n OFFSET m;
		
		SELECT *
		FROM table_name
		ORDER BY column1
		LIMIT n;
*/

-- hr

SELECT * FROM employees;
 
SELECT * FROM employees LIMIT 4;
 
SELECT * FROM employees LIMIT 2;
 
SELECT * FROM employees LIMIT 4 OFFSET 2;
 
SELECT * FROM employees LIMIT 4 OFFSET 4;

-- dvdrental

SELECT * FROM film;

SELECT film_id, title, release_year FROM film
ORDER BY film_id
LIMIT 5;

SELECT film_id, title, release_year FROM film
ORDER BY film_id DESC
LIMIT 5; 

SELECT film_id, title, release_year FROM film
ORDER BY film_id DESC
LIMIT 5 OFFSET 1;  
 
 
 