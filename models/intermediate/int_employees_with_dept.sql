{{config(materialized = 'table')}}
select
e.employee_id,
e.first_name,
e.last_name,
d.department_name
from {{ref('stg_employees')}} e left join {{ref('stg_departments')}} d on 
e.department_id = d.department_id





