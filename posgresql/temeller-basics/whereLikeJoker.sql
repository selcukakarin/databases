/* 
	LIKE operatörü & JOKER Karakteri
	
	Syntax
	
		SELECT column1,column2
		FROM tableName
		WHERE column LIKE pattern;
*/

SELECT
	first_name,
	last_name
FROM employees
WHERE first_name LIKE 'Jo%';

SELECT
	first_name,
	last_name
FROM employees
WHERE first_name LIKE '%n';

SELECT
	first_name,
	last_name
FROM employees
WHERE first_name LIKE '_a%';

SELECT
	first_name,
	last_name
FROM employees
WHERE first_name LIKE '__v%';

SELECT
	first_name,
	last_name
FROM employees
WHERE first_name LIKE '___na';

SELECT
	first_name,
	last_name
FROM employees
WHERE first_name LIKE '%ancy';

