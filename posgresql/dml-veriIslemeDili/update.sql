/*
	Verileri işlemek için kullanılan SQL sorgular bütününe denir.
	SELECT,	INSERT, UPDATE ve DELETE sorgularını içerir.
	İngilizce karşılığı Data Manipulation Language olduğu için kısaca DML olarak isimlendirilir.
	
	Temel Açıklamalar
		SELECT	:	Veri seçme / çekme amacıyla kullanılır
		INSERT	:	Veri ekleme amacıyla kullanılır.
		UPDATE	:	Veri güncelleme amacıyla kullanılır.
		DELETE	:	Veri silme amacıyla kullanılır.
	
	Veri İşleme Dili : UPDATE
	
	Syntax
	
	UPDATE tableName
	SET columnName = value ;
	
	UPDATE tableName
	SET columnName = value
	WHERE <condition>;
*/

SELECT * FROM users;

UPDATE Users
SET name = 'Veli Ali'
WHERE id = 5;

SELECT * FROM users
ORDER BY id;

