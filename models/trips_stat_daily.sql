select 
date,
count(id) as trips,
max(price_rub) / 100 as max_price_rub ,
avg(distance_m) / 1000 as avg_distance_km ,
sum(price_rub)/(sum(duration_s) / 60) as avg_price_rub_per_min
from {{ref("trips_prep")}}
group by 1
order by 1
