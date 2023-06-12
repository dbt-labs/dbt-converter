with

revenue_transactions as (

    select * from {{ ref('stg_salesforce__rev_transactions') }}
    where is_deleted = False

),

revenue_schedules as (

    select * from {{ ref('stg_salesforce__rev_schedules') }}
    where is_deleted = False

),

finance_periods as (

    select * from {{ ref('stg_salesforce__rev_finance_period') }}
    where is_deleted = False

),

joined as (

    select
        sfdc_rev_transaction_id,
        revenue_transaction_code,
        revenue_schedule_code,
        rev_transaction_amount,
        status,
        finance_periods.period_start_date as finance_period_start_date,
        finance_periods.period_end_date as finance_period_end_date,

        revenue_transactions.sfdc_rev_finance_period_id,
        revenue_transactions.sfdc_rev_schedule_id,
        revenue_transactions.sfdc_rev_rec_treatment_id,
        revenue_transactions.sfdc_order_item_id

    from revenue_transactions
    left join revenue_schedules 
        on revenue_transactions.sfdc_rev_schedule_id = revenue_schedules.sfdc_rev_schedule_id
    left join finance_periods
        on revenue_transactions.sfdc_rev_finance_period_id = finance_periods.sfdc_rev_finance_period_id

)

select * from joined