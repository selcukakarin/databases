/*
	Postgresql temelleri ( Örnek Alıştırmalar )
*/

SELECT
	first_name AS fname, last_name
FROM employees;

SELECT
	first_name AS "first name", last_name AS "last name"
FROM employees;

SELECT DISTINCT department_id
FROM employees;

SELECT *
FROM employees
ORDER BY first_name DESC;

SELECT first_name, last_name, salary, salary*.15 MaasArtisi
FROM employees;

SELECT employee_id, first_name
FROM employees LIMIT 10;

SELECT employee_id, first_name
FROM employees LIMIT 10 OFFSET 5;



