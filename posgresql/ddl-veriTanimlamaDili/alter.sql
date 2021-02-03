/*
	Veri Tanımlama Dili : DDL
	
	Veriler için gerekli olan nesnelerin tanımlanması için kullanılan komut kümesidir.
		CREATE, ALTER ve DROP komutlarını içerir.
	
	CREATE	: Veritabanında nesne oluşturmak için kullanılır.
	ALTER	: Mevcut bir nesnenin yapısını değiştirmek için kullanılır.
	DROP	: Bir nesneyi silmek için kullanılır.
*/

CREATE TABLE Users (
	ID		INT
);

ALTER TABLE Users ADD gender CHAR(1);

SELECT * FROM Users;

ALTER TABLE Users DROP gender;

SELECT * FROM Users;

ALTER TABLE Users RENAME TO People;

SELECT * FROM People;

ALTER TABLE "users" ADD COLUMN "isActive" BIT(1);

-- Örnek

CREATE TABLE link(
	id		SERIAL,
	title	VARCHAR(500),
	url		VARCHAR(1024)
);

ALTER TABLE link ADD COLUMN active BOOLEAN;

SELECT * FROM link;

ALTER TABLE link RENAME COLUMN title TO link_title;

SELECT * FROM link;

INSERT INTO link(link_title,url) VALUES('GOOGLE','http://www.google.com.tr');

ALTER TABLE link RENAME TO urls;

SELECT * FROM urls;






