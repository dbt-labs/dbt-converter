with

source as (

    select * from {{ source('jira', 'sprint') }}

),

renamed as (

    select 
        id as sprint_id,
        board_id,
        name as sprint_name,

        start_date as started_at,
        end_date as ended_at,
        complete_date as completed_at

    from source

)

select * from renamed