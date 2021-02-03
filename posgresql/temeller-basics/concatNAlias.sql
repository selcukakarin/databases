/*
	String Birleştirme ( concat ) ve Takma İsim Kullanma ( Alias )
	
	Syntax
		SELECT column1, column2....
		FROM table_name AS alias_name
		WHERE [condition];
		
		SELECT column_name AS alias_name
		FROM table_name
		WHERE [condition];
*/
SELECT employee_id, first_name, last_name FROM employees;
-- concat
SELECT employee_id, first_name || ' ' || last_name FROM employees;
SELECT employee_id, first_name || ' ' || last_name AS full_name FROM employees;
SELECT first_name || ' ' || last_name AS full_name FROM employees;