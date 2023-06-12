
{{ config(materialized='incremental') }}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    se_label as invocation_id,
    context:project_id::varchar as project_id,
    
    -- total
    context:load_all_elapsed::float as load_all_elapsed,
    
    -- steps
    context:load_macros_elapsed::float as load_macros_elapsed,
    context:read_files_elapsed::float as read_files_elapsed,
    context:parse_project_elapsed::float as parse_project_elapsed,
    context:patch_sources_elapsed::float as patch_sources_elapsed,
    context:process_manifest_elapsed::float as process_manifest_elapsed,
    
    -- file count
    context:path_count::int as path_count,
    context:parsed_path_count::int as parsed_path_count,
    
    -- optimizations
    context:is_partial_parse_enabled::boolean as is_partial_parse_enabled,
    context:is_static_analysis_enabled::boolean as is_static_analysis_enabled,
    context:static_analysis_parsed_path_count::int as static_analysis_parsed_path_count,
    context:static_analysis_path_count::int as static_analysis_path_count

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'load_all_timing'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
