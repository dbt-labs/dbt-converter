

with keywords as (

    select * from analytics_dev.dbt_jstein.stg_google_search_console__keywords

),

with_id as (

    select
        
    
md5(cast(coalesce(cast(site_host as TEXT), '') || '-' || coalesce(cast(page_path as TEXT), '') as TEXT)) as page_id,
        *

    from keywords

)

select * from with_id