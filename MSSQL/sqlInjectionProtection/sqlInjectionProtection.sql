 create proc INSERT_SUGGESTION
 @NAME varchar(200),
 @EMAIL varchar(200),
 @SUBJECT_ varchar(8000)
 as
 insert into SUGGESTION(NAMESURNAME,EMAIL,SUBJECT_) values(@NAME,@EMAIL,@SUBJECT_)