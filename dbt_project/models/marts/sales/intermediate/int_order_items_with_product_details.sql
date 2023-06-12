with

order_items as (

    select * from {{ ref('stg_salesforce__order_items') }}
    where is_deleted = false

),

products as (

    select * from {{ ref('int_products_with_ssp_percentages') }}

),

order_items_with_product_codes as (

    select
        order_items.*,
        products.product_name,
        products.product_family,
        products.product_type,
        products.product_code,
        products.low_discount_threshold,
        products.high_discount_threshold,
        products.ssp_midpoint_percentage,
        products.credit_note_credit,
        products.credit_note_debit,
        products.invoice_credit,
        products.invoice_debit,
        products.payment_credit,
        products.payment_debit,
        products.refund_credit,
        products.refund_debit,
        products.rev_rec_credit,
        products.rev_rec_debit

    from order_items
    left join products
        on order_items.sfdc_product_id = products.product_id

),

packages as (

    select distinct
        sfdc_order_id,
        service_start_date,
        product_code as package_product_code

    from order_items_with_product_codes
    where product_code ilike '%bundle%'
        and quantity > 0
        
),

order_items_with_packages as (

    select
        order_items_with_product_codes.*,
        case
            when product_code in ('develop', 'overage_develop')
                then packages.package_product_code
            when product_code ilike '%bundle%'
                then order_items_with_product_codes.product_code
            else null
        end as package_product_code
    
    from order_items_with_product_codes
    left join packages
        on order_items_with_product_codes.sfdc_order_id = packages.sfdc_order_id
            and order_items_with_product_codes.service_start_date >= packages.service_start_date
    qualify row_number() over (partition by sfdc_order_item_id order by packages.service_start_date desc) = 1

),

with_enriched_product_id as (

    select *,
    {{ dbt_utils.generate_surrogate_key(['product_code', 'package_product_code']) }} as enriched_product_id

    from order_items_with_packages
)

select * from with_enriched_product_id