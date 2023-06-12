{%- set partition_clause = 'partition by salesforce_account_id' -%}
{%- set onboarding_events = dbt_utils.get_column_values(
    table=ref('int__customer_onboarding_events_unioned'),
    column='event_name'
) -%}

with

onboarding_events_unioned as (

    select * from {{ ref('int__customer_onboarding_events_unioned') }}

),

-- unpack events to one row per sfdc account id with dates as columns
event_dates_by_sfdc_id as (

    select distinct
        salesforce_account_id,

        {%- for onboarding_event in onboarding_events %}

            min(
                case
                    when event_name = '{{ onboarding_event }}'
                    then event_date
                end
            ) over (
                {{ partition_clause }}
            ) as {{ onboarding_event }}_date{% if not loop.last%},{% endif %}

        {%- endfor %}

    from onboarding_events_unioned

),

final as (

    select
        *,

        {#- Iterate over onboarding events to calculate elapsed days from closed-won and event -#}
        {%- for onboarding_event in onboarding_events | select('ne', 'closed_won') %}
            datediff(
                'day',
                closed_won_date,
                {{ onboarding_event }}_date
            ) as days_to_{{ onboarding_event }},
        {%- endfor %}

        {#- Create boolean columns to support Looker filtering -#}
        {%- for onboarding_event in onboarding_events | select('ne', 'closed_won') %}

            case
                when {{ onboarding_event }}_date is not null

                {#- Rapid onboarding dates need special consideration comparing with todays date #}
                {% if 'rapid_onboarding' in onboarding_event -%}

                    and {{ onboarding_event }}_date <= current_date()

                {%- endif %}

                    then true
                else false
            end as has_{{ onboarding_event }}{% if not loop.last%},{% endif %}

        {%- endfor %}
    
    from event_dates_by_sfdc_id
    -- Remove events for acccounts that never became customers
    where closed_won_date is not null

),

-- Special handling for onboarding events that fall out of sequence
final_with_corrections as (

    select 
        * exclude (days_to_setup_ticket_opened, days_to_setup_ticket_closed),

        case
            when salesforce_account_id = '0014v00002IcNVKAA3'
                then 0
            else days_to_setup_ticket_opened
        end as days_to_setup_ticket_opened,
        case
            when salesforce_account_id = '0014v00002IcNVKAA3'
                then 0
            else days_to_setup_ticket_closed
        end as days_to_setup_ticket_closed
    
    from final

)

select * from final_with_corrections