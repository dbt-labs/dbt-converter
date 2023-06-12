{% set window_clause = '(partition by ticket_id order by created_at)' %}

with 

ticket_events as (

  select * from {{ ref('int__zendesk_ticket_events_enriched') }}

),

windowed as (

    select
        {{ dbt_utils.star(
            from=ref('int__zendesk_ticket_events_enriched'),
            except=["COUNTRY_CODE",
                    "COUNTRY_NAME",
                    "REGION_CATEGORY"]
        ) }},

        max(country_code) over {{ window_clause}} as country_code,

        max(country_name) over {{ window_clause }} as country_name,

        max(region_category) over {{ window_clause }} as region_category,

        row_number() over {{ window_clause }} as ticket_comment_number,

        min(created_at) over {{ window_clause }} as conversation_created_at,

        row_number() over (
            partition by ticket_id, role
            order by created_at
        ) as ticket_comment_role_number,

        case
            when event_type = 'closed'
                then 'close'
            when ticket_comment_role_number = 1
            and role = 'admin'
                then 'assignment'
            else 'comment'
        end as part_type

    from ticket_events

)

select * from windowed
where cast(ticket_id as bigint) >= 79 
and created_at >= '2021-05-19T10:14:30'

-- Ticket ID 79 was the first "real" customer ticket in ZD
