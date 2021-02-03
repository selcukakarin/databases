/*
	Karşılaştırma Operatörleri
	
	Liste:
		=		İki operandın da eşit olup olmadığını kontrol eder. Eşit ise TRUE döner.											(a = b)
		!=		İki operandın da eşit olup olmadığını kontrol eder. Eğer EŞİT DEĞİLSE TRUE döner.									(a != b)
		<>		İki operandında eşit olup olmadığını kontrol eder. Eğer EŞİT DEĞİLSE TRUE döner.									(a <> b)
		>		Sol operandın sağ operand'dan büyük olup olmadığını kontrol eder. Eğer büyük ise TRUE döner.						(a > b)
		<		Sağ operandın sol operand'dan büyük olup olmadığını kontrol eder. Eğer büyük ise TRUE döner.						(a < b)
		>=		Sol operandın sağ operand'dan büyük ya da eşit olup olmadığını kontrol eder. Eğer büyük ya da eşit ise TRUE döner.	(a >= b)
		<=		Sağ operandın sol operand'dan büyük ya da eşit olup olmadığını kontrol eder. Eğer büyük ya da eşit ise TRUE döner.	(a <= b)
*/

SELECT * from payment WHERE amount > 9.99;

SELECT * from payment WHERE amount = 9.99;

SELECT * from payment WHERE amount != 9.99;

SELECT * from payment WHERE amount <> 9.99;

SELECT * from payment WHERE amount >= 9.99;

SELECT * from payment WHERE amount <= 9.99;