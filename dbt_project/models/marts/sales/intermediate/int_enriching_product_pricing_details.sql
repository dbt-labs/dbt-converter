with

pricing_details as (

    select * from {{ ref('stg_seeds__product_pricing_details') }}

),

with_enriched_product_id as (

    select 
        *,
    {{ dbt_utils.generate_surrogate_key(['product_code', 'package_product_code']) }} as enriched_product_id
    
    from pricing_details

)

select * from with_enriched_product_id