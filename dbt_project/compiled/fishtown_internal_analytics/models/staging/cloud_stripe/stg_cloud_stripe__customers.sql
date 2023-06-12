with

stripe_customers as (

    select * from analytics_dev.dbt_jstein.base__cloud_stripe_customers

),

region_lookup as (

    select * from analytics_dev.dbt_jstein.stg_seed__country_to_region

),

joined as (

    select
        stripe_customers.*,
        region_lookup.region_category as address_region_category,
        region_lookup.country_name as address_country_name

    from stripe_customers
    left join region_lookup
        on stripe_customers.address_country = region_lookup.country_code

)

select * from joined