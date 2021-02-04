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
  lead(country,1) over(partition by event order by year) as next_champ_1,
  lead(country,2) over(partition by event order by year) as next_champ_2,
  lead(country,3) over(partition by event order by year) as next_champ_3,
  lag(country,1) over(partition by event order by year) as prev_champ_1,
  lag(country,2) over(partition by event order by year) as prev_champ_2,
  lag(country,3) over(partition by event order by year) as prev_champ_3
FROM gold
order by event, year;