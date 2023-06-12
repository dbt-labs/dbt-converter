with

all_days as (

    select * from {{ ref('all_days') }}

),

revenue_items as (

    select * from {{ ref('fct_managed_revenue_items') }}
    where accounting_recognition_type != 'No Recognition Method Indicated'

),

invoice_lines as (

    select * from {{ ref('fct_invoice_line_items') }}
    where source = 'salesforce'
    -- Note that this filter excludes quickbooks invoices, because quickbooks flows were later replaced by salesforce
    -- and do not currently go through the revenue waterfall calculations. Stripe invoices also have not historically
    -- gone through the revenue accounting team's process for recognition. 
    
    -- Nevertheless, we wanted to use the fct_invoice_line_items model due to the number of fields the revenue recognition 
    -- build-out added to salesforce invoice lines and to ensure that invoice treatment did not fork into a flow separate
    -- from fct_invoice_line_items.

),

rev_transactions as (

    select * from {{ ref('fct_salesforce_revenue_transactions') }}

),

rev_transaction_overrides as (

    select * from {{ ref('stg_googlesheets__rev_transaction_overrides') }}

),

rev_invoice_overrides as (

    select * from {{ ref('int__enriching_rev_invoice_overrides') }}

),

rev_rpo_overrides as (

    select * from {{ ref('int__enriching_rev_rpo_overrides') }}

),

invoices_with_overrides as (

    select
        coalesce(
            rev_invoice_overrides.sfdc_rev_schedule_id,
            invoice_lines.sfdc_rev_schedule_id
        ) as sfdc_rev_schedule_id,
        coalesce(
            rev_invoice_overrides.billing_finance_period_start_date,
            invoice_lines.billing_finance_period_start_date
        ) as invoice_date,
        coalesce(
            rev_invoice_overrides.invoiced_amount,
            invoice_lines.amount
        ) as invoiced_amount,
        invoice_lines.tax_amount,
        invoice_lines.invoice_status,
        invoice_lines.created_at,
        rev_invoice_overrides.sfdc_rev_schedule_id is not null as is_override

    from invoice_lines
    -- invoice overrides are joined in by revenue schedule as some invoices are being added in addition to 
    -- salesforce-logged invoices. 
    full outer join rev_invoice_overrides
        on invoice_lines.sfdc_rev_schedule_id = rev_invoice_overrides.sfdc_rev_schedule_id
        and invoice_lines.billing_finance_period_start_date = rev_invoice_overrides.billing_finance_period_start_date
        
),

invoice_dates as (

    select 
        invoices_with_overrides.sfdc_rev_schedule_id,
        min(invoices_with_overrides.invoice_date) as first_invoice_date,
        max(invoices_with_overrides.invoice_date) as last_invoice_date

    from revenue_items
    left join invoices_with_overrides
        on revenue_items.sfdc_rev_schedule_id = invoices_with_overrides.sfdc_rev_schedule_id
    group by 1

),

service_revenue_transactions as (

    select 
        rev_transactions.sfdc_rev_schedule_id,
        rev_transactions.finance_period_start_date,
        rev_transactions.finance_period_end_date,
        rev_transactions.finance_period_end_date as recognition_date,
        SUM(rev_transactions.rev_transaction_amount) as rev_transaction_amount

    from rev_transactions
    left join revenue_items
        on rev_transactions.sfdc_rev_schedule_id = revenue_items.sfdc_rev_schedule_id
    where revenue_items.product_family = 'Services'
    group by 1,2,3

),

service_rev_transaction_period as (

    select 
        sfdc_rev_schedule_id,
        min(finance_period_start_date) as earliest_transaction_date,
        min(finance_period_end_date) as latest_transaction_date

    from service_revenue_transactions
    group by 1

),

