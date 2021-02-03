/*
	Verileri işlemek için kullanılan SQL sorgular bütününe denir.
	SELECT,	INSERT, UPDATE ve DELETE sorgularını içerir.
	İngilizce karşılığı Data Manipulation Language olduğu için kısaca DML olarak isimlendirilir.
	
	Temel Açıklamalar
		SELECT	:	Veri seçme / çekme amacıyla kullanılır
		INSERT	:	Veri ekleme amacıyla kullanılır.
		UPDATE	:	Veri güncelleme amacıyla kullanılır.
		DELETE	:	Veri silme amacıyla kullanılır.
	
	Veri İşleme Dili : DELETE
	
	Söz dizimi:
	
	DELETE FROM tableName;
	
	DELETE FROM tableName
	WHERE columnName = value;
*/

SELECT * FROM Users;

DELETE FROM Users;

DELETE FROM Users WHERE id = 5;

