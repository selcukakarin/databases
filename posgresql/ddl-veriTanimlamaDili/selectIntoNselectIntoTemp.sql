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

-- Yöntem 1 : SELECT INTO ile ...

SELECT * from film;

SELECT film_id, title, rental_rate
INTO TABLE film_backup
FROM film
WHERE rating = 'R'
	AND rental_duration = 5
ORDER BY title;

SELECT * from film_backup;
DROP TABLE film_backup;

-- Yöntem 2 : SELECT INTO TEMP ile ...

-- Kısa metraj American dizilerinin listesini alalım. ( 50 dk )

SELECT * FROM film;

SELECT Count(*) FROM film WHERE length < 50;

SELECT film_id, title, length
INTO TEMP TABLE short_tvSeries
FROM film
WHERE length < 50
ORDER BY title;

SELECT * FROM short_tvSeries;

SELECT * FROM short_tvSeries WHERE film_id = 15;


