with

source as (

    select * from raw.fivetran_asana_boards.story

),

renamed as (

    select
        id as task_event_id,
        created_by_id,
        target_id,
        type,
        text,
        source,
        hearted,
        num_hearts,
        created_at

    from source

)

select * from renamed