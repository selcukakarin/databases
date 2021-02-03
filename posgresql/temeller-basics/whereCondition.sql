/*
	SELECT ... WHERE  ile Veri Filtreleme
	
	Syntax
	
		SELECT * FROM tableName WHERE x = 1;
*/
SELECT * FROM employees;

SELECT employee_id, first_name, last_name, salary 
FROM Employees
WHERE employee_id = 101;

SELECT employee_id, first_name, last_name, salary 
FROM Employees
WHERE employee_id < 105;

SELECT employee_id, first_name, last_name, salary 
FROM Employees
WHERE employee_id >=105;

SELECT employee_id, first_name, last_name, salary 
FROM Employees
WHERE employee_id <> 105;

SELECT employee_id, first_name, last_name, salary 
FROM Employees
WHERE employee_id != 105;

SELECT *
FROM Employees
WHERE hire_date != '1987-06-17 00:00:00';