revenue_items_with_dates as (

{% set upper_bound = "dateadd(year, 10, current_date)" %}
{% set lower_bound = "'01/01/2016'" %}

    select
        revenue_items.*,

        -- grabs earliest date
        least(
            coalesce(invoice_dates.first_invoice_date, {{ upper_bound }}),
            coalesce(service_rev_transaction_period.earliest_transaction_date, {{ upper_bound }}),
            coalesce(revenue_items.revenue_start_date, {{ upper_bound }}),
            coalesce(revenue_items.billing_period_date, {{ upper_bound }}),
            coalesce(revenue_items.sign_date, {{ upper_bound }})
        ) as accounting_start_date_with_bound,

        -- reset to nulls if the above resolve to the bound. 
        case
            when accounting_start_date_with_bound = {{ upper_bound }}
                then null
            else accounting_start_date_with_bound
        end as accounting_start_date,

        greatest(
             coalesce(invoice_dates.last_invoice_date,{{ lower_bound }}),
             coalesce(latest_transaction_date, {{ lower_bound }}),
             coalesce(revenue_end_date::date, {{ lower_bound }}),
             dateadd(year, 3, current_date)
        ) as accounting_end_date
    
    from revenue_items
    left join service_rev_transaction_period
        on revenue_items.sfdc_rev_schedule_id = service_rev_transaction_period.sfdc_rev_schedule_id
    left join invoice_dates
        on revenue_items.sfdc_rev_schedule_id = invoice_dates.sfdc_rev_schedule_id
),

invoice_items_consolidating_rebills as (

-- As only some of these fields make it into the later CTEs, this deserves context:
-- Some invoices are rebilled to address amount changes or even just renew the ask
-- to the client. The revenue team has indicated that each invoice should be represented
-- a single time, but in cases of rebill, the date should be the original invoice date
-- while the amount should be the most recent amount. 

    select distinct
        sfdc_rev_schedule_id,
        count(
            case
                when invoice_status = 'Rebilled' and not(is_override)
                    then sfdc_rev_schedule_id
                else null
            end
        ) over (partition by sfdc_rev_schedule_id) as count_rebills,
        case
            when count_rebills > 0
                then first_value(invoice_date) 
                        over (partition by sfdc_rev_schedule_id order by invoice_date, created_at)
            else invoice_date
        end as invoice_date,
        case
            when count_rebills > 0
                then last_value(invoiced_amount) 
                        over (partition by sfdc_rev_schedule_id order by created_at)
            else invoiced_amount
        end as invoiced_amount,
        case
            when count_rebills > 0
                then last_value(tax_amount) 
                        over (partition by sfdc_rev_schedule_id order by created_at)
            else tax_amount
        end as tax_amount
    
    from invoices_with_overrides

),

invoices_daily as (

    select 
        invoice_date,
        sfdc_rev_schedule_id,
        sum(invoiced_amount) as invoiced_amount,
        sum(tax_amount) as tax_amount

    from invoice_items_consolidating_rebills
    group by 1,2

),

date_spined as (

    select
        all_days.*,

        {{ dbt_utils.star(from=ref('fct_managed_revenue_items'), 
                          except=["revenue_per_day",
                                  "initial_catch_up_amount",
                                  "final_true_up_amount"],
                          relation_alias='revenue_items_with_dates') }},

        accounting_start_date,
        accounting_end_date,

        -- schedule before billing period is rolled up into initial billing date
        case
            when all_days.date_day = initial_catch_up_date and
                 revenue_items_with_dates.initial_catch_up_amount != 0
                 then revenue_items_with_dates.initial_catch_up_amount 
            else 0 
        end as initial_catch_up_in_period,

        -- schedule after supercede final date is rolled up into final billing date
        case
            when all_days.date_day = final_rollup_date 
                    and revenue_items_with_dates.final_rollup_amount != 0
                 then revenue_items_with_dates.final_rollup_amount 
                        + revenue_items_with_dates.final_true_up_amount
            else 0 
        end as final_rollup_in_period,

        -- final recognition day is adjusted to make the total correct
        case
            when final_rollup_amount != 0 -- included in final roll-up
                then 0
            when all_days.date_day = revenue_end_date
                then revenue_items_with_dates.final_true_up_amount
            else 0
        end as final_true_up_in_period,

        case
            when all_days.date_day >= revenue_start_date and
                 all_days.date_day <= revenue_end_date and
            -- cannot recognize revenue before the opportunity is closed
                 all_days.date_day >= initial_catch_up_date and
            -- cannot recognize revenue after forced roll-up
                 all_days.date_day <= final_rollup_date
                then revenue_per_day
            else 0
        end as daily_amount_in_period,

        coalesce(service_revenue_transactions.rev_transaction_amount, 0) as service_delivery_amount,

        round(
            daily_amount_in_period + 
            initial_catch_up_in_period + 
            final_rollup_in_period +
            final_true_up_in_period + 
            service_delivery_amount
        ,2) as calculated_recognized_amount,

        coalesce(
            rev_transaction_overrides.rev_transaction_amount,
            calculated_recognized_amount
         ) as recognized_amount,

        coalesce(invoices_daily.invoiced_amount, 0) as invoiced_amount,
        tax_amount

    from revenue_items_with_dates
    left join all_days
        on accounting_start_date <= all_days.date_day
        and accounting_end_date >= all_days.date_day
    left join invoices_daily
        on revenue_items_with_dates.sfdc_rev_schedule_id = invoices_daily.sfdc_rev_schedule_id
        and all_days.date_day = invoices_daily.invoice_date
    left join service_revenue_transactions
        on revenue_items_with_dates.sfdc_rev_schedule_id = service_revenue_transactions.sfdc_rev_schedule_id
        and all_days.date_day = service_revenue_transactions.recognition_date
    left join rev_transaction_overrides
        on revenue_items_with_dates.sfdc_rev_schedule_id = rev_transaction_overrides.sfdc_rev_schedule_id
        and all_days.date_day = rev_transaction_overrides.recognition_date
    -- limiting the scope of the history allows for consistent validation as the schedules and waterfalls start on the same
    -- date each time. 
    where all_days.date_day >= '03/01/2021'


),

