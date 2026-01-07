select *
from  {{ source('HR', 'EMPLOYEES')}}