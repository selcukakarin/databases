sp_configure 
-- propertiesteki verileri g�sterir
sp_configure 'show advanced options'
sp_configure 'show advanced options',1
reconfigure with override
--properties'teki fill factor oran�n� de�i�tirmeye yarar.
sp_configure  'fill factor (%)'
sp_configure  'fill factor (%)',50
reconfigure with override
--sql server'in kulland��� sistem ram'inin alt seviyesini belirler (propertiesteki default value)
sp_configure  'min server memory (MB)'
sp_configure  'min server memory (MB)',50
reconfigure with override
--sql server'in kulland��� sistem ram'inin �st seviyesini belirler (propertiesteki default value)
sp_configure  'max server memory (MB)'
sp_configure  'max server memory (MB)',250
reconfigure with override
xp_cmdshell 'dir c:\'
sp_configure 'xp_cmdshell',1
sp_configure 'xp_cmdshell',0
reconfigure with override

PLE olmas� gereken de�er formul� :
(Toplam ram de�eri(GB)/4)*300>300 olmal�d�r.