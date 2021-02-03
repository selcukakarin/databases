drop table RAPOR_SATISLAR

select * into RAPOR_SATISLAR from VM_SATISLAR

truncate table RAPOR_SATISLAR

select * from VM_SATISLAR


select * from RAPOR_SATISLAR

select datepart(month,TARIH) as AY,sum(TUTAR) as TOPLAMTUTAR from RAPOR_SATISLAR
group by datepart(month,TARIH)

select * from dbo.sysschedules -- msdb seçili iken
select * from sysjobs -- msdb seçili iken