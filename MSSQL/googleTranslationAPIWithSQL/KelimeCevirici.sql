-- DICTIONARY veritabanýndaki WORDS tablosunun EN kolonunu çevirip ilgili olan TR ve DE kolonlarýna atan script
update DICTIONARY.DBO.WORDS set TR=DBO.TRANSLATE(EN,'EN','TR'),
DE=DBO.TRANSLATE(EN,'EN','DE')
where ID<=100

-- DICTIONARY veritabanýndaki WORDS tablosunun EN kolonunu çevirip ilgili olan TR ve DE kolonlarýna atan script

SELECT [ID]
      ,[EN]
      ,[TR]
      ,[DE]
  FROM [DICTIONARY].[dbo].[WORDS]
  where ID<=100