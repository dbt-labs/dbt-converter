with

source as (

    select * from raw.intercom_stitch.teams

),

renamed as (
    
    select
        id as team_id,
        name as assignee_name,
        name as assignee_group

    from source

)

select * from renamed