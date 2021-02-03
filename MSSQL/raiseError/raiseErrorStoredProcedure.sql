alter proc GET_BARCODE_INFO 
@ITEMCODE as varchar(100)
as
select * from TIGER2.dbo.LG_217_ITEMS where code=@ITEMCODE
if @@ROWCOUNT=0
begin
	raiserror('ÜRÜN BULUNAMADI!',16,1)
end