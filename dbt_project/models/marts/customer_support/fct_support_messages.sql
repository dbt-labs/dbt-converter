with

messages as (
    
    select * from {{ ref('support_ticket_chats_unioned') }}

),

business_hours as (
    
    select * from {{ ref('all_business_hours') }}
    
),

--this CTE joins business hours to messages. the output is to have two timestamps:
--one for when the message occured, and one mapped `business` timestamp to associate
--things outside business hours to 8am EST. This will be used to calculate datediffs
--in looker to calculate time to first response, time to first closure, etc.
joined as (
    
    select
        messages.*,
        
        greatest(
            messages.created_at,
            message_timestamp.business_hour
        )::timestamp_ntz as created_at_business,
        
        greatest(
            messages.conversation_created_at,
            conversation_timestamp.business_hour
        )::timestamp_ntz as conversation_created_at_business
        
    from messages
    left join business_hours message_timestamp
        on date_trunc('hour', messages.created_at) = message_timestamp.date_hour
    left join business_hours conversation_timestamp
        on date_trunc('hour', messages.conversation_created_at) = conversation_timestamp.date_hour
)

select * from joined