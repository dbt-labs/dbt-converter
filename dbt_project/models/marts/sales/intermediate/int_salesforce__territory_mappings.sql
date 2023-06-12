with

territory_countries as (

    select * from {{ ref('stg_salesforce__territory_countries') }}
    where is_deleted = false

),

territory_states as (

    select * from {{ ref('stg_salesforce__territory_states') }}
    where is_deleted = false

),

territory_zipcodes as (

    select * from {{ ref('stg_salesforce__territory_zipcodes') }}
    where is_deleted = false

),

territories as (

    select * from {{ ref('stg_salesforce__territories') }}

),

region_lookup as (

    select * from {{ ref('country_to_region_mappings') }}

),

unique_regions as (

    select
        country_code,
        country_name
    
    from region_lookup
    group by 1,2

),

joined as (

    select
        coalesce(
            territory_zipcodes.territory_id,
            territory_states.territory_id,
            territory_countries.territory_id
        ) as territory_id,

        territory_zipcodes.territory_zipcode_id,
        territory_states.territory_state_id,
        territory_countries.territory_country_id,

        territory_zipcodes.zipcode,
        territory_zipcodes.city,
        territory_states.state_province,
        territory_countries.country_name

    from territory_countries
    left join territory_states
        on territory_countries.territory_country_id = territory_states.territory_country_id
    left join territory_zipcodes
        on territory_states.territory_state_id = territory_zipcodes.territory_state_id

),

enriched as (

    select
        joined.*,
        unique_regions.country_code,
        territories.territory_name,
        territories.territory_theater,
        territories.territory_region
    
    from joined
    left join territories
        on joined.territory_id = territories.territory_id
    left join unique_regions
        on joined.country_name = unique_regions.country_name

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'territory_zipcode_id',
            'territory_state_id',
            'territory_country_id'
        ]) }} as territory_mapping_id,
        *

    from enriched
)

select * from final