with gold as
(
  select
    year,
    country,
    event
  from `dsmbootcamp.sample.summer_medals`
  where year in (1996,2000,2004,2008)
  and medal = 'Gold' and gender = 'Women' and event in ('400m freestyle', 'high jump')
)
SELECT
  year,
  event,
  country,
  first_value(country) over(partition by event order by year) as first_champ_country, -- event bazında yıllara göre ilk şampiyonu getir
  first_value(country) over(partition by event order by year desc) as last_champ_country,   -- event bazında yıllara göre son şampiyonu getir
  last_value(country) over(order by year,event) as last_champ_country_1,    -- yıllara göre ilk şampiyonu getir -- her satırın kendi döndü. eğer bir preceding veya following değeri verilmiyorsa last value o satırın değerini döner. bir aralık verilmelidir.
  last_value(country) over(order by year,event rows between unbounded preceding and unbounded following) as last_champ_country_2, -- preceding ve following verilmeli aralık belirt
  last_value(country) over(partition by event order by year,event rows between unbounded preceding and unbounded following) as last_champ_country_3, -- event bazında kontrol et
  last_value(country) over(partition by event order by year,event rows between 1 preceding and 2 following) as last_champ_country_4, -- event bazında sırala ama benden önceki ve benden 2 sonraki değerleri aralık olarak belirt
  last_value(country) over(partition by event order by year,event rows between current row and 1 following) as last_champ_country_5 
FROM gold
order by event, year;