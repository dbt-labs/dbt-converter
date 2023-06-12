with 

source as (
    
    select * from {{ source( 'zendesk_chat', 'chat')}}

),

renamed as (
    
    select
        id as chat_id,
        zendesk_ticket_id as ticket_id,
        visitor_id,
        started_by,
        preview,
        type,

    --session info
        session_id,
        session_platform as platform,
        session_user_agent as user_agent,
        session_browser as browser,
        session_region as region,
        session_country_code as country_code,
        session_country_name as country_name,
        session_city as city,
        session_ip as ip,
        session_start_date as start_date,
        session_end_date as end_date,

        count_visitor,
        count_total,
        count_agent,
        duration,
        response_time_max,
        response_time_avg,
        response_time_first,
        triggered,
        triggered_response,

        missed,
        unread,
        rating,
        comment,

        timestamp as created_at

    from source

)

select * from renamed