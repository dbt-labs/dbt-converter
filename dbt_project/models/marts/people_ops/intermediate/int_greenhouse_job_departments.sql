with

job_departments_stg as (

    select * from {{ ref('stg_greenhouse__job_departments') }}

),

department_stg as (

    select * from {{ ref('stg_greenhouse__departments') }}

),

job_departments as (

    select 
        job_departments_stg.job_id,
        department_stg.*

    from job_departments_stg
    left join department_stg
        on job_departments_stg.department_id = department_stg.l0_department_id

)


select * from job_departments