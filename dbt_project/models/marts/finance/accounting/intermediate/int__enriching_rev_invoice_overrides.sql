with 

overrides as (

    select * from {{ ref('stg_googlesheets__rev_invoice_overrides') }}

),

salesforce_schedules as (

    select * from {{ ref('stg_salesforce__rev_schedules') }}

),

salesforce_order_items as (

    select * from {{ ref('stg_salesforce__order_items') }}

),


enriched as (

    select
        salesforce_schedules.sfdc_rev_schedule_id,
        salesforce_order_items.sfdc_order_item_id,
        overrides.revenue_schedule_code,
        overrides.order_number,
        overrides.order_item_number,
        overrides.credit_note,
        overrides.billing_finance_period_start_date,
        overrides.invoiced_amount,
        overrides.comment

    from overrides
    left join salesforce_schedules
        on overrides.revenue_schedule_code = salesforce_schedules.revenue_schedule_code
    left join salesforce_order_items
        on overrides.order_item_number = salesforce_order_items.order_item_number

)

select * from enriched