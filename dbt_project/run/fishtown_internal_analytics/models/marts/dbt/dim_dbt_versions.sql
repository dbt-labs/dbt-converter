
  
    

        create or replace transient table analytics_dev.dbt_jstein.dim_dbt_versions  as
        (

with releases as (

    select * from analytics_dev.dbt_jstein.stg_github_releases
    
),

versions as (
    
    select

        tag_name,
        regexp_substr(tag_name, '[0-9]+\.[0-9]+\.[0-9]+') as dbt_semantic_version,
        split_part(dbt_semantic_version, '.', 1) as major_version,
        split_part(dbt_semantic_version, '.', 2) as minor_version,
        split_part(dbt_semantic_version, '.', 3) as patch_version,
        regexp_substr(tag_name, 'a[0-9]+|b[0-9]+|rc[0-9]+$') as prerelease_suffix,
        prerelease as is_prerelease,
        published_at::date as release_date

    from releases
    where repository = 'dbt-labs/dbt'
      and draft = false
    
),

latest_versions as (
    
    select *,
    
        '=' || dbt_semantic_version || coalesce('-' || prerelease_suffix, '') as dbt_invocation_version,

        row_number() over (
            order by major_version::int, minor_version::int, patch_version::int, release_date
        ) as version_rank,
    
        max(case when not is_prerelease then major_version else null end)
            over () = major_version as is_latest_major,

        -- is this the latest minor release for a given major version?
        max(case when not is_prerelease then minor_version else null end)
            over (partition by major_version) = minor_version as is_latest_minor,
        
        -- is this the latest final release for a given minor version?
        max(case when not is_prerelease then patch_version else null end) over (
            partition by major_version, minor_version
        ) = patch_version as is_latest_patch,

        -- is this the latest (pre)release for a given minor version?
        row_number() over (
            partition by major_version, minor_version order by release_date desc
        ) = 1 as is_latest_for_minor_prerelease,

        -- is this latest (pre)release for a given version X.Y.Z?
        row_number() over (
            partition by dbt_semantic_version order by release_date desc
        ) = 1 as is_latest,
        
        -- minor version support period
        min(case when not is_prerelease then release_date else null end) over (
          partition by major_version, minor_version
        ) as minor_version_release_date,
        
        -- if this is v1.0+, we support it for one year after the initial minor version release
        -- if this is <1.0, we no longer officially support it in Cloud as of June 30, 2022
        case when major_version >= 1
            then dateadd('year', 1, minor_version_release_date)
            else '2022-06-30'
            end as minor_version_end_of_life_date,
        
        current_date < minor_version_end_of_life_date as is_supported_version
    
    from versions
    
)

select * from latest_versions
        );
      
  