running_totals as (

    select
       date_spined.*,

        sum(date_spined.recognized_amount) over (
            partition by date_spined.revenue_item_id
            order by date_spined.date_day
            rows between unbounded preceding and current row
        ) as rev_rec_running_total_unrounded,

        round(rev_rec_running_total_unrounded, 2) as rev_rec_running_total,

        sum(date_spined.invoiced_amount) over (
            partition by date_spined.revenue_item_id
            order by date_spined.date_day
            rows between unbounded preceding and current row
        ) as invoice_running_total_unrounded,

        round(invoice_running_total_unrounded, 2) as invoice_running_total,
        
        case
            when is_product_excluded_from_revenue_waterfalls
                then 0
            else invoice_running_total - rev_rec_running_total 
        end as deferred_revenue,

        sum(date_spined.recognized_amount) over (
            partition by date_spined.revenue_item_id
            order by date_spined.date_day
        -- accounting principles define revenue to be recognized in the trailing year as short-term 
            rows between 1 following and 365 following
        ) as short_term_deferred_revenue_unrounded,

        round(short_term_deferred_revenue_unrounded, 2) as short_term_deferred_revenue,

        deferred_revenue - short_term_deferred_revenue as long_term_deferred_revenue,
        
    -- Remaining Performance Obligations (RPOs) can be adjusted to account for known service delivery nuances.
    -- These fields enable and record those adjustments. 
        case
            --exclusions should not be included at all
            when rev_rpo_overrides.override_type = 'exclusion'
                then 0
            when date_spined.date_day < date_spined.sign_date
                then 0
            else total_order_product_amount_reflecting_overrides - rev_rec_running_total
        end as gross_remaining_performance_obligation,

        rev_rpo_overrides.is_rpo_adjusted,
        rev_rpo_overrides.is_override_error as is_rpo_override_error,
        rev_rpo_overrides.override_error_message,
        rev_rpo_overrides.override_type,

        case
            when rev_rpo_overrides.override_type = 'exclusion'
                then 0
            when rev_rpo_overrides.override_type = 'entire amount' 
                then -1 * gross_remaining_performance_obligation
            when rev_rpo_overrides.override_type = 'flat amount'
                then flat_amount
            else 0
        end as rpo_adjustment,

        gross_remaining_performance_obligation + rpo_adjustment as net_remaining_performance_obligation

    from date_spined
    left join rev_rpo_overrides
        on date_spined.sfdc_rev_schedule_id = rev_rpo_overrides.sfdc_rev_schedule_id
        and date_spined.date_day = rev_rpo_overrides.date_day

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