with

source as (

    select * from {{ source('asana', 'team') }}

),

renamed as (

    select
        id as team_id,
        organization_id,
        name as team_name

    from source

)

select * from renamed