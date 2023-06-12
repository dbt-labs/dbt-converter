with

tasks as (

    select * from {{ ref('int_salesforce__tasks') }}
    where include_in_attribution = True

),

channel_maps as (

    select * from {{ ref('fct_notion_channel_mapping') }}
    where event_name is null
),

channels_grouped as (

    select distinct
        team,
        source_type,
        channel_grouping,
        channel,
        sub_channel,
        medium,
        source

    from channel_maps

),

joined as (

    select
        salesforce_task_id as event_id,
        salesforce_contact_id,
        task_data_source as data_source,
        'Salesforce Tasks' as event_group,
        task_subtype as event_name,
        channels_grouped.team,
        channels_grouped.source_type,
        channels_grouped.channel_grouping,
        channels_grouped.channel,
        channels_grouped.sub_channel,
        lower(task_subtype) as medium,
        lower(task_data_source) as source,
        null as campaign,
        task_details as event_details,
        completed_at as event_timestamp,
        completed_at::date as event_date
    
    from tasks
    left join channels_grouped
        on lower(tasks.task_subtype) = channels_grouped.medium
        and lower(tasks.task_data_source) = channels_grouped.source

)

select * from joined