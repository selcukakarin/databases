-- DICTIONARY veritaban�ndaki WORDS tablosunun EN kolonunu �evirip ilgili olan TR ve DE kolonlar�na atan script
update DICTIONARY.DBO.WORDS set TR=DBO.TRANSLATE(EN,'EN','TR'),
DE=DBO.TRANSLATE(EN,'EN','DE')
where ID<=100

-- DICTIONARY veritaban�ndaki WORDS tablosunun EN kolonunu �evirip ilgili olan TR ve DE kolonlar�na atan script

SELECT [ID]
      ,[EN]
      ,[TR]
      ,[DE]
  FROM [DICTIONARY].[dbo].[WORDS]
  where ID<=100