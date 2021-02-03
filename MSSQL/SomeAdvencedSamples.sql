sp_configure 
-- propertiesteki verileri gösterir
sp_configure 'show advanced options'
sp_configure 'show advanced options',1
reconfigure with override
--properties'teki fill factor oranýný deðiþtirmeye yarar.
sp_configure  'fill factor (%)'
sp_configure  'fill factor (%)',50
reconfigure with override
--sql server'in kullandýðý sistem ram'inin alt seviyesini belirler (propertiesteki default value)
sp_configure  'min server memory (MB)'
sp_configure  'min server memory (MB)',50
reconfigure with override
--sql server'in kullandýðý sistem ram'inin üst seviyesini belirler (propertiesteki default value)
sp_configure  'max server memory (MB)'
sp_configure  'max server memory (MB)',250
reconfigure with override
xp_cmdshell 'dir c:\'
sp_configure 'xp_cmdshell',1
sp_configure 'xp_cmdshell',0
reconfigure with override

PLE olmasý gereken deðer formulü :
(Toplam ram deðeri(GB)/4)*300>300 olmalýdýr.