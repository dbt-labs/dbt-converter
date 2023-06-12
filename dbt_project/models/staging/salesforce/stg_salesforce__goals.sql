with 

goals as (

    select * from {{ ref('base__salesforce_goals') }}
    where is_deleted = False
    -- temporary filter to focus on pre-pipeline, pipeline, and leads goals
    -- campaign will be added at a later time
        and goal_type in ('Pipeline','Pre-Pipeline', 'Leads', 'Cloud Accounts')

),

quarters as (

    select * from {{ ref('stg_salesforce__quarters') }}
    where is_deleted = False

),

months as (

    select * from {{ ref('stg_salesforce__months') }}
    where is_deleted = False

),

unpivot as (

    -- **NOTE**
    -- if you add a new dimension to base__salesforce_goals it MUST be listed in the exclude list below
    {{ dbt_utils.unpivot(
        relation = ref('base__salesforce_goals'),
        cast_to = 'float',
        exclude =  [
            'salesforce_goal_id',
            'created_by_id',
            'last_modified_by_id',
            'quarter_id',
            'month_id',
            'goal_name',
            'goal_type',
            'team',
            'market_segment',
            'touchpoint_source',
            'channel',
            'is_deleted',
            'created_at',
            'last_modified_at',
            'system_modstamp'
        ],
        remove = ['total_forecast','total_goal']
    )}}

),

cleaned as (
    -- The below cleans up region & market segment names to match those in Salesforce UI (and respective Salesforce fields in other models).
    -- This is also necessary for the `daily_goal_id` below to be created correctly (to match the same ID in fct_opportunities)
    -- Examples include USEAST -> US-East and COMMERCIAL -> Commercial
    select
        salesforce_goal_id,

        case
            when startswith(field_name,'US')
                then  -- converts us-east to US-East
                    concat(
                        left(field_name,2),
                        '-',
                        initcap(
                            substr(
                                split_part(field_name,'_',1),
                            3)
                        )
                    )
            when field_name = 'UNKNOWN_GOAL' then 'Unknown' -- converts unknown regions to same format as others
            else split_part(field_name,'_',1)
        end as region,

        sum(case
            when split_part(field_name,'_',-1) = 'FORECAST' then value
        end) as forecast_amount,

        sum(case
            when split_part(field_name,'_',-1) = 'GOAL' then value
        end) as goal_amount

    from unpivot
    group by 1,2

),

joined as (
    
    select
        goals.salesforce_goal_id,
        goals.created_by_id,
        goals.last_modified_by_id,
        goals.quarter_id,
        goals.month_id,
        
        goals.goal_name,
        goals.goal_type,
        goals.team,
        cleaned.region,
        goals.market_segment,
        goals.touchpoint_source,
        goals.channel,
        quarters.quarter_name,
        months.month_name,

        months.is_current_month,
        quarters.is_current_quarter,
        months.is_previous_month,
        quarters.is_previous_quarter,
        goals.is_deleted,

        cleaned.goal_amount,
        cleaned.forecast_amount,
        
        months.start_date,
        months.end_date,
        quarters.start_date as quarter_start_date,
        quarters.end_date as quarter_end_date,
        goals.created_at,
        goals.last_modified_at,
        goals.system_modstamp

    from goals
    left join cleaned
        on goals.salesforce_goal_id = cleaned.salesforce_goal_id
    left join months
        on goals.month_id = months.month_id
    left join quarters
        on goals.quarter_id = quarters.quarter_id

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'salesforce_goal_id',
            'region'
        ])}} as goal_id,
        *
    
    from joined
    
)

select * from final