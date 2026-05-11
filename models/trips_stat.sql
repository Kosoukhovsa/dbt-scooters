select 
count(id) as trips,
count( distinct user_id) as users,
round(avg(duration_s) / 60, 2) as avg_duration_min,
sum(price_rub) as revenue_rub ,
count(*) filter(where is_free)::numeric / count(*) * 100 as free_trips_pct ,
sum(distance_m) / 1000 as sum_distance_km 
from {{ref("trips_prep")}}

