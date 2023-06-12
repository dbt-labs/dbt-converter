with goals as (

    select * from {{ ref('stg_salesforce__goals') }}

),

opportunities as (

    select * from {{ ref('fct_opportunities') }}

),

touchpoints as (

    select * from {{ ref('fct_touchpoints') }}

),

all_days_source as (

    select * from {{ ref('all_days') }}

),

channel_mappings as (

    select * from {{ ref('fct_notion_channel_mapping') }}
    where event_name is not null
        and source_type is not null

),

unique_channels as (

    select distinct
        event_name,
        source_type
    
    from channel_mappings

),

all_days as (

    select
        date_day,
        date_trunc('month', date_day) as date_month

    from all_days_source

),

touchpoints_agg as (

    select
        opened_at::date as date_day,
        touchpoint_source,
        touchpoint_source_type as team,
        coalesce(region, 'Unknown') as region, -- this is to ensure touchpoints with a null region align with the goal
        coalesce(market_segment, 'Unknown') as market_segment, -- this is to ensure touchpoints with a null market_segment align with the goal
        'Leads' as goal_type,
        null as channel,
        count(distinct touchpoint_id) as actual_amount

    from touchpoints
    group by 1,2,3,4,5,6,7

),

pre_pipeline_opps_agg as (

    select
        created_date as date_day,
        
        -- pre-pipeline goals before FY24 were not segmented by touchpoint_source,
        -- and therefore must contain null values
        case
            when created_date >= '2023-02-01'
                then touchpoint_source
            else null
        end as touchpoint_source,

        lead_source_type as team,
        region,
        market_segment,
        'Pre-Pipeline' as goal_type,
        null as channel,
        count(distinct opportunity_id) as actual_amount
    
    from opportunities
    where opportunity_type = 'Land'
        and is_from_nurtured_opportunity = false
    group by 1,2,3,4,5,6,7

),

pipeline_opps_agg as (

    select
        discover_at_date as date_day,

        -- Pipeline goals at the touchpoint source level are only backfilled to the start of Q3 2023 (August 1, 2022)
        case
            when discover_at_date >= '2022-08-01' then touchpoint_source
            else null
        end as touchpoint_source,

        lead_source_type as team,
        region,
        market_segment,
        'Pipeline' as goal_type,
        null as channel,
        count(distinct opportunity_id) as actual_amount
    
    from opportunities
    where opportunity_type = 'Land'
        and discover_at is not null
    group by 1,2,3,4,5,6,7

),

unioned as (

    select * from touchpoints_agg
    union all
    select * from pre_pipeline_opps_agg
    union all
    select * from pipeline_opps_agg

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key(
            ['date_day',
            'touchpoint_source',
            'team',
            'region',
            'market_segment',
            'goal_type',
            'channel']
        )}} as daily_goal_id,
        *
    from unioned

),

dates_spined as (

    select
        {{ dbt_utils.generate_surrogate_key(
            ['date_day',
            'touchpoint_source',
            'team',
            'region',
            'market_segment',
            'goal_type',
            'channel']
        )}} as daily_goal_id,

        goals.*,
        all_days.date_day,
        datediff('days', goals.start_date, goals.end_date) + 1 as total_days_in_month

    from all_days
    left join goals
    where all_days.date_day between goals.start_date::date and goals.end_date::date
    
),

joined as (

    select
        dates_spined.*,
        unique_channels.source_type,
        goal_amount/total_days_in_month as daily_goal_amount,
        forecast_amount/total_days_in_month as daily_forecast_amount,
        coalesce(actual_amount,0) as actual_amount
    
    from dates_spined
    left join with_id using (daily_goal_id)
    left join unique_channels
        on dates_spined.touchpoint_source = unique_channels.event_name
    
)

select * from joined
