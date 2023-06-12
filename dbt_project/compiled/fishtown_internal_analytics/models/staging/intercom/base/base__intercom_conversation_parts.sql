with 

source as (
    
    select * from raw.intercom_stitch.conversation_parts

),

source_as_json as (

    select 
        conversation_id::varchar as ticket_id, 
        object_construct(*) as conversation_part

    from source

),

conversation_parts as (

  --re-create conversation_parts json array, sorted by created_at
    select 
        ticket_id, 
        array_agg(conversation_part) within group (
            order by conversation_part:created_at
        ) as conversation_parts

    from source_as_json
    group by 1

)

select * from conversation_parts