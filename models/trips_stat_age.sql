with c_age as (
select 
date(t.started_at) as date,
extract( year from t.started_at) - extract( year from u.birth_date )  as age,
count(*) as trips
from scooters_raw.trips t  
left join scooters_raw.users u on t.user_id = u.id 
group by 1, 2
)
select 
age,
avg(trips) as avg_trips
from 
c_age 
group by 1
order by 1
