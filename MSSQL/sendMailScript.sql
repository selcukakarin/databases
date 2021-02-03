create proc send_email
@recipient_ as varchar(1000),
@body_ as varchar(max),
@subject_ as varchar(max)
as
begin
exec msdb.dbo.sp_send_dbmail
@profile_name='SQLDeneme',
@recipients=@recipient_,
@body=@body_,
@subject=@subject_
end

send_email 'selcukakarin@gmail.com','bu mailimizin body kýsmýdýr','SQL Test Maili'