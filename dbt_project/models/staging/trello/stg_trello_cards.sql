with source as (

    select * from {{ source('trello', 'cards') }}

),

renamed as (

    select
        datelastactivity as last_activity_date,
        desc as description,
        id as card_id,
        idboard as board_id,
        idlist as list_id,
        name,
        url,
        due::date as due_date,
        as_boolean(badges['dueComplete']) as is_completed,
        closed as archived,

        -- JSON
        labels,
        idmembers as members

    from source

)

select * from renamed
