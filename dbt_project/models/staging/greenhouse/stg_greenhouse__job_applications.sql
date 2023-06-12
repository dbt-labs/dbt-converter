with

job_applications as (

    select * from {{ source('greenhouse', 'job_application') }}

)


select * from job_applications