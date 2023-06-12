with

offices as (

    select *from {{ ref('stg_greenhouse__offices') }}

),

job_offices_stg as (

    select * from {{ ref('stg_greenhouse__job_offices') }}

),

final as (

    select 
        job_offices_stg.job_id,
        job_offices_stg.office_id,
        offices.office_name,
        offices.location_country
        
    from job_offices_stg
    left join offices
        on job_offices_stg.office_id = offices.office_id

)


select * from final