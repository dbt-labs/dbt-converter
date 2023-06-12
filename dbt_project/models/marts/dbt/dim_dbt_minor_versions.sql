with releases as (

    select * from {{ref('dim_dbt_versions')}}
    
),

minor_versions as (
    
    select

        major_version,
        minor_version,
        major_version || '.' || minor_version as dbt_minor_version,
        min(release_date) as release_date

    from releases
    where is_prerelease = false
    group by 1,2,3
    
)

select * from minor_versions
