with

job_applications as (

    select * from {{ ref('stg_greenhouse__job_applications') }}

),

applications as (

    select * from {{ ref('stg_greenhouse__applications') }}

),

sources as (

    select * from {{ ref('stg_greenhouse__sources') }}

),

synth as (

    select

        job_applications.job_id,
        sources.source_name,
        applications.*

    from applications

    left join job_applications
        on applications.application_id = job_applications.application_id

    left join sources
        on applications.source_id = sources.source_id

)


select * from synth