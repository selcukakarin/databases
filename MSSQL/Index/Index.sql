 -- Veri ekleme fonksiyonu
DECLARE @I AS INT=0
WHILE @I<10000
BEGIN
DECLARE @NAME AS VARCHAR(100)
DECLARE @GENDER AS VARCHAR(1)
DECLARE @SURNAME AS VARCHAR(100)
DECLARE @CITY AS VARCHAR(100)
DECLARE @TOWN AS VARCHAR(100)
DECLARE @BIRTHDATE AS DATETIME

DECLARE @RAND AS INT

SET @RAND= RAND()*609 
SELECT @NAME=NAME,@GENDER=GENDER FROM NAMES WHERE ID=@RAND 
 


SET @RAND= RAND()*16000 
SELECT @SURNAME=SURNAME FROM SURNAMES WHERE ID=@RAND 

SET @RAND= RAND()*900 
SELECT @CITY=CITY,@TOWN=TOWN  FROM CITY_DISTRICT WHERE ID=@RAND 



SET @RAND=RAND()*365*80
SET @BIRTHDATE=GETDATE()-@RAND 
 
INSERT INTO CUSTOMERS ( NAME, SURNAME, BIRTHDATE, CITY, TOWN,GENDER)
VALUES ( @NAME, @SURNAME, @BIRTHDATE, @CITY, @TOWN,@GENDER)

SET @I=@I+1
END

SELECT * FROM CUSTOMERS

select NAME,count(NAME) from CUSTOMERS group by NAME order by count(NAME)

select NAME,count(NAME) from CUSTOMERS group by NAME order by NAME

select NAME,count(NAME) from CUSTOMERS group by NAME order by 1

select NAME,count(NAME) from CUSTOMERS group by NAME order by 2

select * from CUSTOMERS where  NAME='Remzi'

delete from CUSTOMERS where  NAME='Remzi' AND ID<>6578

Select * from CUSTOMERS

-- Tabloyla ilgili �zet bilgiyi getiren kod Trigger boyutlar� tablo boyutlar� vs.
SP_SPACEUSED CUSTOMERS

USE [SampleData]

GO

SET ANSI_PADDING ON


GO

CREATE NONCLUSTERED INDEX [IX1] ON [dbo].[CUSTOMERS]
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO

select * from CUSTOMERS where NAME='Abdulsamet'

