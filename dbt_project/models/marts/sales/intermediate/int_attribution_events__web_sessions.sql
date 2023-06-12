with

sessions as (

    select * from {{ ref('fct_web_sessions') }}
    where salesforce_contact_id is not null
        -- the below filters out any non-marketing sites, since they aren't required for attribution modeling
        and app_id not in ('dbt-cloud','cloud-ui','sinter','dbt-docs')

),

joined as (

    select
        session_id as event_id,
        salesforce_contact_id,
        'Snowplow Sessions' as data_source,
        'Website Sessions' as event_group,
        'Website Session' as event_name,
        team,
        source_type,
        channel_grouping,
        channel,
        sub_channel,
        marketing_medium as medium,
        marketing_source as source,
        marketing_campaign as campaign,
        null as event_details,
        session_start::timestamp_ntz as event_timestamp,
        session_start::date as event_date

    from sessions

)

select * from joined