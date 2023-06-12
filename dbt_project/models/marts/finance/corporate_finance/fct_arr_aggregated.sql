with

subscription_transactions as ( 

    select * from {{ ref('fct_arr_waterfall') }}	

),

time_periods as ( -- get quarter definitions

    select * from {{ ref('all_days') }}
    where is_first_day_of_month = true
    and date_day <= dateadd('month', 2, date_trunc('month',current_date))
    and date_day >= '2017-07-01' --first month in fct_arr_waterfall
),

opportunities as (

    select * from {{ ref('fct_opportunities') }}
    where opportunity_type in ('Land', 'Expand', 'Renew')

),

ss_subscription_transactions as (

    select * from subscription_transactions
    where sales_channel = 'Self-Serve'

),

opportunities_extended as (

    select
        opportunity_id,
        date_trunc('month', contract_start_date) as contract_start_month,
        date_trunc('month', close_date) as land_month,
        is_closed = true and stage_name = 'Closed Lost' as is_true_closed_lost,
        is_closed = true and stage_name = 'Closed Won' as is_true_closed_won,
        is_closed = false and probability = 1 as is_not_closed_prob_1,
        is_closed = false and probability = 0 as is_not_closed_prob_0,
        is_closed = false and probability > 0 as is_not_closed_prob_grtr_0,
        case
            when (is_true_closed_lost
                    or is_not_closed_prob_0)
                and opportunity_type = 'Renew'
                and expected_arr_delta < 0
                then 'managed_churn'
            when (is_true_closed_won
                    or is_not_closed_prob_grtr_0)
                and opportunity_type in ('Renew','Expand')
                and expected_arr_delta < 0 
                then 'managed_downsell'
            when (is_true_closed_won
                    or (is_not_closed_prob_1
                        and opportunity_name not like '%In-Quarter Magic%'))
                and opportunity_type in ('Renew','Expand')
                and expected_arr_delta > 0 
                then 'managed_expansion'
            when (is_true_closed_won
                    or (is_not_closed_prob_1
                        and stage_name not like '%In-Quarter Magic%'))
                and opportunity_type in ('Land')
                then 'managed_land'
            else 'not applicable'
        end as arr_category,
        case
            when arr_category = 'managed_land'
                then land_month
            else contract_start_month
        end as arr_category_month,
        expected_arr_delta
    from opportunities
    where 
        arr_category_month <= dateadd('month', 2, date_trunc('month',current_date))
        and arr_category != 'not applicable'

),

agg_mg_arr_categories as (

    select 
        arr_category_month,
        arr_category,
        'Managed' as sales_channel,
        sum(expected_arr_delta) as arr
    from opportunities_extended
    group by 1, 2, 3

),

mg_arr_categories_pivot as (

    select 
        *
    from agg_mg_arr_categories
        pivot(sum(arr) for arr_category in ('managed_land','managed_expansion','managed_downsell','managed_churn'))
            as p

),

agg_subscription_transactions as (

    select
        close_month,
        sales_channel,
        coalesce(sum(ent_upgrade_mg),0) as ent_upgrade_mg,
        coalesce(sum(mg_ent_starting),0) as mg_starting_arr,
        coalesce(sum(ending_arr),0) as ending_arr,
        coalesce(sum(starting_arr),0) as starting_arr
    from subscription_transactions
    group by 1, 2

),

ss_agg_subscription_transactions as (

    select
        close_month,
        sales_channel,
        coalesce(sum(new_arr),0) as ss_land_arr,
        coalesce(sum(upgrade_arr),0) as ss_expand_arr,
        coalesce(sum(reactivation_arr),0) as ss_reactivation_arr,
        coalesce(sum(downgrade_arr),0) as ss_downsell_arr,
        coalesce(sum(lost_arr),0) as ss_churn_arr,
        coalesce(sum(ent_upgrade_ss),0) as ent_upgrade_ss
    from ss_subscription_transactions
    group by 1, 2

),

agg_arr_base as (

    select
        time_periods.date_day as close_month,
        time_periods.fiscal_year,
        time_periods.fiscal_quarter,
        case 
            when agg_subscription_transactions.sales_channel is not null 
                then agg_subscription_transactions.sales_channel
            when mg_arr_categories_pivot.sales_channel is not null 
                then mg_arr_categories_pivot.sales_channel
            when ss_agg_subscription_transactions.sales_channel is not null 
                then ss_agg_subscription_transactions.sales_channel
            else agg_subscription_transactions.sales_channel
        end as sales_channel,
        time_periods.is_first_day_of_fiscal_quarter,
        coalesce(agg_subscription_transactions.starting_arr,0) as starting_arr,
        coalesce(agg_subscription_transactions.ending_arr,0) as ending_arr,
        coalesce(agg_subscription_transactions.ent_upgrade_mg,0) as ent_upgrade_mg_arr,
        coalesce(agg_subscription_transactions.mg_starting_arr,0) as mg_starting_arr,
        coalesce(mg_arr_categories_pivot."'managed_churn'",0) as mg_churn_arr,
        coalesce(mg_arr_categories_pivot."'managed_downsell'",0) as mg_downsell_arr,
        coalesce(mg_arr_categories_pivot."'managed_expansion'",0) as mg_expansion_arr,
        coalesce(mg_arr_categories_pivot."'managed_land'",0) as mg_land_arr,
        coalesce(ss_agg_subscription_transactions.ss_land_arr,0) as ss_land_arr,
        coalesce(ss_agg_subscription_transactions.ss_expand_arr,0) as ss_expand_arr,
        coalesce(ss_agg_subscription_transactions.ss_reactivation_arr,0) as ss_reactivation_arr,
        coalesce(ss_agg_subscription_transactions.ss_downsell_arr,0) as ss_downsell_arr,
        coalesce(ss_agg_subscription_transactions.ss_churn_arr,0) as ss_churn_arr,
        coalesce(ss_agg_subscription_transactions.ent_upgrade_ss,0) as ent_upgrade_ss_arr
    from time_periods
    left join agg_subscription_transactions
        on time_periods.date_day = agg_subscription_transactions.close_month
    left join mg_arr_categories_pivot
        on time_periods.date_day = mg_arr_categories_pivot.arr_category_month
        and (agg_subscription_transactions.sales_channel = mg_arr_categories_pivot.sales_channel
         or agg_subscription_transactions.sales_channel is null)
    left join ss_agg_subscription_transactions
        on time_periods.date_day = ss_agg_subscription_transactions.close_month
        and ss_agg_subscription_transactions.sales_channel = agg_subscription_transactions.sales_channel

),

final as (

    select 
        {{ dbt_utils.generate_surrogate_key([
            'close_month',
            'sales_channel'
        ]) }} as aggregated_arr_id,
        *
    from agg_arr_base

)

select * from final