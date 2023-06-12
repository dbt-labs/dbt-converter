with 

order_items as (

    select * from {{ ref('int__order_items_with_revenue_test_cases') }}

),

orders as (

    select * from {{ ref('int__orders_with_revenue_test_cases') }}

),

order_items_with_discounts as (

    select
        order_items.sfdc_order_item_id,
        order_items.order_item_number,
        order_items.sfdc_order_id,
        order_items.order_number,
        order_items.opportunity_name,
        orders.includes_services as order_includes_services,
        orders.includes_subscriptions as order_includes_subscriptions,
        orders.ignore_revenue_reallocation as ignore_order_reallocation,        
        order_items.sfdc_opportunity_id,
        order_items.sfdc_product_id,
        order_items.product_name,
        order_items.quantity,
        order_items.opportunity_close_date,
        order_items.service_start_date,
        order_items.service_end_date,
        order_items.order_effective_date,
        datediff(
            'month',
            order_items.service_start_date,
            -- As contracts can run from 4/1 to 3/31, this additional day allows for
            -- the intended result of 12 months. 
            dateadd(
                    'day',
                    1,
                    order_items.service_end_date
            )
        ) as service_months,
        order_items.product_name ilike '%License%' as is_license_order_item,
        case
            when is_license_order_item
                then service_months
            else 1 
        end as periods,
        order_items.total_price as total_order_item_price,
        sum(total_order_item_price) over (partition by order_items.sfdc_order_id) as total_order_price,
        case
            when is_license_order_item
                then total_order_item_price/ order_items.quantity/ periods
            else unit_price
        end as unit_price_per_period,
        count(distinct unit_price_per_period) 
            over (partition by order_items.sfdc_order_id, sfdc_product_id)
        as product_distinct_price_points_across_order,
        order_items.list_price,
        order_items.list_price_reflecting_package,
        list_price_reflecting_package * order_items.quantity * periods as total_item_list_price,
        case 
            when total_item_list_price = 0 and total_order_item_price = 0
                then 0
            when total_item_list_price = 0 and total_order_item_price != 0
                then -1 --this is known as an uplift
            else 1 - div0(total_order_item_price, total_item_list_price) 
        end as item_level_discount,
        order_items.product_ssp_midpoint_percentage,
        order_items.product_ssp_midpoint,
        order_items.product_low_discount_threshold,
        order_items.product_high_discount_threshold,
        iff(
            item_level_discount not between order_items.product_high_discount_threshold 
                                           and order_items.product_low_discount_threshold,
            1,
            0
        ) as is_item_outside_SSP_range,
        order_items.is_override

    from order_items
    left join orders
        on order_items.sfdc_order_id = orders.sfdc_order_id

),

with_allocation as (

    select
        *,
        case
            --prior to this date, allocations were already determined externally
            when opportunity_close_date < '{{ var("allocation_activation_date") }}'
                then 'unit_price'

            -- Subscription Only orders with increasing or descreasing prices for the same product
            when order_includes_subscriptions 
                and not (order_includes_services)
                and max(product_distinct_price_points_across_order) over (partition by sfdc_order_id) > 1
                then 'timing_allocation'

            -- Subscription and service orders with items priced beyond discount thresholds    
            when order_includes_subscriptions 
                and order_includes_services
                and max(is_item_outside_SSP_range) over (partition by sfdc_order_id) = 1
                then 'ssp_allocation'
            
            else 'unit_price'
        end as order_revenue_allocation_method,

        product_ssp_midpoint * quantity * periods as calculated_order_item_ssp,
        sum(calculated_order_item_ssp) over (partition by order_items_with_discounts.sfdc_order_id) as calculated_order_ssp,

        div0( total_order_item_price, total_order_price) as priced_allocation_percentage,

        case
            when order_revenue_allocation_method = 'unit_price'
                then div0(total_order_item_price,total_order_price)
            else div0(calculated_order_item_ssp,calculated_order_ssp)
        end as revenue_allocation_percentage,

        round(revenue_allocation_percentage * total_order_price,2) as allocated_revenue,

        order_revenue_allocation_method != 'unit_price' as is_order_reallocated,
        case 
            when ignore_order_reallocation
                then false
            else allocated_revenue != total_order_item_price 
        end as is_order_item_reallocated

    from order_items_with_discounts

)

select * from with_allocation