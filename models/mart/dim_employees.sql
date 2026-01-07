{{config(materialized = 'table')}}
select
employee_id,
first_name,
last_name,
department_name from {{ ref("int_employees_with_dept")}}