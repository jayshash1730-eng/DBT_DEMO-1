select 
employee_id,
first_name,
last_name,
department_id,
current_timestamp() as _ingested_at 
from  {{ source('HR', 'EMPLOYEES')}}