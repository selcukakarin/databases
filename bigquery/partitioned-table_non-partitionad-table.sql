create or replace table `dsmbootcamp.selcuk_akarin.non_partitioned_table` as
select _date, _key
from unnest(generate_date_array(cast('2020-12-01' as date), cast('2020-12-20' as date), interval 1 day)) as _date,
     unnest(generate_array(1, 100, 1)) as _key;
     
     
create or replace table `dsmbootcamp.selcuk_akarin.partitioned_table`
-- big query'de direkt integer alanlara partitions veremiyorum fakat range partition'lar oluşturuyoruz. 
-- 1 ve 1milyon arasında değer alan bir integer kolonunu 10 parçaya bölerek paritionlayabiliyoruz.
-- 1000. değeri istediğimizde 1. partitiona denk geliyorsa sadece 1. partition'ı okur.
-- 10 günlük verin olduğunu düşünürsen ve date'e göre partition oluşturursan bigquery arka tarafta sanki 10 tane ayrı tablo varmış gibi davranıyor.
-- şöyle caselerde de kullanılıyor. benim datasetim 100 günlük veriyi tutsa yeter. 100 gün den öncesinin verilerini kullanmamıza gerek yoksa burada kullanılır.
-- böyle bir durumda normalde hergün tablonun bakımını yapmamız gerek, bakımını yaparken de current date'i almamız lazım, current date 'ten 100 günü çıkarıp bundan küçük kayıtları tablodan delete etmemiz lazım. Ama bizim tablomuz date kolonu üzerinden partition'lı ise 100 günden eski olan kayıtları drop partition gibi bir ifade ile rahatlıkla drop edebiliyoruz. Partition drop edersek sisteme dahat az yük getiriyor.
partition by _date as
select _date, _key
from unnest(generate_date_array(cast('2020-12-01' as date), cast('2020-12-20' as date), interval 1 day)) as _date,
     unnest(generate_array(1, 100, 1)) as _key;

-- Input phase: 2000 rows
-- burada partition olmadığı için 2000 satır okudu.
select count(1), current_timestamp()
from `dsmbootcamp.selcuk_akarin.non_partitioned_table`
where _date > cast('2020-12-10' as date);

-- Input phase: 2000 rows
select count(1), current_timestamp()
from `dsmbootcamp.selcuk_akarin.partitioned_table`
where _date = cast('2020-12-20' as date) ;

-- Input phase: 1000 rows
-- burada ise partition olduğu için 1000 satır okudu. 
select count(1), current_timestamp()
from `dsmbootcamp.selcuk_akarin.partitioned_table`
where _date > cast('2020-12-10' as date) ;

-- Input phase: 100 rows
select count(1), current_timestamp()
from `dsmbootcamp.selcuk_akarin.partitioned_table`
where _date = cast('2020-12-10' as date) ;

with w_tmp as
(
  select date(parse_timestamp('%d%m%Y', '20122020')) - 1 _date_filter_value
)
select count(1), current_timestamp()
from `dsmbootcamp.selcuk_akarin.partitioned_table` as a
cross join w_tmp as b
where a._date = _date_filter_value;