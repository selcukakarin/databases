
create function DBO.SPLIT(@str as varchar(max),@delimiter as varchar(10))
returns @resulttable table(item varchar(max),idx int)
as
begin

declare @I as int=1

declare @pos as int=1

while @pos>=1
begin

set @pos=CHARINDEX(@delimiter,@str)

declare @item as varchar(max)
set @item=SUBSTRING(@str,0,@pos)

if @pos=0
	set @item=@str

set @str=SUBSTRING(@str,@pos+1,LEN(@str)-@pos)

insert into @resulttable(item,idx)

values(@item,@I)
set @I=@I+1

end

return

end

select * from DBO.SPLIT('OMER,AHMET,OSMAN,MEHMET',',') where idx=4
