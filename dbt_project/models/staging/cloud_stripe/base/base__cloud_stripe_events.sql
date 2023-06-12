with

events as (

    select * from {{ source('stripe', 'events') }}

),

final as (

    select
        id as event_id,

        type as event_type,
        object,
        data,
        request,
        api_version,
        
        pending_webhooks,
        livemode as is_livemode,

        created as created_at,
        updated as updated_at
    
    from events

)

select * from final