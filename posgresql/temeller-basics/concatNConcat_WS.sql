/*
	Metin Birleştirme Operatörü
*/

SELECT 'Selçuk' || ' Akarın' AS fullName;

SELECT 'Selçuk' || ' ' || 'Akarın' AS fullName;

--SELECT 'Maaş' || ' ' || 500 AS data; #Hatalı - Error ( cast gerekiyor )

SELECT 'ABC' || NULL AS result;

/*
	CONCAT Fonksiyonu
*/

SELECT CONCAT('Çağlar',' Söyüncü',' 4');

SELECT 
	CONCAT(first_name, ' ' , last_name) AS full_name
FROM employees;

SELECT 
	CONCAT(first_name, ' ' , last_name) AS "full name"
FROM employees;

SELECT
	CONCAT('NULL Veri Birleştir ', NULL) AS data;		-- NULL Koruması vardır

SELECT
	CONCAT('NULL Veri Birleştir ', 55) AS data;		-- int to String işlemi yapar

SELECT
	first_name,
	CONCAT(
		'Adınız ',
		LENGTH(first_name),
		' karakter içeriyor.') AS Uzunluk
FROM employees;

-- CONCAT_WS fonksiyonu

SELECT
	CONCAT_WS(', ',last_name,first_name) AS fullName
FROM employees
ORDER BY last_name;

SELECT
	CONCAT_WS(' - ',last_name,first_name) AS fullName
FROM employees
ORDER BY last_name;

SELECT
	CONCAT_WS(' *- ',last_name,first_name) AS fullName
FROM employees
ORDER BY last_name;

