with 

ticket_chat as (

    select * from {{ ref('stg_zendesk__chat_history') }}
    where chat_event_type = 'chat.msg'

),

ticket_email as (

    select * from {{ ref('stg_zendesk__ticket_comment') }}
    -- where body not ilike '%***%joined the chat ***%'
    -- and body not ilike 'Conversation with%'
    --remove chat conversations and only bring in email comments
    --and internal comments that aren't public to the user
    --i.e. when `is_public` = false

),

last_solved_event as (

    select * from {{ ref('stg_zendesk__all_ticket_field_histories') }}
    --we don't use the current field values bc a ticket can go from 
    --Closed -> Open and in this case, we want to mark when a ticket
    --first closes
    where field_name = 'status'
    and value = 'closed'
),

unioned as (

    select
        ticket_comment_id::varchar as ticket_comment_id,
        ticket_id::varchar as ticket_id,
        user_id,
        'comment' as event_type,
        body,
        is_public,
        null::varchar as country_name,
        null::varchar as country_code,
        null::varchar as region_category,

        convert_timezone(
            'America/New_York',
            created_at
        )::timestamp_ntz as created_at
        --we have to convert timezones here as we use the
        --Zendesk source package which does not do any
        --timezone conversions
    from ticket_email

    union all

    select
        chat_history_id as ticket_comment_id,
        ticket_id::varchar as ticket_id,
        user_id,
        'comment' as event_type,
        msg as body,
        true as is_public, --check for internal chat convos
        country_name,
        country_code,
        region_category,
        created_at

    from ticket_chat

    union all

    select
        {{dbt_utils.generate_surrogate_key([
            'ticket_id',
            'valid_starting_at'
        ])}} as ticket_comment_id,
        ticket_id,
        null as user_id,
        value as event_type,
        null as body,
        false as is_public,
        null::varchar as country_name,
        null::varchar as country_code,
        null::varchar as region_category,
        max(valid_starting_at) as created_at
        --only take the last solved event
    from last_solved_event
    group by 1,2,3,4,5,6

)

select * from unioned