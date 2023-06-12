with dbt_cities as (

    select * from {{ ref('stg_dbt_cities') }}

),

region_category as (

    select * from {{ ref('country_to_region_mappings') }}
    -- here we are forcing ISO-type country names since this best aligns with what Snowplow uses
    where data_source = 'iso'

),

server_farm_cities as (

    select * from {{ ref('stg_server_farm_cities') }}

),

invocations as (

    select * from {{ ref('stg_dbt_invocation_events') }}

),

invocations_aggregated as (

    select
        city_id,
        count(*) as all_time_invocations

    from invocations

    group by 1

),

final as (

    select
        dbt_cities.*,
        region_category.country_name,
        region_category.region_category,

        coalesce(
            server_farm_cities.is_server_farm,
            false
        ) as is_server_farm,

        coalesce(
            invocations_aggregated.all_time_invocations,
            0
        ) as all_time_invocations,

        rank() over (
            order by coalesce(all_time_invocations, 0) desc
        ) as city_rank

    from dbt_cities
    left join region_category using (country_code)
    left join server_farm_cities using (city, region_code, country_code)
    left join invocations_aggregated using (city_id)

)

select * from final
