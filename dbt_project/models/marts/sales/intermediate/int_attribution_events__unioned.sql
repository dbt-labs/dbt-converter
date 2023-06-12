with

conversion_events as (

    select * from {{ ref('int_attribution_events__conversion_events_merged') }}

),

sessions as (
    
    select * from {{ ref('int_attribution_events__web_sessions') }}

),

tasks as (

    select * from {{ ref('int_attribution_events__salesforce_tasks') }}

),

contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}
    where is_internal_account = false

),

unioned as (
    
    {{ dbt_utils.union_relations(
        relations=[
            ref('int_attribution_events__conversion_events_merged'),
            ref('int_attribution_events__web_sessions'),
            ref('int_attribution_events__salesforce_tasks')
        ]
    ) }}

),

cleaned as (

    select
        unioned.event_id,
        unioned.salesforce_contact_id,
        unioned.data_source,
        unioned.event_group,
        unioned.event_name,

        case
            when unioned.team is null and unioned.channel = 'Referral' then 'Marketing'
            when unioned.team is null and unioned.channel = 'Direct' then 'Marketing'
            else coalesce(unioned.team,'Other')
        end as team,

        case
            when unioned.source_type is null and unioned.channel = 'Referral' then 'Demand Generation'
            when unioned.source_type is null and unioned.channel = 'Direct' then 'Demand Generation'
            else coalesce(unioned.source_type,'Other')
        end as source_type,

        case
            when unioned.channel_grouping is null and unioned.channel = 'Referral' then 'Inbound Free'
            when unioned.channel_grouping is null and unioned.channel = 'Direct' then 'Inbound Free'
            else coalesce(unioned.channel_grouping,'Other')
        end as channel_grouping,

        coalesce(unioned.channel,'Other') as channel,

        case
            when unioned.sub_channel is null and unioned.channel = 'Referral' then source
            when unioned.sub_channel is null and unioned.channel = 'Direct' then source
            else coalesce(unioned.sub_channel,'Other')
        end as sub_channel,

        unioned.medium,
        unioned.source,
        unioned.campaign,
        unioned.event_details,
        unioned.event_timestamp,
        unioned.event_date

    from unioned
    inner join contacts
        on unioned.salesforce_contact_id = contacts.contact_id

)

select * from cleaned