with

source as (

    select * from raw.fivetran_greenhouse.hiring_team

),

augmented as (

    select

        md5(cast(coalesce(cast(job_id as TEXT), '') || '-' || coalesce(cast(role as TEXT), '') || '-' || coalesce(cast(user_id as TEXT), '') as TEXT)) as job_hiring_team_member_id,

        *

    from source

)


select * from augmented