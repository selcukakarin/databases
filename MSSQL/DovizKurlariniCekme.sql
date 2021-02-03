--Türkiye Cumhuriyeti merkez bankasýnýn döviz kurlarýný çeken script
declare @url as varchar(8000)
set @url='http://tcmb.gov.tr/kurlar/today.xml'
declare @obj as int
declare @result as int

exec @result=sp_OACreate 'MSXML2.XMLHttp',@obj out
exec @result=sp_OAMethod @obj,'open',null,'GET',@url,false

exec @result=sp_OAMethod @obj,send,null,''
exec @result=sp_OAGetProperty @obj,'responseXML.xml'
--Türkiye Cumhuriyeti merkez bankasýnýn döviz kurlarýný çeken script

sp_configure 'show advanced options',1
reconfigure with override

sp_configure 'Ole Automation Procedures',1
reconfigure with override


--Türkiye Cumhuriyeti merkez bankasýnýn döviz kurlarýný kolon þeklinde çeken script
declare @url as varchar(8000)
set @url='http://tcmb.gov.tr/kurlar/today.xml'
declare @obj as int
declare @result as int

exec @result=sp_OACreate 'MSXML2.XMLHttp',@obj out
exec @result=sp_OAMethod @obj,'open',null,'GET',@url,false

exec @result=sp_OAMethod @obj,send,null,''
create table #XML (STRXML varchar(max))
insert into #XML(STRXML) exec @result=sp_OAGetProperty @obj,'responseXML.xml'

--select * from #XML

declare @XML as xml
select @XML=STRXML from #XML
select @XML

drop table #XML

declare @HDOC as int
exec sp_xml_preparedocument @HDOC output,@XML 

select * from OPENXML(@HDOC,'Tarih_Date/Currency')
with
(Unit varchar(50) 'Unit',
Isim varchar(100) 'Isim',
CurrencyName varchar(100) 'CurrencyName',
ForexBuying float 'ForexBuying',
ForexSelling float 'ForexSelling',
BanknoteBuying float 'BanknoteBuying',
BanknoteSelling float 'BanknoteSelling')

--Türkiye Cumhuriyeti merkez bankasýnýn döviz kurlarýný kolon þeklinde çeken script


--Türkiye Cumhuriyeti merkez bankasýnýn döviz kurlarýný tabloya aktaran script
--create table DOVIZKURLARI(DATE_ date,UNIT varchar(50),ISIM varchar(100),CURRENCYNAME varchar(100),FOREXBUYING float,FOREXSELLING float,
--BANKNOTEBUYING float,BANKNOTESELLING float)


create proc DOVIZKURLARI_AKTAR
as
delete from DOVIZKURLARI where DATE_=CONVERT(DATE,GETDATE())
declare @url as varchar(8000)
set @url='http://tcmb.gov.tr/kurlar/today.xml'
declare @obj as int
declare @result as int

exec @result=sp_OACreate 'MSXML2.XMLHttp',@obj out
exec @result=sp_OAMethod @obj,'open',null,'GET',@url,false

exec @result=sp_OAMethod @obj,send,null,''
create table #XML (STRXML varchar(max))
insert into #XML(STRXML) exec @result=sp_OAGetProperty @obj,'responseXML.xml'

--select * from #XML

declare @XML as xml
select @XML=STRXML from #XML


drop table #XML

declare @HDOC as int
exec sp_xml_preparedocument @HDOC output,@XML 

insert into DOVIZKURLARI (DATE_,UNIT,ISIM,CURRENCYNAME,FOREXBUYING,FOREXSELLING,BANKNOTEBUYING,BANKNOTESELLING)
select CONVERT(DATE,GETDATE()) as DATE_,* from OPENXML(@HDOC,'Tarih_Date/Currency')
with
(Unit varchar(50) 'Unit',	
Isim varchar(100) 'Isim',
CurrencyName varchar(100) 'CurrencyName',
ForexBuying float 'ForexBuying',
ForexSelling float 'ForexSelling',
BanknoteBuying float 'BanknoteBuying',
BanknoteSelling float 'BanknoteSelling')

select * from DOVIZKURLARI
--Türkiye Cumhuriyeti merkez bankasýnýn döviz kurlarýný tabloya aktaran script