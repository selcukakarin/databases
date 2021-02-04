create or replace table `dsmbootcamp.selcuk_akarin.ds_non_skewed_1` as
select t1 as _key1 from unnest(generate_array(1, 10000, 1)) t1
union all
select -1 as _key1;   --- 10001 satırlık bir veri oluşturuyoruz. her değer homojen dağılmış non-skewed

create or replace table `dsmbootcamp.selcuk_akarin.ds_non_skewed_2` as
select t1 as _key2 from unnest(generate_array(1, 1000, 1)) t1
union all 
select -1 as _key2;   --- 1001 satırlık bir veri oluşturuyoruz. her değer homojen dağılmış non-skewed 

create or replace table `dsmbootcamp.selcuk_akarin.ds_skewed_1` as
select t1 as _key1 from unnest(generate_array(1, 10000, 1)) t1
union all
select -1 as _key1 from unnest(generate_array(1, 2000, 1)) t1;    -- tekrarlı veri var


select count(1)
from `dsmbootcamp.selcuk_akarin.ds_non_skewed_1` a
join `dsmbootcamp.selcuk_akarin.ds_non_skewed_2` b on a._key1 = b._key2

select count(1)
from `dsmbootcamp.selcuk_akarin.ds_skewed_1` a
join `dsmbootcamp.selcuk_akarin.ds_non_skewed_2` b on a._key1 = b._key2