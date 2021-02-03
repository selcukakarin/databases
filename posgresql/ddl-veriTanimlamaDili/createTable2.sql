/*
	Veri Tanımlama Dili : DDL
	
	Veriler için gerekli olan nesnelerin tanımlanması için kullanılan komut kümesidir.
		CREATE, ALTER ve DROP komutlarını içerir.
	
	CREATE	: Veritabanında nesne oluşturmak için kullanılır.
	ALTER	: Mevcut bir nesnenin yapısını değiştirmek için kullanılır.
	DROP	: Bir nesneyi silmek için kullanılır.
*/

-- CREATE TABLE
CREATE TABLE Companies(
	ID		INT,
	Name	TEXT,
	Age		INT,
	Address	CHAR(50),
	Price	REAL
);

SELECT * FROM Companies;

CREATE TABLE Departments(
	ID			INT,
	DeptName	CHAR(50),
	Description	CHAR(200)
);

SELECT * FROM Departments;

CREATE TABLE Employees(
	ID					INTEGER,
	EmpName				CHARACTER VARYING(256),
	BirthDate			DATE,
	IsCurrentEmployee	BIT(1)
);

SELECT * FROM Employees;

CREATE TABLE Customers(
	Name				CHARACTER VARYING(256),
	BirthDate			DATE,
	ZipCode				CHARACTER VARYING(10)
);

SELECT * FROM Customers;




