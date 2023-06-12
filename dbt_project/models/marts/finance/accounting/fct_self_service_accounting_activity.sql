with 

all_days as (

    select * from {{ ref('all_days') }}

),

revenue_items as (

    select * from {{ ref('fct_self_service_revenue_items') }}

),

revenue_items_with_dates as (

    select
        *,
        least(
            revenue_start_date,
            transaction_date
        ) as accounting_start_date,
        -- accounting needs a record at the end of the month. 
        greatest(
            last_day(revenue_end_date, month),
            last_day(transaction_date, month)
        ) as accounting_end_date

    from revenue_items

),

date_spined as (

    select
        all_days.*,
        revenue_items_with_dates.*,

        -- final recognition day is adjusted to make the total correct
        case
            when all_days.date_day = revenue_items_with_dates.revenue_end_date
                then revenue_items_with_dates.final_true_up_amount
            else 0
        end as final_true_up_in_period,

        case
            when all_days.date_day >= revenue_items_with_dates.revenue_start_date and
                 all_days.date_day <= revenue_items_with_dates.revenue_end_date
                then revenue_per_day
            else 0
        end as daily_amount_in_period,

        round(
            daily_amount_in_period + final_true_up_in_period,
            2
        ) as recognized_amount,

        case
            when all_days.date_day = revenue_items_with_dates.revenue_start_date
                then revenue_items_with_dates.revenue_amount
            else 0
        end as invoiced_amount,

        --maintaining legacy version of revenue schedule dates to determine impact of adopting

        case
            when all_days.date_day = revenue_items_with_dates.transaction_line_rev_rec_end_date
                then revenue_items_with_dates.legacy_final_true_up_amount
            else 0
        end as legacy_final_true_up_in_period,

        case
            when all_days.date_day >= revenue_items_with_dates.transaction_line_rev_rec_start_date and
                 all_days.date_day <= revenue_items_with_dates.transaction_line_rev_rec_end_date
                then legacy_revenue_per_day
            else 0
        end as legacy_daily_amount_in_period,

        round(
            legacy_daily_amount_in_period + legacy_final_true_up_in_period,
            2
        ) as legacy_recognized_amount

    from revenue_items_with_dates
    left join all_days
        on revenue_items_with_dates.accounting_start_date <= all_days.date_day
        and revenue_items_with_dates.accounting_end_date >= all_days.date_day

),

running_totals as (

    select
        *,

        sum(recognized_amount) over (
            partition by revenue_item_id
            order by date_day
            rows between unbounded preceding and current row
        ) as rev_rec_running_total_unrounded,

        round(rev_rec_running_total_unrounded, 2) as rev_rec_running_total,

        sum(invoiced_amount) over (
            partition by revenue_item_id
            order by date_day
            rows between unbounded preceding and current row
        ) as invoice_running_total_unrounded,

        round(invoice_running_total_unrounded, 2) as invoice_running_total,

        invoice_running_total - rev_rec_running_total as deferred_revenue,

        sum(recognized_amount) over (
            partition by revenue_item_id
            order by date_day
         -- accounting principles define revenue to be recognized in the trailing year as short-term 
            rows between 1 following and 365 following
        ) as short_term_deferred_revenue_unrounded,

        round(short_term_deferred_revenue_unrounded, 2) as short_term_deferred_revenue,

        deferred_revenue - short_term_deferred_revenue as long_term_deferred_revenue,
        revenue_amount - rev_rec_running_total as remaining_performance_obligation,

        --staging netsuite version of revenue schedule dates to determine impact of adopting

        sum(legacy_recognized_amount) over (
            partition by revenue_item_id
            order by date_day
            rows between unbounded preceding and current row
        ) as legacy_rev_rec_running_total,

        invoice_running_total - legacy_rev_rec_running_total as legacy_deferred_revenue,

        sum(legacy_recognized_amount) over (
            partition by revenue_item_id
            order by date_day
         -- accounting principles define revenue to be recognized in the trailing year as short-term 
            rows between 1 following and 365 following
        ) as legacy_short_term_deferred_revenue,

        legacy_deferred_revenue - legacy_short_term_deferred_revenue as legacy_long_term_deferred_revenue,
        revenue_amount - legacy_rev_rec_running_total as legacy_remaining_performance_obligation

    from date_spined

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'revenue_item_id'
        ])}} as id,
        * exclude (
            rev_rec_running_total_unrounded,
            invoice_running_total_unrounded,
            short_term_deferred_revenue_unrounded
        )

    from running_totals
    
)

select * from with_id