with

dbt_events as (

    select * from {{ ref('stg_dbt_events') }}

),

renamed as (

    select distinct
        city_id,
        coalesce(geo_city, '<unknown>') as city,
        coalesce(geo_region_name, '<unknown>') as region,
        coalesce(geo_region, '<unknown>') as region_code,
        coalesce(geo_country, '<unknown>') as country_code,
        concat(
            city,
            ', ',
            region_code,
            ', ',
            country_code
        ) as city_label

    from dbt_events

)

select * from renamed
