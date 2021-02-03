-- Veritabanýndaki binary resimleri klasöre çekme scripti
declare @ID as int 
declare crs cursor for select ID from WEBITEMS where BIGIMAGE is not null and SMALLIMAGE is not null
open crs
fetch next from crs into @ID
while @@FETCH_STATUS=0
begin

		declare @FILENAME as varchar(100)
		declare @IMG as varbinary(max)
		select @FILENAME=IMAGEURLBIG,@IMG=BIGIMAGE  from WEBITEMS where ID=@ID
		declare @PATH as varchar(1000)='C:\images2\items2\'
		set @PATH=@PATH+@FILENAME
		declare @OBJECTTOKEN INT
		exec sp_OACreate 'ADODB.Stream',@OBJECTTOKEN output;
		exec sp_OASetProperty @OBJECTTOKEN, 'Type',1;
		exec sp_OAMethod @OBJECTTOKEN,'Open';
		exec sp_OAMethod @OBJECTTOKEN,'Write',null,@IMG;
		exec sp_OAMethod @OBJECTTOKEN,'SaveToFile',null,@PATH,2;
		exec sp_OAMethod @OBJECTTOKEN,'Close';
		exec sp_OADestroy @OBJECTTOKEN;

		--sp_configure 'Ole Automation Procedures',1
		--reconfigure with override

		select @FILENAME=IMAGEURL,@IMG=SMALLIMAGE  from WEBITEMS where ID=@ID
		set @PATH ='C:\images2\items2\'
		set @PATH=@PATH+@FILENAME
		exec sp_OACreate 'ADODB.Stream',@OBJECTTOKEN output;
		exec sp_OASetProperty @OBJECTTOKEN, 'Type',1;
		exec sp_OAMethod @OBJECTTOKEN,'Open';
		exec sp_OAMethod @OBJECTTOKEN,'Write',null,@IMG;
		exec sp_OAMethod @OBJECTTOKEN,'SaveToFile',null,@PATH,2;
		exec sp_OAMethod @OBJECTTOKEN,'Close';
		exec sp_OADestroy @OBJECTTOKEN;
fetch next from crs into @ID
end
close crs
deallocate crs

-- Veritabanýndaki binary resimleri klasöre çekme scripti