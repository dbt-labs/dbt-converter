{% set window_clause = 'partition by ticket_id' %}

with

messages as (

    select * from {{ref('fct_support_messages')}}

),

conversation_facts as (

    select
        *,

        min(case
                when part_type = 'close'
                    then created_at 
            end) over ({{ window_clause }}
        ) as first_closed_at,

        max(case
                when part_type = 'close'
                    then created_at 
            end) over ({{ window_clause }}
            ) as last_closed_at,

        min(case
                when part_type = 'close'
                    then created_at_business 
            end) over ({{ window_clause }}
        ) as first_closed_at_business,

        max(case
                when part_type = 'close'
                    then created_at_business 
            end) over ({{ window_clause }}
        ) as last_closed_at_business,

        min(case
                when role  = 'end-user'
                    then conversation_created_at
                when part_type IN ('comment','assignment')
                and role != 'end-user'
                    then created_at 
            end) over ({{ window_clause }}
        ) as first_message_at,

        max(case
                when role  = 'end-user'
                and part_type = ('comment')
                and is_public = true
                    then created_at
                else null
                end) over ({{ window_clause }}
        ) as last_customer_response_at,


        max(case
                when role  = 'end-user'
                and part_type = ('comment')
                and is_public = true
                    then created_at_business
                else null
                end) over ({{ window_clause }}
        ) as last_customer_response_at_business,

        max(case
                when role  = 'admin'
                and part_type = ('comment')
                and is_public = true
                    then created_at
                else null
                end) over ({{ window_clause }}
        ) as last_agent_response_at,

        max(case
                when role  = 'admin'
                and part_type = ('comment')
                and is_public = true
                    then created_at_business
                else null
                end) over ({{ window_clause }}
        ) as last_agent_response_at_business,
        
        max(case
                when role in ('admin','end-user')
                and part_type = ('comment')
                and is_public = true
                    then created_at
                else null
                end) over ({{ window_clause }}
        ) as last_response_at,

        max(case
                when role in ('admin','end-user')
                and part_type = ('comment')
                and is_public = true
                    then created_at_business
                else null
                end) over ({{ window_clause }}
        ) as last_response_at_business,
        
        min(case
                when role = 'end-user'
                    then conversation_created_at_business
                when part_type IN ('comment','assignment')
                and role != 'end-user'
                    then created_at_business 
            end) over ({{ window_clause }}
        ) as first_message_at_business,

        min(case
                when role = 'admin'
                and is_public
                and body is not null
                    then created_at
            end) over ({{ window_clause }}
        ) as first_response_at,

        min(case
                when role = 'admin'
                and is_public
                and body is not null
                    then created_at_business
            end) over ({{ window_clause }}
        ) as first_response_at_business,

        sum(case
                when role = 'admin'
                and is_public
                and body is not null
                    then 1
                else 0
            end) over ({{ window_clause }}
        ) as conversation_admin_responses,

        sum(case
                when role = 'end-user'
                and part_type = 'comment'
                    then 1
                else 0
            end) over ({{ window_clause }}
        ) as conversation_user_responses,

        sum(case
                when part_type = 'close'
                    then 1
                else 0
            end) over ({{ window_clause }}
        ) as conversation_close_count

    from messages

),

calc_last_responder as (
    select
        *,
        case
            when datediff(second, last_agent_response_at, last_customer_response_at) < 0
                then 'agent'
            else 'customer'
            end
        as last_responder
    from conversation_facts
)

select * from calc_last_responder

