with 

daily_snapshot as (

    select * from {{ ref('stg_cloud__accounts_snapshot_daily') }}

),

fct_arr_waterfall as (

    select * from {{ ref('fct_arr_waterfall') }}
    where sales_channel = 'Self-Serve'

),

all_days as (

    select * from {{ ref('all_days') }}
    where is_first_day_of_month = true

),

dim_customers as (

    select * from {{ ref('dim_customers') }}

),

first_plan as (

    select 
        account_id,
        min(date_day) as first_team_plan_date
    from daily_snapshot
    where plan_tier = 'team'
    group by 1

),

joined as (

    select
        fct_arr_waterfall.close_month,
        all_days.fiscal_year,
        all_days.fiscal_quarter,
        fct_arr_waterfall.sales_channel,
        fct_arr_waterfall.customer_id,
        fct_arr_waterfall.customer_name,
        (coalesce(fct_arr_waterfall.starting_arr, 0) 
            + coalesce(fct_arr_waterfall.gross_arr_total, 0) 
            + coalesce(fct_arr_waterfall.churn_arr_total, 0)
        ) as sum_starting_gross_churn,
        case
            when fct_arr_waterfall.ent_upgrade_ss is not null 
                then 'moved_channel_ss_to_mg'
            when fct_arr_waterfall.new_arr is not null 
                or date_trunc('month', first_plan.first_team_plan_date) = fct_arr_waterfall.close_month 
                then 'land'
            when sum_starting_gross_churn = 0
                then 'churn'
            when (fct_arr_waterfall.starting_arr > fct_arr_waterfall.ending_arr) 
                and sum_starting_gross_churn > 0
                then 'contract'
            when (fct_arr_waterfall.starting_arr < fct_arr_waterfall.ending_arr) 
                and sum_starting_gross_churn > 0
                then 'expand'
            when fct_arr_waterfall.reactivation_arr is not null 
                then 'reactivate'
            when sum_starting_gross_churn = fct_arr_waterfall.starting_arr 
                or (fct_arr_waterfall.starting_arr - fct_arr_waterfall.ending_arr) = 0 
                then 'return'
            else 'unknown'
        end as customer_activity_type
    from fct_arr_waterfall
    inner join all_days
        on fct_arr_waterfall.close_month = all_days.date_day
    inner join dim_customers
        on fct_arr_waterfall.customer_id = dim_customers.customer_id
    left join first_plan
        on dim_customers.cloud_account_id = first_plan.account_id

),

final as (

    select 
        {{ dbt_utils.generate_surrogate_key([
            'close_month',
            'customer_id',
            'sales_channel'
        ]) }} as customer_activity_id,
        *
    from joined

)

select * from final
