with

products as (

    select * from {{ ref('stg_salesforce__products') }}

),

with_ssp_ranges as (

    select
        *,
        case
            when product_family = 'Services'
                then 0.32
            else 0.40
        end as low_discount_threshold,
        case
            when product_family = 'Services'
                then -0.02
            else 0.00
        end as high_discount_threshold,
        case
            when product_family = 'Services'
                then 0.85
            else 0.80
        end as ssp_midpoint_percentage

    from products

)

select * from with_ssp_ranges