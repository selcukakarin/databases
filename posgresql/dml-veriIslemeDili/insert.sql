/*
	Verileri işlemek için kullanılan SQL sorgular bütününe denir.
	SELECT,	INSERT, UPDATE ve DELETE sorgularını içerir.
	İngilizce karşılığı Data Manipulation Language olduğu için kısaca DML olarak isimlendirilir.
	
	Temel Açıklamalar
		SELECT	:	Veri seçme / çekme amacıyla kullanılır
		INSERT	:	Veri ekleme amacıyla kullanılır.
		UPDATE	:	Veri güncelleme amacıyla kullanılır.
		DELETE	:	Veri silme amacıyla kullanılır.
	
	Veri İşleme Dili : INSERT
	
	Syntax
	
	INSERT INTO tableName(column1,column2)
	VALUES(value1,value2);
*/

DROP TABLE IF EXISTS users;

CREATE TABLE Users(
	id 		INT,
	name	VARCHAR(20)
);

-- Single Insert

INSERT INTO Users(id,name) VALUES(5,'Ali Veli');

SELECT * FROM Users;

INSERT INTO Users(id,name) VALUES(1,'Test');

SELECT * FROM Users;

INSERT INTO Users VALUES(8,'Mustafa');

SELECT * FROM Users;

-- Multiple Insert

INSERT INTO Users(id,name)
VALUES(10,'Selçuk'),
		(11,'Pascal'),
		(12,'İlhan');
		
SELECT * FROM Users;


