create FUNCTION [dbo].[TRANSLATE] (@SENTENCE AS nVARCHAR(MAX),@SOURCELANG AS VARCHAR(10),@DESTLANG AS VARCHAR(10))
RETURNS VARCHAR(MAX)
AS
BEGIN
 
DECLARE @RESULT AS VARCHAR(MAX)
DECLARE @JSON AS VARCHAR(MAX)
Declare @Object as Int;
Declare @ResponseText as Varchar(8000);
DECLARE @hResult int
DECLARE @source varchar(255), @desc varchar(255) 
declare @Body as varchar(8000) = 
'{
    "Subsystem": 1,
    "Exception": "",
    "Message": "'+@SENTENCE+'",
    "Time": "2014-06-09T11:16:35",
    "Attribute": { "Number of attempts": "0" }
}' 
Set @SENTENCE = REPLACE(@SENTENCE, '�','S')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 's')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'I')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'i')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'G')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'g')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'C')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'c')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'O')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'o')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'U')
Set @SENTENCE = REPLACE(@SENTENCE, '�', 'u')
DECLARE @URL AS VARCHAR(MAX)='https://translation.googleapis.com/language/translate/v2/?q='+@SENTENCE+'&source='+@sourcelang+'&target='+@destlang+'&key=<API-key>'
Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
EXEC sp_OAMethod @Object, 'open', NULL, 'GET', 
    @URL, 'false'
Exec sp_OAMethod @Object, 'setRequestHeader', null, 'Content-Type', 'application/json'

declare @len int
set @len = len(@body)
--EXEC sp_OAMethod @Object, 'setRequestHeader', null, 'Content-Length', @len
--Exec sp_OAMethod @Object, 'setRequestBody', null, 'Body', @body
EXEC sp_OAMethod @Object, 'send', null
Exec sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT

 


SELECT @JSON=StringValue FROM parseJSON(@ResponseText) WHERE NAME='translatedText'

RETURN  @JSON

END
