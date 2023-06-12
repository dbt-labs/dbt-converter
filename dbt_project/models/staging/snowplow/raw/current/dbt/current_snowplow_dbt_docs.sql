{{
    config(
        materialized='incremental',
        unique_key='event_id',
        can_be_window_built='true',
        cold_storage=true,
        cold_storage_date=var('cold_storage_default_date'),
    )
}}

select
    'snowpipe' as _source,
    _loaded_at::timestamp_ltz as _loaded_at,

    event_id,
    context:core_project_id::string as project_id,
    context:is_cloud_hosted::boolean as is_cloud_hosted

from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'dbt_docs'    
    {{ enhanced_incremental_filters(
         ref_timestamp='_loaded_at',
         this_timestamp='_loaded_at'
     )}}
