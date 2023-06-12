{{ config(
    materialized = 'incremental',
    unique_key = 'event_id'
) }}

with events as (

    select * from {{ ref('current_snowplow_partial_parser') }}
    
    {% if is_incremental() %}
        where _loaded_at > (select dateadd(day, -1, max(_loaded_at)) from {{ this }})
    {% endif %}
    
    qualify row_number() over (partition by event_id order by _loaded_at desc) = 1

),

categorized as (

    select *,
    
        -- https://github.com/dbt-labs/dbt/blob/develop/core/dbt/parser/manifest.py#L70-L78

        case
            when full_reparse_reason in (
                '03_vars_changed',
                '04_profile_changed',
                '05_deps_changed',
                '06_project_config_changed',
                '08_exception'
            ) then true
            when full_reparse_reason in (
                '01_version_mismatch',
                '02_file_not_found',
                '07_load_file_failure'
            ) then false
        end as is_avoidable
        
    from events
    
)

select * from categorized
