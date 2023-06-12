with

source as (

    select * from {{ source('greenhouse', 'job_office') }}

),

synth as (

    select 
        job_id,
        office_id,
        row_number() over(partition by job_id order by office_id asc) as office_rank
        
    from source

),

filtered as (

    select * from synth
    where office_rank = 1

)

select * from filtered