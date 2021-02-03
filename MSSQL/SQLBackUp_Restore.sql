ALTER DATABASE [TESTDB] SET  OFFLINE
ALTER DATABASE [TESTDB] SET  ONLINE


USE [master]
GO
CREATE DATABASE [TESTDB] ON 
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\TESTDB.mdf' ),
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\TESTDB_log.ldf' )
 FOR ATTACH
GO

EXEC master.dbo.sp_detach_db @dbname = N'TESTDB'


BACKUP DATABASE [TESTDB] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\TESTDB.bak' WITH NOFORMAT, NOINIT,  NAME = N'TESTDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


USE [master]
RESTORE DATABASE [TESTDB] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\TESTDB.bak' WITH  FILE = 1,  NOUNLOAD,  STATS = 5

GO


BACKUP DATABASE [TESTDB] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\deneme3differantialbackup' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'TESTDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

BACKUP LOG [TESTDB] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\deneme4tlog' WITH NOFORMAT, NOINIT,  NAME = N'TESTDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

declare @i as int=00
while @i<10000
begin

insert into DATES values(GETDATE())
waitfor delay '00:00:00:010'
set @i=@i+1
end

select * from DATES


USE [master]
RESTORE DATABASE [TESTDB] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\deneme4fullbackup.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [TESTDB] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\deneme5tlogbackup.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [TESTDB] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\deneme5tlogbackup.bak' WITH  FILE = 2,  NOUNLOAD,  STATS = 5

GO



