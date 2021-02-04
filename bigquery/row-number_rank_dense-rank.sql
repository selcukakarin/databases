with gold as
(
  select
    year,
    country,
    event,
    medal,
    athlete
  from `dsmbootcamp.selcuk_akarin.summer_medals`
  where year in (1996,2000,2004,2008)
  and gender = 'Women' and event in ('100m freestyle')
)
SELECT
  year,
  event,
  country,
  medal,
  athlete,
  row_number() over(order by year,event,medal) as row_number,
  rank() over(order by year,event,medal) as rank,
  dense_rank() over(order by year,event,medal) as dense_rank
FROM gold
order by event, year;