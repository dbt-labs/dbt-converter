with

ticket_events as (

  select * from {{ ref('int__zendesk_ticket_events_unioned') }}

),

current_ticket_field_values as (

    select * from {{ ref('fct_support_ticket_current_field_values') }}

),

historical_ticket_field_values as (

    select * from {{ ref('stg_zendesk__all_ticket_field_histories') }}

),

users as (

  select * from {{ ref('stg_zendesk__user') }}

),

agents as (

  select * from {{ ref('int__zendesk_historic_agents') }}

),

groups as (
    
    select * from {{ ref('stg_zendesk__group') }}
),

ticket_event_statuses as (

    select
        ticket_events.*,
        current_ticket_field_values.product_area,
        current_ticket_field_values.severity,

        link_to_docs_or_issue_change.value as link_to_docs_or_issue,
        status_change.value as ticket_status,
        assignee_id_change.value as assignee_id,
        group_id_change.value as group_id

    from ticket_events
    left join current_ticket_field_values
        on ticket_events.ticket_id = current_ticket_field_values.ticket_id

    {% set field_names = [
        "assignee_id", 
        "status", 
        "link_to_docs_or_issue",
        "group_id"
    ]%}
    {% for field_name in field_names -%}

        left join historical_ticket_field_values as {{field_name}}_change
            on ticket_events.ticket_id = {{field_name}}_change.ticket_id
            and ticket_events.created_at >= {{field_name}}_change.valid_starting_at
            and (ticket_events.created_at < {{field_name}}_change.valid_ending_at
                or {{field_name}}_change.valid_ending_at is null)
            and {{field_name}}_change.field_name = '{{field_name}}'

        {{ " " if not loop.last }}

    {%- endfor -%}

),

joined as (

    select
        ticket_event_statuses.*,
        groups.name as group_name,
        
        case
            when users.role in ('admin', 'agent')
                then 'admin'
            when agents.user_id is not null
                then 'admin'
            when event_type = 'closed'
                then 'bot'
            else users.role
        end as role,

        COALESCE(
            case when is_public then agents.name end,
            assignees.name
        ) as assignee_name


    from ticket_event_statuses
    left join users
        on ticket_event_statuses.user_id = users.user_id
    left join agents
        on ticket_event_statuses.user_id = agents.user_id
    left join users as assignees
        on ticket_event_statuses.assignee_id = assignees.user_id
    left join groups 
        on ticket_event_statuses.group_id = groups.group_id

)

select * from joined