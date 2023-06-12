/*
    WHY THIS MODEL?
    
    dbt Cloud deploys each version of dbt Core in a dedicated runtime (Docker) image.
    
    When dbt Cloud users select their version of dbt Core, they are *actually* selecting
    one of the runtime images available in Cloud.
    
    The grain of this model is one row per runtime image offered in dbt Cloud.
    
    Prior to v1.0, Cloud offers a 1:1 mapping between Core final releases and Cloud images.
    
    Starting in v1.0+, Cloud offers two images per Core minor release.
    
    Also, the naming convention for these images changed between v1.0 and v1.1+.
*/

with dbt_core_versions as (

    select * from {{ ref('dim_dbt_versions') }}
    
),

/*
    Starting in v1.0, we have *two* runtime images in dbt Cloud for every *one*
    minor version of dbt Core.
    
      - "Latest": always install the latest (final) patch of this minor version.
      - "Pre": always install the latest (pre)release of this minor version.
    
    Because dbt Cloud image names must be valid semantic versions, we distinguish
    between these two images by naming them with valid SemVer suffixes:
    
      - "Latest": "1.X.0-latest"
      - "Pre":    "1.X.0-pre"
    
    Say that we've released a final version of v1.1.1, and we have a release candidate of v1.1.2-rc1.
    In that case:
    
      - "1.1.0-latest" image will install dbt-core v1.1.1
      - "1.1.0-pre" image will install dbt-core v1.1.2-rc1
      
    Is this an ideal system? No!! But it's what we can do for now, until we have a dedicated Runtime.
*/

image_types as (
  
    select 'pre' as image_type
    union all
    select 'latest' as image_type
  
),

grain as (
  
    select *
    from dbt_core_versions
    left join image_types
        on dbt_core_versions.major_version >= 1
        and (
                (
                    -- The "pre" image will install the latest (pre)release patch for
                    -- this minor version (DOES include prereleases)
                    image_types.image_type = 'pre' and
                    dbt_core_versions.is_latest_for_minor_prerelease
                )
                    or
                (
                    -- The "latest" image will install the latest (final) patch for
                    -- this minor version (does NOT include prereleases)
                    image_types.image_type = 'latest' 
                    and dbt_core_versions.is_latest_patch
                    and not dbt_core_versions.is_prerelease
                )
          )
  
),
    
image_names as (
  
    select

        case
            
            -- general rule: e.g. 1.1.0-pre, 1.1.0-latest
            when major_version >= 1 and minor_version >= 1
                then major_version || '.' || minor_version || '.0-' || image_type
            
            -- exception: naming for v1.0 -- we were still figuring this out
            when image_type = 'pre' and major_version = 1 and minor_version = 0 and is_latest_for_minor_prerelease
                then '1.0.1'
            when image_type = 'latest' and major_version = 1 and minor_version = 0 and is_latest_patch and not is_prerelease
                then '1.0.0'
            
            -- older versions
            when major_version = 0 and not is_prerelease
                then dbt_semantic_version
            
            else null
            end as version_image_name,
            
        dbt_semantic_version || coalesce(prerelease_suffix,'') as installed_dbt_core_version,
        minor_version_end_of_life_date as end_of_support_date,
        is_supported_version,
        is_latest_major,
        is_latest_minor,
        is_latest_patch
            
    from grain
        
),

final as (

    select * from image_names
    where version_image_name is not null
    
    union all
    
    select
        'development (HEAD)' as version_image_name,
        null as installed_dbt_core_version,
        null as end_of_support_date,
        1 as is_supported_version,
        1 as is_latest_major,
        1 as is_latest_minor,
        1 as is_latest_patch
    
)

select * from final
