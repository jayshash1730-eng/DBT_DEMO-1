{{
    config
    (materialized = 'incremental',
unique_id = 'employee_id',
incremental_strategy ='merge'
)}}

select
e.employee_id,
e.first_name,
e.last_name,
d.department_name,
e._ingested_at
from {{ref('stg_employees')}} e left join {{ref('stg_departments')}} d on 
e.department_id = d.department_id

{% if is_incremental() %}
where e._ingested_at >
(select max(_ingested_at)from {{ this }})
{% endif %}





