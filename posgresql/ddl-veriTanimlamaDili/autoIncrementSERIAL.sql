/*
	Veri Tanımlama Dili : DDL
	
	Veriler için gerekli olan nesnelerin tanımlanması için kullanılan komut kümesidir.
		CREATE, ALTER ve DROP komutlarını içerir.
	
	CREATE	: Veritabanında nesne oluşturmak için kullanılır.
	ALTER	: Mevcut bir nesnenin yapısını değiştirmek için kullanılır.
	DROP	: Bir nesneyi silmek için kullanılır.
*/

/*
	SERIAL : Otomatik artan sütunlu tablo oluşturmak
	
	SERIAL tanimlaması bir sütun üzerinde indeks oluşturmaz ya da o sütunu PRIMARY KEY yapmaz.
	Bunun için ayrı ve basit bir tanımlama daha gereklidir.
	
	Name		Storage Size		Range
	SMALLSERIAL		2 bytes		1 to 32,767
	SERIAL			4 bytes		1 to 2,147,483,647
	BIGSERIAL		8 bytes		1 to 9,223,372,036,854,775,807
	
	Syntax
		
		CREATE TABLE tableName(
			ID		SERIAL
		)
*/

CREATE TABLE Kullanicilar(
	ID 		SERIAL,
	Name	VARCHAR
);

INSERT INTO Kullanicilar(Name) VALUES('Selçuk');

SELECT * FROM Kullanicilar;

INSERT INTO Kullanicilar(Name) VALUES('Ali');

SELECT * FROM Kullanicilar;

INSERT INTO Kullanicilar(ID,Name) VALUES(DEFAULT,'Tyson');

SELECT * FROM Kullanicilar;

-- id'ye verilmiş olan en son değer
SELECT currval(pg_get_serial_sequence('Kullanicilar','id'));

INSERT INTO Kullanicilar(ID,Name) VALUES(DEFAULT,'Tyson')
RETURNING id;




