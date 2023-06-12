with

touchpoints as (

    select * from {{ ref('int_attribution_events__salesforce_touchpoints') }}
    where touchpoint_id = event_id

),

conversions as (

    select * from {{ ref('int_attribution_events__web_conversions') }}

),

merged as (
    
    {% set column_names = dbt_utils.get_filtered_columns_in_relation(
        from = ref('int_attribution_events__salesforce_touchpoints'),
        except = [
            'touchpoint_id',
            'data_source',
            'team',
            'source_type',
            'channel_grouping',
            'channel',
            'sub_channel',
            'medium',
            'source',
            'campaign'
        ]
    )%}

    select

        {% for column in column_names -%}
            coalesce(touchpoints.{{column|lower}}, conversions.{{column|lower}}) as {{column|lower}},
        {% endfor -%}

        coalesce(conversions.data_source, touchpoints.data_source) as data_source,
        coalesce(conversions.team, touchpoints.team) as team,
        coalesce(conversions.source_type, touchpoints.source_type) as source_type,
        coalesce(conversions.channel_grouping, touchpoints.channel_grouping) as channel_grouping,
        coalesce(conversions.channel, touchpoints.channel) as channel,
        coalesce(conversions.sub_channel, touchpoints.sub_channel) as sub_channel,
        coalesce(conversions.medium, touchpoints.medium) as medium,
        coalesce(conversions.source, touchpoints.source) as source,
        coalesce(conversions.campaign, touchpoints.campaign) as campaign
    
    from touchpoints
    inner join conversions using (inferred_event_ref_id)
    -- the below logic will deduplicate multiple events that are inferred to be the same
    qualify row_number() over (partition by inferred_event_ref_id, data_source order by event_timestamp) = 1

),

unmerged_touches as (

    select
        inferred_event_ref_id,
        event_id,
        salesforce_contact_id,
        event_group,
        event_name,
        event_details,
        event_timestamp,
        event_date,
        data_source,
        team,
        source_type,
        channel_grouping,
        channel,
        sub_channel,
        medium,
        source,
        campaign
        from touchpoints
    where inferred_event_ref_id not in (select inferred_event_ref_id from merged group by 1)

),

unioned as (

    select * from merged
    union all
    select * from unmerged_touches

)

select * from unioned