{{config
    (materialized = 'incremental',
unique_id = 'employee_id',
incremental_strategy ='merge' 
)}}
select
employee_id,
first_name,
last_name,
department_name,
current_timestamp as mart_loaded_at
 from (
    select *,
    row_number () over (
        partition by  employee_id order by department_name) as rn
        from {{ ref('int_employees_with_dept')}}
        where department_name is not null
 )
 where rn = 1