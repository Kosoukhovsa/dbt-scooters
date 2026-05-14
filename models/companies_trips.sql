with companies_cnt as (
select
s.company,
count(tp.id) as trips_cnt
from 
{{ref("trips_prep")}} as tp left join {{ref("scooters")}} s on 
tp.scooter_hw_id = s.hardware_id 
group by
1
)
select
comp_cnt.company,
comp_cnt.trips_cnt / c.scooters::decimal as trips_per_scooter
from companies_cnt as comp_cnt
left join {{ref("companies")}}  c using (company)
order by trips_per_scooter desc
