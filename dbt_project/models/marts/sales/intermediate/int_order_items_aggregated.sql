with

order_items as (

    select * from {{ ref('int_order_items_with_product_details') }}

),

aggregated as (

    select 
        sfdc_order_id,
        count(
            case
                when product_family ilike '%Services%'
                    then sfdc_order_item_id
                else null
            end
        ) as count_of_service_order_items,
        count_of_service_order_items > 0 as includes_services,
        count(
            case
                when product_family ilike '%Licenses%'
                    then sfdc_order_item_id
                else null
            end
        ) as count_of_subscription_order_items,
        count_of_subscription_order_items > 0 as includes_subscriptions

    from order_items
    group by 1

)

select * from aggregated