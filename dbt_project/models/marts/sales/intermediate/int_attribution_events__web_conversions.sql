{% set conversion_names = [
    'register_cloud',
    'register_coalesce',
    'register_community',
    'register_on-demand-learn',
    'contact_contact-sales',
    'download_%'
]%}

with

attributed_sessions as (

    select * from {{ ref('fct_web_attribution_sessions') }}
    where last_touch_points = 1
        and salesforce_contact_id is not null
        and conversion_name ilike any (
            {% for conversion_name in conversion_names -%}
            '{{ conversion_name }}'
            {%- if not loop.last -%},{% endif %}
            {% endfor -%}
        )
    qualify row_number() over (partition by inferred_user_id, attributed_session_id, conversion_name order by converted_at) = 1

),

cleaned as (

    select
        event_id,
        null as touchpoint_id,
        salesforce_contact_id,
        'Snowplow Conversions' as data_source,
        'Website Conversions' as event_group,
        
        case
            when conversion_name = 'register_cloud' then 'Sign Up'
            when conversion_name = 'register_coalesce' then 'Coalesce'
            when conversion_name = 'register_on-demand-learn' then 'Enrolled in dbt Learn'
            when conversion_name = 'register_community' then 'Joined dbt Slack'
            when conversion_name = 'contact_contact-sales' then 'Contact Sales'
            when conversion_name ilike '%download_%' then 'Marketing Content Download'
            else conversion_name
        end as event_name,
        
        team,
        source_type,
        channel_grouping,
        channel,
        sub_channel,
        marketing_medium as medium,
        marketing_source as source,
        marketing_campaign as campaign,
        null as event_details,
        converted_at::timestamp_ntz as event_timestamp,
        converted_at::date as event_date
    
    from attributed_sessions
    
),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'salesforce_contact_id',
            'event_name',
            'event_date'
        ]
        )}} as inferred_event_ref_id,
        *
    
    from cleaned

)

select * from with_id