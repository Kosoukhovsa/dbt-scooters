select 
date(t.started_at) as date,
extract( year from t.started_at) - extract( year from u.birth_date )  as age,
count(*) as trips,
sum(t.price_rub) as revenue_rub 
from {{ref("trips_prep")}} as t  
left join {{source("scooters_raw", "users")}} as u on t.user_id = u.id 
group by 1, 2
