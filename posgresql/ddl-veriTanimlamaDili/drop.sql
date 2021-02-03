/*
	Veri Tanımlama Dili : DDL
	
	Veriler için gerekli olan nesnelerin tanımlanması için kullanılan komut kümesidir.
		CREATE, ALTER ve DROP komutlarını içerir.
	
	CREATE	: Veritabanında nesne oluşturmak için kullanılır.
	ALTER	: Mevcut bir nesnenin yapısını değiştirmek için kullanılır.
	DROP	: Bir nesneyi silmek için kullanılır.
	
	Söz dizimi:
	
	DROP TABLE t1;
	DROP TABLE t1, t2;
	DROP TABLE [IF EXISTS] table_name [CASCADE | RESTRICT];
*/

DROP TABLE author;

DROP TABLE IF EXISTS author;

CREATE TABLE author (
	id 		INT,
	fname	VARCHAR(50),
	lname 	VARCHAR(50)
);

DROP TABLE IF EXISTS author;

DROP DATABASE demodb;

DROP DATABASE IF EXISTS demodb;




