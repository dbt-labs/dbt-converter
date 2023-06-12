{{
    config(
        snowflake_warehouse = set_warehouse_config('large')
    )
}}

{% set window = 'partition by project_id order by started_at' %}

{% set resource_types = ['models', 'tests', 'snapshots', 'analyses', 
    'macros', 'operations', 'seeds', 'sources', 'exposures', 'metrics'] %}


with invocations as (

    select * from {{ref('fct_dbt_invocations')}}
    where is_completed_invocation

),

windowed as (

    select *,
    
        first_value(city_id) over ({{ window }}) as first_city_id,

        row_number() over (
                partition by project_id
                order by started_at
        ) as project_invocation_number,
        
        last_value(cloud_account_id) ignore nulls over ({{ window }}) as last_cloud_account_id,
        last_value(plan) ignore nulls over ({{ window }}) as last_cloud_account_plan,
        last_value(plan_tier) ignore nulls over ({{ window }}) as last_cloud_account_plan_tier,
        
        {% for resource_type in resource_types %}
        
        last_value(project_count_{{ resource_type }}) over ({{ window }})
            as {{ resource_type }} {{ ',' if not loop.last }}
        
        {% endfor %}

    from invocations

),

aggregated as (

    select
        project_id,
        first_city_id as city_id,
        last_cloud_account_id,
        last_cloud_account_plan,
        last_cloud_account_plan_tier,
        {{ resource_types | join(',\n') }},

        min(started_at) as first_run_at,

        {{ dbt_utils.pivot(
            column='distribution',
            values=['core', 'cloud'],
            agg='min',
            then_value='started_at',
            else_value='null',
            prefix='first_',
            suffix='_run',
            quote_identifiers=false
        ) }},

        {{ dbt_utils.pivot(
            column='product',
            values=['ide', 'scheduler'],
            agg='min',
            then_value='started_at',
            else_value='null',
            prefix='first_',
            suffix='_run',
            quote_identifiers=false
        ) }},

        {{ dbt_utils.pivot(
            column='plan',
            values=['trial', 'developer', 'free', 'team', 'enterprise'],
            agg='min',
            then_value='started_at',
            else_value='null',
            prefix='first_',
            suffix='_run',
            quote_identifiers=false
        ) }},
        
        max(started_at) as last_run_at,
        count(*) as total_invocations,
        max(complexity) as project_complexity,
        max(languages_used) as languages_used,
        max(dbt_minor_version) as dbt_minor_version,

        count(distinct
            case
                when transient_user = false and user_type = 'user'
                    then user_id
            end
        ) as distinct_users,

        max(
            case
                when coalesce(count_python,0) > 0
                    then 1
                else 0 
            end
        ) as has_used_python,

        max(
            case
                when distribution = 'cloud'
                    then 1
                else 0 
            end
        ) as has_used_cloud,

        min(
            case
                when project_invocation_number >= 100
                    then started_at
            end
        ) as first_activated_at

    from windowed
    {{ dbt_utils.group_by(15) }}

),

final as (

    select
        *,

        case
            when total_invocations > 100
                then 1
            else 0
        end as activated,

        case
            when metrics > 0
                then 1 
            else 0
        end as has_metrics_enabled,

        case first_run_at
            when first_trial_run
                then 'trial'
            when first_developer_run
                then 'developer'
            when first_team_run
                then 'team'
            when first_enterprise_run
                then 'enterprise'
            else 'core'
        end as first_invocation_plan,

        case first_run_at
            when first_cloud_run
                then 'cloud'
            else 'core'
        end as first_invocation_distribution


    from aggregated

)

select * from final
