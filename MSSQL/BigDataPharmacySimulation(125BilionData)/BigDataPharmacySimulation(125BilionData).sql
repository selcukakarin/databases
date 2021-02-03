--DRUGBARCODE tablosuna DRUG tablosundaki ilaçlar ile 1 milyon kayýt atan procedure
create proc GENERATE_QRCODE
as
declare @I as int=0
declare @DRUGCOUNT as int
select @DRUGCOUNT=COUNT(*) from DRUG
declare @QRCODE as uniqueidentifier
declare @DRUGID as int
declare @RAND as float

while @I<1000000
begin
set @QRCODE=NEWID()
set @RAND=RAND()
set @DRUGID=@RAND*@DRUGCOUNT
insert into DRUGBARCODE(QRCODE,DRUGID,CREATEDATE)
values (@QRCODE,@DRUGID,GETDATE())
set @I=@I+1
end
--select count(*) from DRUGBARCODE

-- DRUGBARCODE tablosuna 125 milyon kayýt giren script
declare @I as int=0
while @I<125
begin
insert into DRUGBARCODE(QRCODE,DRUGID,CREATEDATE)
select top 1000000 NEWID(),DRUGID,DATEADD(HOUR,1,CREATEDATE) from DRUGBARCODE
set @I=@I+1
end

--select max(ID) from DRUGBARCODE with(nolock)
select * from DRUGBARCODE where QRCODE='E5F5EC8D-CB32-4AFE-9AF2-69EE4FE5E20A'

insert into BARCODES (BARCODEID,QRCODE)
values(5078597,'E5F5EC8D-CB32-4AFE-9AF2-69EE4FE5E20A')

declare @I as int=0
while @I<100000
begin
declare @BARCODEID as bigint
declare @RAND as float
set @RAND=RAND()
set @BARCODEID=@RAND*100000000
insert into BARCODES (BARCODEID,QRCODE)
select ID,QRCODE from DRUGBARCODE where ID=@BARCODEID

set @I=@I+1
end

select * from BARCODES

select * from DRUGBARCODE where QRCODE='E90103F7-96D7-4CBF-98CE-D8A4D21E81C9'

create proc GETDRUGINFO @QRCODE as uniqueidentifier
as
begin
select D.*,B.* from DRUG D
inner join DRUGBARCODE B on D.ID=B.DRUGID
where QRCODE=@QRCODE
end

GETDRUGINFO 'E90103F7-96D7-4CBF-98CE-D8A4D21E81C9'

-- arama iþleminde çok hýzlandýran sql indexi 125 milyon satýr için yaklaþýk 50.000 kat hýz artýþý var.
USE [MEDICAL]
GO
CREATE NONCLUSTERED INDEX IX1
ON [dbo].[DRUGBARCODE] ([QRCODE])

GO

select m.Name
	,m.type_desc as 'FileType'
	,CEILING(num_of_bytes_read*1.0/(num_of_bytes_read*1.0+num_of_bytes_written*1.0)*100) as 'Read/Write %'
from sys.dm_io_virtual_file_stats(NULL,NULL) v
inner join sys.master_files m on m.database_id=v.database_id and  v.file_id=m.file_id


select * from BARCODES