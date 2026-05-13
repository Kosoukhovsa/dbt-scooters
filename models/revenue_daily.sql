select
    sum(price_rub) as revenue_rub,
    "date",
    now() at time zone 'UTC' as updated_at
from
    {{ ref("trips_prep") }}
{% if is_incremental() %}
    where "date" >= (select max("date") - INTERVAL '2 day' from {{ this }} )
{% endif %}
group by
    2, 3
order by
    2