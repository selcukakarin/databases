
-- database yeniden boyutlandırma
USE [TIGER2]
GO
DBCC SHRINKDATABASE(N'TIGER2' )
GO


--dosya yeniden boyutlandırma
USE [TIGER2]
GO
DBCC SHRINKFILE (N'TIGER2_log' , 0)
GO
