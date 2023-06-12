with source as (

    select * from {{source('trello', 'boards')}}

),

renamed as (

    select
        id as board_id,
        idorganization as organization_id,
        name,
        split_part(name, ' /', 1) as client,
        desc as description,
        url,
        closed
    from source

)

select * from renamed
