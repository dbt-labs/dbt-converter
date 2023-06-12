with

orders as (

    select * from {{ ref('stg_salesforce__orders') }}

),

country_region_mapping as (

    select * from {{ ref('country_to_region_mappings') }}
    where data_source = 'clearbit'

),

regions as (

    select
        orders.*,
        bill_regions.region_category as billing_region,
        ship_regions.region_category as shipping_region

    
    from orders
    left join country_region_mapping as bill_regions
        on orders.shipping_country_code = bill_regions.country_code
    left join country_region_mapping as ship_regions
        on orders.shipping_country_code = ship_regions.country_code

)

select * from regions