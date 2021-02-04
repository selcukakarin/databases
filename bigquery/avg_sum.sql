with gold_medals as
(
  select
    year,
    count(*) as medal_count
  from `dsmbootcamp.sample.summer_medals`
  where year >= 1980
  and medal = 'Gold' and gender = 'Women' and country = 'United States'
  group by year
  order by year
)
select
    year,
    medal_count,
    round(avg(medal_count) over(order by year rows between 2 preceding and current row),2) as medals_ma,
    round(sum(medal_count) over(order by year rows between 2 preceding and current row),2) as medals_ms
from gold_medals;