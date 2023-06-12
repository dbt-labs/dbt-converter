with job_requisitions as (

    select * from {{ ref('stg_salesforce__job_requisitions') }}

)

select * from job_requisitions