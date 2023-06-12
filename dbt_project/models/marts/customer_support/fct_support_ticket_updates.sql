{% set lifecycle_fields = ('status', 'priority', 'Severity', 'assignee_id', 'group_id', 'due_at', 'jira_issue_ids') %}
{% set window_clause = '(partition by ticket_id order by valid_starting_at)' %}

with

ticket_updates as (

    select * from {{ ref('stg_zendesk__all_ticket_field_histories') }}
    where field_name in {{ lifecycle_fields }}

),

users as (

    select * from {{ ref('stg_zendesk__user') }}

),

groups as (
    
    select * from {{ ref('stg_zendesk__group') }}

),

tickets as (

    select * from {{ ref('fct_support_tickets') }}
    where source = 'zendesk'

),

jira_ticket_updates as (

    select * from {{ ref('int__zendesk_ticket_jira_issue_historized') }}

),

-- adapt Jira updates to existing Zendesk updates
ticket_jira_states as (

    select
        ticket_id,
        -- staying consistent with Zendesk updates modeling
        -- TO DO: convert Zendesk modeling to UTC & keep timezone conversion in the BI tool
        convert_timezone(
            'America/New_York',
            updated_at
        )::timestamp_ntz as valid_starting_at,
        'jira_issue_ids' as field_name,
        -- field value must be varchar
        -- empty array gets converted to blank strings
        nullif(array_to_string(jira_issue_ids, ','), '') as field_value

    from jira_ticket_updates

),

ticket_updates_joined as (

    -- zendesk ticket updates
    select
        ticket_field_history_id,
        ticket_id,
        valid_starting_at,
        field_name,
        value as field_value

    from ticket_updates

    union all

    -- jira issues updates
    select
        {{ dbt_utils.generate_surrogate_key([
            'ticket_id',
            'field_name',
            'valid_starting_at'
        ])}} as ticket_field_history_id,
        ticket_id,
        valid_starting_at,
        field_name,
        field_value

    from ticket_jira_states

),


ticket_states as (

    select
        ticket_id,
        valid_starting_at,
        -- keeping arbitrarily the minimum uuid for simultaneous updates
        min(ticket_field_history_id) as ticket_field_history_id,
        listagg(lower(field_name), ',') as changed_fields,
        {{ dbt_utils.pivot(
            'field_name',
            lifecycle_fields,
            agg='max',
            then_value='field_value',
            else_value='null',
            quote_identifiers=False
        ) }},
        -- flag field change
        -- this enables to differenciate updates to `null` values from unchanged values forced to `null`
        {{ dbt_utils.pivot(
            'field_name',
            lifecycle_fields,
            suffix='_update',
            quote_identifiers=False
        ) }}

    from ticket_updates_joined
    group by 1, 2

),

ticket_windows as (

    select
        -- excluding update flags
        * exclude ({{ lifecycle_fields | join("_update, ") ~ "_update" }}),
        lead(valid_starting_at) over {{ window_clause }} as valid_ending_at,

        -- creating a rank for each ticket x field update batch
        -- this enables to accout for values changed to `null`
        {% for field in lifecycle_fields -%}
            sum({{ field }}_update) over {{ window_clause }} as {{ field }}_group
            {% if not loop.last %},{% endif %}
        {%- endfor -%}
    
    from ticket_states

),

-- build field values from sparse matrix
ticket_states_densified as (

    select
        * exclude ({{ lifecycle_fields | join(", ") }}),
        -- keeping updated value for each ticket x field update batch
        -- `null` values will be kept
        {% for field in lifecycle_fields -%}
            max({{ field }}) over (
                partition by ticket_id, {{ field }}_group
            ) as {{ field }}
            {% if not loop.last %},{% endif %}
        {%- endfor -%}

    from ticket_windows

),

ticket_states_enriched as (

    select
        -- excluding group computations
        ticket_states_densified.* exclude ({{ lifecycle_fields | join("_group, ") ~ "_group"}}),
        -- enrichments
        users.name as assignee_name,
        groups.name as group_name,
        tickets.is_open,
        tickets.is_setup,
        tickets.is_internal_user,
        tickets.is_proactive,
        tickets.did_respond_in_sla,
        tickets.did_close_in_sla,
        tickets.predicted_plan_tier,
        tickets.created_channel

    from ticket_states_densified
    -- keeping consistent with existing filters on ticket analyses
    inner join tickets
        on ticket_states_densified.ticket_id = tickets.ticket_id
    left join users
        on ticket_states_densified.assignee_id = users.user_id
    left join groups 
        on ticket_states_densified.group_id = groups.group_id

)

select * from ticket_states_enriched
