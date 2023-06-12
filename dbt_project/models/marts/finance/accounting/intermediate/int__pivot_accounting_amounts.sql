with

accounting_daily as (

    select * from {{ ref('fct_managed_accounting_activity') }}
    where date_day is not null

),

accounting_pivot as (
    select
        revenue_item_id,
        {{ dbt_utils.pivot(
            'applicable_month_end',
            dbt_utils.get_column_values(
                ref('fct_managed_accounting_activity'), 
                'applicable_month_end',
                order_by='applicable_month_end'
            ),
            agg='sum',
            then_value='recognized_amount',
            suffix='_revenue_recognized'
        ) }},
        {{ dbt_utils.pivot(
            'applicable_month_end',
            dbt_utils.get_column_values(
                ref('fct_managed_accounting_activity'), 
                'applicable_month_end',
                order_by='applicable_month_end'
            ),
            agg='sum',
            then_value='invoiced_amount',
            suffix='_invoiced'
        ) }},
        {{ dbt_utils.pivot(
            'applicable_month_end',
            dbt_utils.get_column_values(
                ref('fct_managed_accounting_activity'), 
                'applicable_month_end',
                order_by='applicable_month_end'
            ),
            agg='sum',
            then_value='case
                            when
                                is_last_day_of_month
                                then deferred_revenue
                            else null
                        end',
            suffix='_deferred_revenue'
        ) }},
        {{ dbt_utils.pivot(
            'applicable_month_end',
            dbt_utils.get_column_values(
                ref('fct_managed_accounting_activity'), 
                'applicable_month_end',
                order_by='applicable_month_end'
            ),
            agg='sum',
            then_value='case
                            when
                                is_last_day_of_month
                                then net_remaining_performance_obligation
                            else null
                        end',
            suffix='_remaining_performance_obligation'
        ) }}
    from accounting_daily
    group by revenue_item_id

)

select * from accounting_pivot