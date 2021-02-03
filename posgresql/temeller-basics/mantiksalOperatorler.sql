/*
	Mantıksal Operatörler
	
	Liste:
		AND		: Operandların TRUE değer üretmesi gerektiği durumlarda kullanılır.
		OR		: Operandların en az birinin TRUE değer üretmesi gerektiği durumlarda kullanılır.
		NOT		: Bir işlemin aksi durumunun TRUE olarak kabul edileceği durumlarda kullanılır.
					Negatif operatör olarak bilinir.
					Örn: NOT EXİSTS, NOT BETWEEN, NOT IN vb ...
*/

--- AND

SELECT * FROM employees
WHERE JOB_ID = 'IT_PROG' AND Salary >= 6000;

SELECT * FROM employees
WHERE JOB_ID = 'IT_PROG' AND Salary >= 6000 AND email = 'BERNST';

SELECT * FROM employees
WHERE employee_id = 5 AND employee_id = 104;		--- mantık hatası - logic error

--- OR

SELECT * FROM employees
WHERE employee_id = 5 OR employee_id = 104;

SELECT * FROM employees
WHERE employee_id = 5 OR employee_id = 104 OR employee_id = 105;

--- BETWEEN

SELECT * FROM employees
WHERE employee_id BETWEEN 105 AND 110;

SELECT * FROM employees
WHERE employee_id >= 105 AND employee_id < 110;

SELECT * FROM employees
WHERE employee_id NOT BETWEEN 105 AND 110;


