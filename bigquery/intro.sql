select 
  4.35 as m_value,
  4.35 * 100 as m_calc_value,    -- burda gelen virgüllü değer ieee standardından kaynaklıdır.
  cast(4.35 as float64) * 100 as m_float,  -- sorgularken ve depolarken daha az kaynak tüketir - 4 byte
  cast(4.35 as numeric) * 100 as m_numeric;   -- değişmeyen sonuçlar için numeric kullanılmalı - ama tüm veri tabanı transferlerinde sıkıntı yok - 16 byte
    
select
  -- default timezone UTC'dir. eğer farklı bir timezone kullanılacaksa cast gerekir.
  current_date c_date,    -- 2020-12-24
  current_datetime c_datetime,    -- 2020-12-24T20:28:45.537443
  current_time c_time,    -- 	20:28:45.537443
  current_timestamp c_timestamp,    -- 2020-12-24 20:28:45.537443 UTC
  unix_millis(current_timestamp) c_epoch;     -- 1608841725537 -- 1 ocak 1970 şu ana kadarki saniye

select 
 user.id,
 user.name,
 user.lname
from
(
  select 
    current_timestamp() record_ts, 
    struct([1,2,3] as id, ['Onur', 'Ahmet', 'Mehmet'] as name, ['Taşhan', 'Yılmaz', 'Dursun'] as lname) user
  union all
  select 
    current_timestamp() record_ts, 
    struct([4,5,6] as id, ['Ali', 'Ayşe', 'Fatma'] as name, ['Demir', 'Can', 'Özyılmaz'] as lname) user
) t;

select t1 from
(
select generate_array(1,3) ids 
from (select num from unnest(generate_array(1,5)) as num)
) t, unnest(ids) t1;
