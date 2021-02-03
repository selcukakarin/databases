create function DBO.TOPLA(@SAYI1 as integer,@SAYI2 as integer)
returns integer
as
begin
declare @SONUC as int
set @SONUC=@SAYI1+@SAYI2
return @SONUC
end

select DBO.TOPLA(5,6) 

select * from VM_SATISLAR

select datepart(month,TARIH) as AYNUMARASI,* from VM_SATISLAR

select 
case
when datepart(month,TARIH)=1 then 'ocak'
when datepart(month,TARIH)=2 then 'şubat'
when datepart(month,TARIH)=3 then 'mart'
when datepart(month,TARIH)=4 then 'nisan'
when datepart(month,TARIH)=5 then 'mayıs'
when datepart(month,TARIH)=6 then 'haziran'
when datepart(month,TARIH)=7 then 'temmuz'
when datepart(month,TARIH)=8 then 'ağustos'
when datepart(month,TARIH)=9 then 'eylül'
when datepart(month,TARIH)=10 then 'ekim'
when datepart(month,TARIH)=11 then 'kasım'
when datepart(month,TARIH)=12 then 'aralık'
end as AY,
* from VM_SATISLAR

alter function DBO.AYADI(@TARIH as datetime)
returns varchar(20)
as
begin
declare @AYADI as varchar(20)
if datepart(month,@TARIH)=1 set @AYADI= '01.ocak'
if datepart(month,@TARIH)=2 set @AYADI= '02.şubat'
if datepart(month,@TARIH)=3 set @AYADI= '03.mart'
if datepart(month,@TARIH)=4 set @AYADI= '04.nisan'
if datepart(month,@TARIH)=5 set @AYADI= '05.mayıs'
if datepart(month,@TARIH)=6 set @AYADI= '06.haziran'
if datepart(month,@TARIH)=7 set @AYADI= '07.temmuz'
if datepart(month,@TARIH)=8 set @AYADI= '08.ağustos'
if datepart(month,@TARIH)=9 set @AYADI= '09.eylül'
if datepart(month,@TARIH)=10 set @AYADI= '10.ekim'
if datepart(month,@TARIH)=11 set @AYADI= '11.kasım'
if datepart(month,@TARIH)=12 set @AYADI= '12.aralık'
return @AYADI
end

select DBO.AYADI(GETDATE())

select DBO.AYADI(TARIH),
* from VM_SATISLAR
order by 1

select 
	DBO.AYADI(TARIH),SUM(TUTAR) from VM_SATISLAR
	group by DBO.AYADI(TARIH)


select top 10000

(select SUM(TUTAR) from VM_SATISLAR where DBO.AYADI(TARIH)=DBO.AYADI(S.TARIH) AND MALZEMEKODU=S.MALZEMEKODU) AS AYLIKSATIS,
(select SUM(TUTAR)/COUNT(*) from VM_SATISLAR where DBO.AYADI(TARIH)=DBO.AYADI(S.TARIH) AND MALZEMEKODU=S.MALZEMEKODU) AS AYLIKSATISORTALAMA,

DBO.AYADI(TARIH)AS AYADI,*
from VM_SATISLAR S
where MALZEMEKODU='8583'
order by 3


create function DBO.MALZEME_AYLIKSATIS(@MALZEMEKODU as varchar(20),@AYNO as integer)
returns float
as
begin

declare @SONUC as float
select  @SONUC=(SELECT SUM(TUTAR) from VM_SATISLAR where MALZEMEKODU=@MALZEMEKODU and DATEPART(month,TARIH)=@AYNO)
return @SONUC

end


select DBO.MALZEME_AYLIKSATIS('8583',3)


select top 10000

DBO.MALZEME_AYLIKSATIS(MALZEMEKODU,DATEPART(MONTH,TARIH)) as AYLIKSATIS,*

from VM_SATISLAR S
where MALZEMEKODU='8583'
order by 3


select top 10000

DBO.MALZEME_AYLIKSATIS(MALZEMEKODU,DATEPART(MONTH,TARIH)),
TUTAR/DBO.MALZEME_AYLIKSATIS(MALZEMEKODU,DATEPART(MONTH,TARIH))*100 as YUZDE,
DBO.AYADI(TARIH) as AYADI,TUTAR,
*

from VM_SATISLAR S
where MALZEMEKODU like '8514%'
order by 3


