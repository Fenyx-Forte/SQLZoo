-- Task 1
select
    c.name
  , day(c.whn) as day
  , c.confirmed
  , c.deaths
  , c.recovered
from
  covid as c
where
  c.name = "Spain"
  and month(c.whn) = 3
  and year(c.whn) = 2020
order by
  c.whn asc;

-- Task 2
select
    c.name
  , day(c.whn) as day
  , c.confirmed
  , lag(c.confirmed, 1) over (
      partition by
        c.name
      order by
        c.whn) as confirmed_day_before
from
  covid as c
where
  c.name = "Italy"
  and month(c.whn) = 3
  and year(c.whn) = 2020
order by
  c.whn asc;


-- Task 3
select
    c.name
  , day(c.whn) as day
  , (c.confirmed - lag(c.confirmed, 1) over (
      partition by
        c.name
      order by
        c.whn))  as new_cases
from
  covid as c
where
  c.name = "Italy"
  and month(c.whn) = 3
  and year(c.whn) = 2020
order by
  c.whn asc;


-- Task 4
select
    c.name
  , date_format(c.whn, "%Y-%m-%d") as date_
  , (c.confirmed - lag(c.confirmed, 1) over (
      partition by
        c.name
      order by
        c.whn))  as new_cases_week
from
  covid as c
where
  c.name = "Italy"
  and weekday(c.whn) = 0
  and year(c.whn) = 2020
order by
  c.whn asc;

-- Task 5
select
    this_week.name
  , date_format(this_week.whn, "%Y-%m-%d") as date_
  , (this_week.confirmed - last_week.confirmed) as this_week_confirmed
from
  covid as this_week
left join
  covid as last_week
    on
      this_week.whn = date_add(last_week.whn, interval 1 week)
      and this_week.name = last_week.name
where
  this_week.name = "Italy"
  and weekday(this_week.whn) = 0
order by
  this_week.whn asc;


-- Task 6
select
    c.name
  , c.confirmed
  , rank() over (
      order by
        c.confirmed desc) as rank_cases
  , c.deaths
  , rank() over(
      order by
        c.deaths desc) as rank_deaths
from
  covid as c
where
  c.whn = "2020-04-20"
order by
  c.confirmed desc;

-- Task 7
select
    w.name
  , round(100000 * c.confirmed / w.population, 2) as infection_rates
  , rank() over(
      order by
        100000 * c.confirmed / w.population asc) as rank
from
  covid as c
inner join
  world as w
    on
      c.name = w.name
where
  c.whn = "2020-04-20"
  and w.population > 10000000
order by
  w.population desc;


-- Task 8
with new_cases_table as (
  select
      c.name
    , c.whn
    , c.confirmed
    , (c.confirmed - lag(c.confirmed, 1) over (
        partition by
          c.name
        order by
          c.whn asc)) as new_cases
  from
    covid as c
),
peak_cases_table as (
  select
      n.name
    , max(n.new_cases) as peak_cases
  from
    new_cases_table as n
  group by
    n.name
  having
    peak_cases >= 1000
)
select
    p.name
  , date_format(n.whn, "%Y-%m-%d") as date_
  , p.peak_cases
from
  peak_cases_table as p
inner join
  new_cases_table as n
    on
      p.name = n.name
      and p.peak_cases = n.new_cases
order by
  date_ asc;