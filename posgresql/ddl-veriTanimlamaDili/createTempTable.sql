/*
	Veri Tanımlama Dili : DDL
	
	Veriler için gerekli olan nesnelerin tanımlanması için kullanılan komut kümesidir.
		CREATE, ALTER ve DROP komutlarını içerir.
	
	CREATE	: Veritabanında nesne oluşturmak için kullanılır.
	ALTER	: Mevcut bir nesnenin yapısını değiştirmek için kullanılır.
	DROP	: Bir nesneyi silmek için kullanılır.
*/
/*
	Geçici tablo oluşturmak
*/

CREATE DATABASE demoDB;

CREATE TEMP TABLE demoTempTable1(
	id INT
);

SELECT * FROM demoTempTable1;

/*
	Aynı isimde geçici ve kalıcı bir tablo oluşturulabilir.
	Bu kullanım tavsiye edilmez ancak mümkündür.
	Geçici tablo silinene kadar kalıcı tabloya erişilemez.
*/

-- Kalıcı tablo
CREATE TABLE importantTable(id SERIAL,name VARCHAR);
-- Geçici tablo
CREATE TEMP TABLE importantTable(id SERIAL,name VARCHAR);

DROP TABLE importantTable;

INSERT INTO importantTable(id,name) VALUES (DEFAULT,'Selçuk')

SELECT * FROM importantTable;






