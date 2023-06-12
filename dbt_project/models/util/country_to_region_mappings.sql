with

iso_mappings as (

    select * from {{ ref('stg_seed__country_to_region') }}

),

clearbit_mappings as (

    select * from {{ ref('stg_seed__clearbit_country_mapping') }}

),

unioned as (

    {{ dbt_utils.union_relations(
        relations=[
            ref('stg_seed__country_to_region'),
            ref('stg_seed__clearbit_country_mapping')
        ]
    )}}

),

grouped as (

    select distinct
        country_code,
        country_name,

        case
            when _dbt_source_relation ilike '%stg_seed__country_to_region%' then 'iso'
            when _dbt_source_relation ilike '%stg_seed__clearbit_country_mapping%' then 'clearbit'
        end as data_source
    
    from unioned

),

joined as (

    select
        grouped.country_code,
        grouped.country_name,
        grouped.data_source,
        iso_mappings.region_category

    from grouped
    left join iso_mappings using (country_code)

)

select * from joined
order by 1,2