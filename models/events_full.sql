select 
ec.type_id ,
ec.user_id ,
ec."timestamp" ,
et."type" 
from 
{{ref("events_clean")}} ec left join {{ref("event_types")}} et using (type_id)