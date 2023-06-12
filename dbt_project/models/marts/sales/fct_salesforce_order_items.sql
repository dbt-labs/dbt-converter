with

order_items as (
    
    select * from {{ ref('int_order_items_with_product_details') }}
    
),

orders as (

    select * from {{ ref('int_salesforce_orders_joined') }}

),

product_pricing_details as (

    select * from {{ ref('int_enriching_product_pricing_details') }}

),

revenue_schedules as (

    select * from {{ ref('stg_salesforce__rev_schedules') }}
    where is_deleted = false
    
),

opportunities as (
    
    select * from {{ ref('stg_salesforce__opportunities') }}
    
),

schedules_aggregated as (

    select
        sfdc_order_item_id as order_item_id,
        count(distinct sfdc_rev_schedule_id) as count_of_schedules,
        count_of_schedules > 0 as has_schedules

    from revenue_schedules
    where sfdc_order_item_id is not null
    group by 1

),

joined as (

    select
        order_items.sfdc_order_item_id,
        order_items.order_item_number,
        order_items.sfdc_order_id,
        orders.order_number,
        orders.order_status,
        opportunities.opportunity_name,
        opportunities.close_date as opportunity_close_date,
        order_items.service_start_date,
        order_items.service_end_date,
        order_items.product_name,
        order_items.product_family,
        order_items.product_type,
        order_items.product_code,
        order_items.quantity,
        order_items.list_price,
        coalesce(
            product_pricing_details.list_price,
            order_items.list_price
         ) as list_price_reflecting_package,
        order_items.unit_price,
        order_items.total_price,
        coalesce(
            product_pricing_details.low_discount_threshold,
            order_items.low_discount_threshold
        ) as product_low_discount_threshold,
        coalesce(
            product_pricing_details.high_discount_threshold,
            order_items.high_discount_threshold
        ) as product_high_discount_threshold,
        coalesce(
            product_pricing_details.ssp_midpoint_percentage,
            order_items.ssp_midpoint_percentage
        ) as product_ssp_midpoint_percentage,

        round(list_price_reflecting_package * product_ssp_midpoint_percentage, 2) as product_ssp_midpoint,

        coalesce(schedules_aggregated.has_schedules, false) as has_schedules,
        orders.sfdc_opportunity_id,
        orders.sfdc_account_id,
        order_items.sfdc_product_id,
        order_items.enriched_product_id,
        orders.effective_date as order_effective_date,
        orders.po_number,
        orders.po_required,
        orders.order_type,
        orders.order_status_code,
        order_items.credit_note_credit,
        order_items.credit_note_debit,
        order_items.invoice_credit,
        order_items.invoice_debit,
        order_items.payment_credit,
        order_items.payment_debit,
        order_items.refund_credit,
        order_items.refund_debit,
        order_items.rev_rec_credit,
        order_items.rev_rec_debit,

        orders.billing_city,
        orders.billing_state,
        orders.billing_state_code,
        orders.billing_postal_code,
        orders.billing_country,
        orders.billing_country_code,
        orders.billing_region,
        orders.shipping_city,
        orders.shipping_state,
        orders.shipping_state_code,
        orders.shipping_postal_code,
        orders.shipping_country,
        orders.shipping_country_code,
        orders.shipping_region

    from order_items
    left join schedules_aggregated
        on order_items.sfdc_order_item_id = schedules_aggregated.order_item_id
    left join product_pricing_details
        on order_items.enriched_product_id = product_pricing_details.enriched_product_id
    left join orders
        on order_items.sfdc_order_id = orders.sfdc_order_id
    left join opportunities
        on orders.sfdc_opportunity_id = opportunities.opportunity_id
        
)

select * from joined