create table SEHIR
(SEHIRADI varchar(15) NOT NULL );

go
 insert SEHIR(SEHIRADI) values ('İstanbul'),('Istanbul')
								, ('istanbul'), ('İSTANBUL'), ('ISTANBUL'), ('ankara'), ('Ankara');
go

select SEHIRADI from SEHIR
order by SEHIRADI
collate Latin1_General_CI_AS asc
go

select SEHIRADI from SEHIR
order by SEHIRADI
collate Turkish_CI_AS asc
go

select * from SEHIR
order by SEHIRADI
collate Latin1_General_CS_AS asc

go

select * from SEHIR
order by SEHIRADI
collate Turkish_CS_AS asc

go

select * from SEHIR where SEHIRADI collate Turkish_CI_AS='Istanbul'
order by SEHIRADI
collate Turkish_CS_AS asc

go

select * from SEHIR where SEHIRADI collate Latin1_General_CS_AS='Istanbul'
order by SEHIRADI
collate Turkish_CS_AS asc

create table kelimeler(kelime varchar(100))

insert into kelimeler values('ala');
insert into kelimeler values('AlA');
insert into kelimeler values('âla');
insert into kelimeler values('ÂlÂ');

select * from kelimeler
where kelime collate Latin1_General_CS_AS='ala'