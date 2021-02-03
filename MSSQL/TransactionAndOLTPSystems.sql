if not exists (select * from BASKET where USERID=1 and STATUS_=0)
insert into BASKET (USERID,STATUS_,CREATEDATE) values (1,0,GETDATE())

insert into USER_ (USERNAME_,PASSWORD_) values ('OMER','123')

select * from BASKET
select * from BASKETDETAIL
select * from USER_

insert into BASKETDETAIL (BASKETID,ITEMCODE,AMOUNT,PRICE,DATE_) values (1,'MALZEME1',1,100,GETDATE())

insert into BASKETDETAIL (BASKETID,ITEMCODE,AMOUNT,PRICE,DATE_) values (1,'MALZEME2',3,200,GETDATE())

insert into BASKETDETAIL (BASKETID,ITEMCODE,AMOUNT,PRICE,DATE_) values (2,'MALZEME2',3,200,GETDATE())

insert into ORDER_ (BASKETID,DATE_,STATUS_) values (1,GETDATE(),1)
select @@IDENTITY

select * from ORDER_

insert into ORDERDETAIL (ORDERID,ITEMCODE,AMOUNT,PRICE,DATE_)
select 1,ITEMCODE,AMOUNT,PRICE,GETDATE() from BASKETDETAIL where BASKETID in
(select BASKETID from ORDER_ where ID=1) 

select * from ORDERDETAIL

update BASKET set STATUS_=1 where ID=1

insert into PAYMENT (ORDERID,PAYMENTAMOUNT,PAYMENTTYPE,STATUS_,APPROVECODE,DATE_) values (1,700,0,1,'APPR8564',GETDATE())

update ORDER_ set STATUS_=2 where ID=1

update BASKET set STATUS_=2 where ID=1


begin tran
declare @BASKETID as int
insert into BASKET (USERID,STATUS_,CREATEDATE) values (1,0,GETDATE())
set @BASKETID=@@IDENTITY

if @@ERROR>0
begin
	rollback tran	
	return
end
commit

insert into BASKETDETAIL (BASKETID,ITEMCODE,AMOUNT,PRICE,DATE_) values (@BASKETID,'MALZEMEdeneme',1,1200,GETDATE())

declare @ORDERID as int
insert into ORDER_ (BASKETID,DATE_,STATUS_) values (@BASKETID,GETDATE(),1)
set @ORDERID=@@IDENTITY

insert into ORDERDETAIL (ORDERID,ITEMCODE,AMOUNT,PRICE,DATE_)
select @ORDERID,ITEMCODE,AMOUNT,PRICE,GETDATE() from BASKETDETAIL where BASKETID in
(select BASKETID from ORDER_ where ID=@BASKETID) 

update BASKET set STATUS_=1 where ID=@BASKETID

insert into PAYMENT (ORDERID,PAYMENTAMOUNT,PAYMENTTYPE,STATUS_,APPROVECODE,DATE_) values (@ORDERID,700,0,1,'APPR8564',GETDATE())

update ORDER_ set STATUS_=2 where ID=@ORDERID

update BASKET set STATUS_=2 where ID=@BASKETID

select * from BASKETDETAIL
select * from BASKET
select * from ORDER_
select * from ORDERDETAIL
select * from PAYMENT

select * from BASKET with(nolock)

rollback
commit

TRUNCATE TABLE PAYMENT
TRUNCATE TABLE ORDERDETAIL
TRUNCATE TABLE ORDER_
TRUNCATE TABLE BASKETDETAIL
TRUNCATE TABLE BASKET


begin tran
declare @I as int=0
while @I<100000
begin
insert into BASKET (USERID,STATUS_,CREATEDATE,UPDATEDATE,DEFINITION_)
values(1,1,GETDATE(),GETDATE(),'sadddddddddddddddddddddddddasdasdasdsadasdassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssadsadasssssssssssssssssssssssssssssssssssssssssssssssssssssssss')
set @I=@I+1
end

truncate table BASKET