--indexleri ve özelliklerini getiren kod
select I.*,* from sys.tables T inner join sys.indexes I on I.object_id=T.object_id 
where T.name='CUSTOMERS'

--indexlerin tablo isimlerini, indexlerin isimlerini ve indexlerin fragmantation deðerlerini bulan kod
SELECT 
T.NAME AS TABLENAME,
I.name AS INDEXNAME,
(SELECT avg_fragmentation_in_percent FROM sys.dm_db_index_physical_stats(DB_ID(),T.object_id,I.index_id,0,NULL)) AS FRAGMANTATION

 FROM sys.tables T
INNER JOIN sys.indexes I ON I.object_id=T.object_id

WHERE T.name='CUSTOMERS'


 