with

orders as (
    
    select * from {{ ref('stg_salesforce__orders') }}
    where is_deleted = false
    
),

invoices as (

    select * from {{ ref('stg_salesforce__invoices') }}

),

order_items_aggregated as (

    select * from {{ ref('int_order_items_aggregated') }}

),

revenue_allocation_overrides as (

    select * from {{ ref('stg_googlesheets__rev_allocation_overrides') }}

),

invoices_aggregated as (

    select
        invoice_order as order_id,
        count(*) as count_of_invoices_created,
        count_of_invoices_created > 0 as has_invoices

    from invoices
    where order_id is not null
    group by 1

),

joined as (
    
    select 
        orders.*,
        revenue_allocation_overrides.ignore_revenue_reallocation,
        order_items_aggregated.includes_services,
        order_items_aggregated.includes_subscriptions,
        coalesce(invoices_aggregated.has_invoices, false) as has_invoices,
        coalesce(invoices_aggregated.count_of_invoices_created, 0) as count_of_invoices_created

    from orders
    left join order_items_aggregated
        on orders.sfdc_order_id = order_items_aggregated.sfdc_order_id
    left join invoices_aggregated
        on orders.sfdc_order_id = invoices_aggregated.order_id
    left join revenue_allocation_overrides
        on orders.order_number = revenue_allocation_overrides.order_number

)

select * from joined