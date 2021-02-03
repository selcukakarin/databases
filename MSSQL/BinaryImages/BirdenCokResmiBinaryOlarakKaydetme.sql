XP_CMDSHELL 'dir /B C:\images2\items\*.jpg'

sp_configure 'show advanced options',1
reconfigure with override

--XP_CMDSHELL özelliðini açma komutu
sp_configure 'xp_cmdshell',1
reconfigure with override

create table #FILES (OUTPUT_ varchar(100))

XP_CMDSHELL 'dir /B C:\images2\items\*.jpg'
insert into #FILES exec  XP_CMDSHELL 'dir /B C:\images2\items\*.jpg'

select * from #FILES2

--bir jpg datasýný binary olarak okuyan komut
select * from OPENROWSET (BULK 'C:\images2\items\100019_big.jpg',SINGLE_BLOB) T

--create table #FILES2(FILENAME_ varchar(100),IMG varbinary(max))
--drop table #FILES2

--#FILES2 tablosuna filename ve resmin binary kodunu giren kod
insert into #FILES2(FILENAME_,IMG)
select '100019_big.jpg',BULKCOLUMN from OPENROWSET (BULK 'C:\images2\items\100019_big.jpg',SINGLE_BLOB) T

update WEBITEMS set BIGIMAGE=(select IMG from #FILES2 where FILENAME_=WEBITEMS.IMAGEURLBIG)

select * from WEBITEMS where IMAGEURLBIG='100019_big.jpg'

------ dosyadaki verileri binary veritabanýna aktarma
truncate table #FILES2

declare @FILENAME as varchar(100)
declare crs cursor for select * from  #FILES
open crs
fetch next from  crs into @FILENAME
while @@FETCH_STATUS=0
begin 
	declare @SQL as nvarchar(max)
	set @SQL='insert into #FILES2 '
	set @SQL=@SQL+'select '''+@FILENAME+''',BULKCOLUMN from OPENROWSET (BULK ''C:\images2\items\'+@FILENAME+''',SINGLE_BLOB) T'
	exec sp_executesql @SQL
fetch next from  crs into @FILENAME
end
close crs
deallocate crs

select * from #FILES2


update WEBITEMS set SMALLIMAGE=(select IMG from #FILES2 where FILENAME_=WEBITEMS.IMAGEURL)

select * from WEBITEMS 

drop table #FILES

drop table #FILES2

------ dosyadaki verileri binary veritabanýna aktarma


