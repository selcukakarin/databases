create procedure SP_SATISLAR
as
 select 

	 ITM.CODE MALZEMEKODU,ITM.NAME MALZEMEADI,ITM.KEYWORD1 AS MARKA,ITM.KEYWORD2 AS KATEGORI1,ITM.KEYWORD3 AS KATEGORI2,
	 STL.DATE_ TARIH,STL.AMOUNT MIKTAR,STL.PRICE FIYAT,STL.LINENET TUTAR,
	 STF.BRANCH SUBENO,D.NAME AS SUBEADI

	 from LG_217_ITEMS ITM

	 LEFT JOIN LG_217_01_STLINE STL ON STL.STOCKREF=ITM.LOGICALREF
	 LEFT JOIN LG_217_01_STFICHE STF ON STF.LOGICALREF=STL.STFICHEREF
	 LEFT JOIN L_CAPIDIV D ON D.NR=STF.BRANCH AND D.FIRMNR=217

	 WHERE STL.TRCODE=7
 
 SP_SATISLAR

 select * from VM_SATISLAR where MALZEMEKODU='8583'

 alter procedure SP_SATISLAR
 @ITEMCODE as varchar(100)='%',
 @BEGDATE as date='20170101',
 @ENDDATE as date='20171231'
as
 select 

	 ITM.CODE MALZEMEKODU,ITM.NAME MALZEMEADI,ITM.KEYWORD1 AS MARKA,ITM.KEYWORD2 AS KATEGORI1,ITM.KEYWORD3 AS KATEGORI2,
	 STL.DATE_ TARIH,STL.AMOUNT MIKTAR,STL.PRICE FIYAT,STL.LINENET TUTAR,
	 STF.BRANCH SUBENO,D.NAME AS SUBEADI

	 from LG_217_ITEMS ITM

	 LEFT JOIN LG_217_01_STLINE STL ON STL.STOCKREF=ITM.LOGICALREF
	 LEFT JOIN LG_217_01_STFICHE STF ON STF.LOGICALREF=STL.STFICHEREF
	 LEFT JOIN L_CAPIDIV D ON D.NR=STF.BRANCH AND D.FIRMNR=217

	 WHERE STL.TRCODE=7
	 and ITM.CODE like @ITEMCODE and STL.DATE_ between @BEGDATE and @ENDDATE

SP_SATISLAR '8583','20170501','20170515'

SP_SATISLAR @ITEMCODE='8583',@BEGDATE='20170501',@ENDDATE='20170515'

create procedure SP_SATISLAR_MALZEME
@ITEMCODE as varchar(100)='%',
 @BEGDATE as date='20170101',
 @ENDDATE as date='20171231'
as
 select 

	 ITM.CODE MALZEMEKODU,ITM.NAME MALZEMEADI,ITM.KEYWORD1 AS MARKA,ITM.KEYWORD2 AS KATEGORI1,ITM.KEYWORD3 AS KATEGORI2,
	 sum(STL.LINENET) as TOPLAMSATIS

	 from LG_217_ITEMS ITM

	 LEFT JOIN LG_217_01_STLINE STL ON STL.STOCKREF=ITM.LOGICALREF
	 LEFT JOIN LG_217_01_STFICHE STF ON STF.LOGICALREF=STL.STFICHEREF
	 LEFT JOIN L_CAPIDIV D ON D.NR=STF.BRANCH AND D.FIRMNR=217

	 WHERE STL.TRCODE=7
	 group by
	 ITM.CODE ,ITM.NAME ,ITM.KEYWORD1  ,ITM.KEYWORD2  ,ITM.KEYWORD3  

create procedure SP_SATISLAR_SUBE
	 @ITEMCODE as varchar(100)='%',
	 @BEGDATE as date='20170101',
	 @ENDDATE as date='20171231'
	 as
	 select 
	 D.NAME as SUBEADI,
	 sum(STL.LINENET) as TOPLAMSATIS

	 from LG_217_ITEMS ITM

	 LEFT JOIN LG_217_01_STLINE STL ON STL.STOCKREF=ITM.LOGICALREF
	 LEFT JOIN LG_217_01_STFICHE STF ON STF.LOGICALREF=STL.STFICHEREF
	 LEFT JOIN L_CAPIDIV D ON D.NR=STF.BRANCH AND D.FIRMNR=217

	 WHERE STL.TRCODE=7
	 group by
	 D.NAME

create procedure SP_SATISLAR_TARIH
	 @ITEMCODE as varchar(100)='%',
	 @BEGDATE as date='20170101',
	 @ENDDATE as date='20171231'
	 as
	 select 
	 STL.DATE_,
	 sum(STL.LINENET) as TOPLAMSATIS

	 from LG_217_ITEMS ITM

	 LEFT JOIN LG_217_01_STLINE STL ON STL.STOCKREF=ITM.LOGICALREF
	 LEFT JOIN LG_217_01_STFICHE STF ON STF.LOGICALREF=STL.STFICHEREF
	 LEFT JOIN L_CAPIDIV D ON D.NR=STF.BRANCH AND D.FIRMNR=217

	 WHERE STL.TRCODE=7
	 group by
	 STL.DATE_

	 exec SP_SATISLAR_MALZEME '%','20170101','20171231'

	 exec SP_SATISLAR_SUBE '%','20170101','20171231'

	 exec SP_SATISLAR_TARIH '%','20170101','20171231'

USE [TIGER2]
GO
CREATE NONCLUSTERED INDEX IX2
ON [dbo].[LG_217_01_STLINE] ([TRCODE])
INCLUDE ([STOCKREF],[DATE_],[LINENET])
GO

USE [TIGER2]
GO
CREATE NONCLUSTERED INDEX IX3
ON [dbo].[LG_217_01_STLINE] ([TRCODE])
INCLUDE ([STOCKREF],[STFICHEREF],[LINENET])
GO

create proc SP_SATISLAR_RAPOR 
	@ITEMCODE as varchar(100)='%',
	 @BEGDATE as date='20170101',
	 @ENDDATE as date='20171231'
	 as

	 exec SP_SATISLAR_MALZEME @ITEMCODE,@BEGDATE,@ENDDATE

	 exec SP_SATISLAR_SUBE @ITEMCODE,@BEGDATE,@ENDDATE

	 exec SP_SATISLAR_TARIH @ITEMCODE,@BEGDATE,@ENDDATE



	  SP_SATISLAR_RAPOR '170'

create proc GET_BARCODE_INFO '10004'
@ITEMCODE as varchar(100)
as
select * from TIGER2.DBO.LG_217_ITEMS where code=@ITEMCODE

 GET_BARCODE_INFO '10004'

create proc GET_BARCODE_INFO 
@ITEMCODE as varchar(100)
as
select * from TIGER2.DBO.LG_217_ITEMS where code=@ITEMCODE
if @@ROWCOUNT=0
begin

raiserror('�R�N BULUNAMADI.',16,1)

end

 GET_BARCODE_INFO '10004'

 -- stored procedurlerin ka� ke� �al��t��� gibi bilgileri �eken script
 select d.object_id, d.database_id, OBJECT_NAME(object_id,database_id) 'proc name',
	d.cached_time, d.last_execution_time, d.total_elapsed_time,
	d.total_elapsed_time/d.execution_count as [avg_elapsed_time],
	d.last_elapsed_time, d.execution_count
from sys.dm_exec_procedure_stats as d
order by [total_worker_time] desc;