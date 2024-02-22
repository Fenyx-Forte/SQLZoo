-- Task 1
select
  count(s.id)
from
  stops as s;

-- Task 2
select
  s.id
from
  stops as s
where
  s.name = "Craiglockhart";

-- Task 3
select
    s.id
  , s.name
from
  stops as s
inner join
  route as r
    on
      s.id = r.stop
where
  r.num = "4";

-- Task 4
select
    r.company
  , r.num
  , count(r.stop) as count
from
  route as r
where
  r.stop = 149
  or r.stop = 53
group by
    r.company
  , r.num
having
  count = 2;

-- Task 5
select
    ra.company
  , ra.num
  , ra.stop
  , rb.stop
from
  route as ra
inner join
  route as rb
    on
      ra.company = rb.company
      and ra.num = rb.num
where
  ra.stop = 53
  and rb.stop = 149

-- Task 6
with route_name as (
  select
      r.company
      , r.num
      , s.name
  from
    route as r
  inner join
    stops as s
      on
        r.stop = s.id
)
select
    ra.company
    , ra.num
    , ra.name
    , rb.name
from
  route_name as ra
inner join
  route_name as rb
    on
      ra.company = rb.company
      and ra.num = rb.num
where
  ra.name = "Craiglockhart"
  and rb.name = "London Road";


-- Task 7
with route_name as (
  select
      r.company
      , r.num
      , s.name
  from
    route as r
  inner join
    stops as s
      on
        r.stop = s.id
)
select distinct
    ra.company
    , ra.num
from
  route_name as ra
inner join
  route_name as rb
    on
      ra.company = rb.company
      and ra.num = rb.num
where
  ra.name = "Haymarket"
  and rb.name = "Leith";

-- Task 8
with route_name as (
  select
      r.company
      , r.num
      , s.name
  from
    route as r
  inner join
    stops as s
      on
        r.stop = s.id
)
select distinct
    ra.company
    , ra.num
from
  route_name as ra
inner join
  route_name as rb
    on
      ra.company = rb.company
      and ra.num = rb.num
where
  ra.name = "Craiglockhart"
  and rb.name = "Tollcross";

-- Task 9
with route_name as (
  select
      r.company
      , r.num
      , s.name
  from
    route as r
  inner join
    stops as s
      on
        r.stop = s.id
)
select distinct
    rb.name
    , ra.company
    , ra.num
from
  route_name as ra
inner join
  route_name as rb
    on
      ra.company = rb.company
      and ra.num = rb.num
where
  ra.name = "Craiglockhart"
  and ra.company = "LRT";

-- Task 10
with route_name as (
  select
      r.company
      , r.num
      , s.name
  from
    route as r
  inner join
    stops as s
      on
        r.stop = s.id
),
table_2_stops as (
  select distinct
      r_begin.name as begin_name
      , r_begin.num as begin_num
      , r_begin.company as begin_company
      , r_end.name as end_name
      , r_end.num as end_num
      , r_end.company as end_company
  from
    route_name as r_begin
  inner join
    route_name as r_end
      on
        r_begin.company = r_end.company
        and r_begin.num = r_end.num
)
select distinct
    table_begin.begin_num
  , table_begin.begin_company
  , table_begin.end_name
  , table_end.begin_num
  , table_end.begin_company
from
  table_2_stops as table_begin
inner join
  table_2_stops as table_end
    on
      table_begin.end_name = table_end.begin_name
where
  table_begin.begin_name = "Craiglockhart"
  and table_end.end_name = "Lochend"
order by
    table_begin.begin_num asc
  , table_begin.end_name asc
  , table_end.begin_num asc;

