with 

income_statement_transaction_lines as (

    select * from {{ ref('fct_income_statement_transaction_lines') }}
    where account_type_name = 'Income'
        and consolidated_general_rate_net_income_amount is not null
        and consolidated_general_rate_net_income_amount != 0
        and account_search_display_name_short = 'Self-Service Subscription'

),

overrides as (

    select * from {{ ref('stg_googlesheets_self_service_transaction_line_overrides') }}
),

stripe_invoices as (

    select * from {{ ref('fct_stripe_invoices') }}

),

aggregation as (

    select
        transaction_id,
        transaction_line_id,
        transaction_identifier,
        transaction_date,
        transaction_memo,
        transaction_line_rev_rec_start_date,
        transaction_line_rev_rec_end_date,
        stripe_invoice_id,
        sum(consolidated_general_rate_net_income_amount) as revenue_amount

    from income_statement_transaction_lines

    {{ dbt_utils.group_by(n=8) }}

    order by 3

),

revenue_calcs as (

    select
        aggregation.*,
        aggregation.transaction_date as legacy_revenue_start_date,
        day(
            last_day(
                legacy_revenue_start_date,
                'month'
            )
        ) as legacy_total_rs_days,
        dateadd('day',legacy_total_rs_days-1,legacy_revenue_start_date) as legacy_revenue_end_date,
        round(
                div0(aggregation.revenue_amount,legacy_total_rs_days),
                2
            ) as legacy_revenue_per_day,
        round(
            aggregation.revenue_amount - (legacy_revenue_per_day * legacy_total_rs_days),
            2
        ) as legacy_final_true_up_amount,

        --maintaining legacy version of revenue schedule dates to determine impact of adopting

        coalesce(
            overrides.revenue_start_date_override,
            aggregation.transaction_line_rev_rec_start_date,
            legacy_revenue_start_date
        ) as revenue_start_date,

        coalesce(
            overrides.revenue_end_date_override,
            aggregation.transaction_line_rev_rec_end_date,
            legacy_revenue_end_date
        ) as revenue_end_date,

        datediff(
            day,
            revenue_start_date,
            revenue_end_date
        )+1 as total_rs_days,

        div0(revenue_amount,total_rs_days) as unrounded_revenue_per_day,

        round(unrounded_revenue_per_day, 2) as revenue_per_day,

        revenue_amount - (revenue_per_day * total_rs_days) as final_true_up_amount

    from aggregation
    left join overrides
        on aggregation.transaction_identifier = overrides.transaction_identifier
        and aggregation.transaction_line_id = overrides.transaction_line_id

),

with_geo_data as (

    select
        revenue_calcs.*,
        stripe_invoices.billing_city,
        stripe_invoices.billing_state,
        stripe_invoices.billing_postal_code,
        stripe_invoices.billing_country,
        stripe_invoices.billing_country_code,
        stripe_invoices.billing_region
    from revenue_calcs
    left join stripe_invoices
        on revenue_calcs.stripe_invoice_id = stripe_invoices.invoice_id

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'transaction_id',
            'transaction_line_id'
        ])}} as revenue_item_id,
        *

    from with_geo_data
    
)

select * from with_id