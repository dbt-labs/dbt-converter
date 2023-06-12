with

iso_mappings as (

    select * from analytics_dev.dbt_jstein.stg_seed__country_to_region

),

clearbit_mappings as (

    select * from analytics_dev.dbt_jstein.stg_seed__clearbit_country_mapping

),

unioned as (

    
    

        (
            select
                cast('analytics_dev.dbt_jstein.stg_seed__country_to_region' as TEXT) as _dbt_source_relation,

                
                    cast("COUNTRY_CODE" as character varying(16777216)) as "COUNTRY_CODE" ,
                    cast("COUNTRY_NAME" as character varying(16777216)) as "COUNTRY_NAME" ,
                    cast("REGION_CATEGORY" as character varying(16777216)) as "REGION_CATEGORY" 

            from analytics_dev.dbt_jstein.stg_seed__country_to_region

            
        )

        union all
        

        (
            select
                cast('analytics_dev.dbt_jstein.stg_seed__clearbit_country_mapping' as TEXT) as _dbt_source_relation,

                
                    cast("COUNTRY_CODE" as character varying(16777216)) as "COUNTRY_CODE" ,
                    cast("COUNTRY_NAME" as character varying(16777216)) as "COUNTRY_NAME" ,
                    cast(null as character varying(16777216)) as "REGION_CATEGORY" 

            from analytics_dev.dbt_jstein.stg_seed__clearbit_country_mapping

            
        )

        

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