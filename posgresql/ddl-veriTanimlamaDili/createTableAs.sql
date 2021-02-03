/*
	Veri Tanımlama Dili : DDL
	
	Veriler için gerekli olan nesnelerin tanımlanması için kullanılan komut kümesidir.
		CREATE, ALTER ve DROP komutlarını içerir.
	
	CREATE	: Veritabanında nesne oluşturmak için kullanılır.
	ALTER	: Mevcut bir nesnenin yapısını değiştirmek için kullanılır.
	DROP	: Bir nesneyi silmek için kullanılır.
*/

/*
	CREATE TABLE ... AS ile tablo oluşturmak
	Bir tablonun yapısını (verileriyle birlikte ya da değil) kopyalamak için kullanılır.
*/

SELECT * FROM Countries;

CREATE TABLE backup1_countries AS (SELECT * FROM Countries) WITH NO DATA;

SELECT * FROM backup1_countries;

CREATE TABLE backup2_countries AS (SELECT * FROM Countries);

SELECT * FROM backup2_countries;

CREATE TABLE backup3_countries AS SELECT * FROM Countries;

SELECT * FROM backup3_countries;







