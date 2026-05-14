select
round(
count(*) filter (where q_1."type" = 'cancel_search')::decimal / 
count(*) filter (where q_1."type" = 'start_search') ,
2
) * 100 as cancel_pct
from {{ref("events_full")}} q_1
