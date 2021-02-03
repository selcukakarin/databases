/*
	NULL veri filtrelemek
*/
SELECT * FROM employees WHERE manager_id IS NULL;

SELECT * FROM employees WHERE manager_id IS NOT NULL;
