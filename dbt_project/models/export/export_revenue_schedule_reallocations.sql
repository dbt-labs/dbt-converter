with

managed_revenue_items as (

    select * from {{ ref('fct_managed_revenue_items') }}
    where sfdc_rev_schedule_id is not null

),

subselect as (

    select
        sfdc_rev_schedule_id,
        sfdc_order_item_id,
        total_order_product_amount_raw as total_revenue_amount_raw,
        revenue_amount_reallocation_override as revenue_amount_override,
        total_order_product_amount_reflecting_overrides as total_revenue_amount_reflecting_override

    from managed_revenue_items

)

select * from subselect