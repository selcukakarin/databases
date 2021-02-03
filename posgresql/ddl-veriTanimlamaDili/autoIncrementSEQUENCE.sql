/*
	Veri Tanımlama Dili : DDL
	
	Veriler için gerekli olan nesnelerin tanımlanması için kullanılan komut kümesidir.
		CREATE, ALTER ve DROP komutlarını içerir.
	
	CREATE	: Veritabanında nesne oluşturmak için kullanılır.
	ALTER	: Mevcut bir nesnenin yapısını değiştirmek için kullanılır.
	DROP	: Bir nesneyi silmek için kullanılır.
*/
/*
	SEQUENCE ile otomatik artan sütun oluşturmak
*/

CREATE SEQUENCE demoTable_id_seq;

CREATE TABLE demoTable(
	-- Oluşturulacak sıradaki veriyi id'ye default olarak ata
	ID		INTEGER DEFAULT nextval('demoTable_id_seq'),
	NAME	TEXT
);

DROP TABLE demoTable;

INSERT INTO demoTable(Name) VALUES('Ali');

SELECT * FROM demoTable;

INSERT INTO demoTable(Name) VALUES('Veli');

SELECT * FROM demoTable;






