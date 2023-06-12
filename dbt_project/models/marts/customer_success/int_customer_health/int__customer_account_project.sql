with

invocations as (

    select * from {{ ref('fct_dbt_invocations') }}

),

cloud_mappings as (

    select * from {{ ref('cloud_account_mappings') }}
    where is_current_paying_account

),

project_activity as (

    select * from {{ ref('fct_dbt_project_activity') }}
),

models_agg as (

    select
        cloud_account_id,
        sum(
            case when started_at::date between dateadd(day, -60, current_date()) and dateadd(day, -31, current_date())
            and product = 'scheduler'
            and command in ('build', 'run')
                then count_succeed
            else 0
        end) as models_built_prev_t30d,

        sum(
            case when started_at::date between dateadd(day, -31, current_date()) and current_date()
                and product = 'scheduler'
             and command in ('build', 'run')
                then count_succeed
            else 0
        end) as models_built_t30d,

        sum(
            case when started_at::date between dateadd(day, -61, current_date()) and current_date()
                and product = 'scheduler'
             and command in ('build', 'run')
                then count_succeed
            else 0
        end) as models_built_t60d,

        sum(
            case when started_at::date between dateadd(day, -91, current_date()) and current_date()
                and product = 'scheduler'
             and command in ('build', 'run')
                then count_succeed
            else 0
        end) as models_built_t90d,

--TODO AFTER WAWAS
--we should add their core invocations pulled from the future 
--`fct_dbt_wh_adapter_activity` -- this will allow us to see
--if they are developing on Core.

        max(
            case when count_changed > 0 then started_at
            else null
        end) as last_model_changed_at

    from invocations
    group by 1

),

--this cte is at the project grain to see if any projects in an account are growing based on model count
--this gets all the days that an account had a project that grew, which is then filtered in the next cte
project_growth as (

    select 
        max_cloud_account_id as cloud_account_id,
        project_id,
        date_day,

        lag(max_project_count_models)
            over(
                partition by max_cloud_account_id, project_id 
                order by date_day
            ) as prior_model_count,

        case
            when prior_model_count < max_project_count_models then 1
            else 0
        end as has_project_grown

    from project_activity
    qualify
        has_project_grown = 1 

),

account_project_growth as (

    select
        cloud_account_id,
        max(date_day) as last_project_growth_at
    from project_growth
    group by 1
),

customers_joined as (

    select
        cloud_mappings.customer_id,
        models_agg.*,
        account_project_growth.last_project_growth_at

    from models_agg
    inner join cloud_mappings 
        on models_agg.cloud_account_id = cloud_mappings.account_id
    left join account_project_growth 
        on cloud_mappings.account_id = account_project_growth.cloud_account_id

),

project_usage_agg as (

    select
        customer_id,
        sum(models_built_prev_t30d) as models_built_prev_t30d,
        sum(models_built_t30d) as models_built_t30d,
        sum(models_built_t60d) as models_built_t60d,
        sum(models_built_t90d) as models_built_t90d,
        max(last_project_growth_at) as last_project_growth_at,
        max(last_model_changed_at) as last_model_changed_at

    from customers_joined
    group by 1

),

final as (

    select
        *,
        round(
            (models_built_t30d - models_built_prev_t30d)/nullif(models_built_prev_t30d,0),
            4
        ) as models_built_pct_change

    from project_usage_agg

)

select * from final