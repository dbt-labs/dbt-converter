with

touchpoints as (

    select * from {{ ref('fct_touchpoints') }}

),

channel_maps as (

    select * from {{ ref('fct_notion_channel_mapping') }}
    where event_name is not null

),

pre_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'sign_up_source',
            'touchpoint_source'
        ])}} as touchpoint_mapping_id,
        *
    
    from touchpoints

),

channels_grouped as (

    select distinct
        touchpoint_mapping_id,
        event_name,
        team,
        source_type,
        channel_grouping,
        channel,
        sub_channel,
        source

    from channel_maps

),

joined as (

    select
        external_touchpoint_id as event_id,
        touchpoint_id,
        contact_id as salesforce_contact_id,
        coalesce(data_source,'Salesforce Touchpoints') as data_source,
        touchpoint_group as event_group,
        touchpoint_source as event_name,

        case 
            when touchpoint_source in ('Contact Sales','Partner - Inbound') then 'Contact Sales'
            else touchpoint_source
        end as event_name_for_surrogate,

        channels_grouped.team,
        channels_grouped.source_type,
        channels_grouped.channel_grouping,
        channels_grouped.channel,
        channels_grouped.sub_channel,
        utm_medium as medium,

        coalesce(utm_source,sign_up_source) as source,

        coalesce(parent_campaign_name, utm_campaign) as campaign,
        
        case
            when sign_up_source = 'snowflake' then 'Snowflake Partner Connect'
            when sign_up_source = 'databricks' then 'Databricks Partner Connect'
            when sign_up_source = 'bigquery' then 'BigQuery Partner Connect'
            else touchpoint_source_detail
        end as event_details,
        
        opened_at::timestamp_ntz as event_timestamp,
        opened_at::date as event_date
    
    from pre_id
    left join channels_grouped
        on pre_id.touchpoint_mapping_id = channels_grouped.touchpoint_mapping_id

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'salesforce_contact_id',
            'event_name_for_surrogate',
            'event_date'
        ]
        )}} as inferred_event_ref_id,
        * exclude (event_name_for_surrogate)
    
    from joined

)

select * from with_id
