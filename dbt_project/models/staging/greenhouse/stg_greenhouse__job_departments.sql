with

job_departments as (

    select * from {{ source('greenhouse', 'job_department') }}

)


select * from job_departments