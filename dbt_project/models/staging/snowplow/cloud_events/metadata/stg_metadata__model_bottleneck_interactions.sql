

{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

with 

unstruct_events as (

    select * from {{ ref('current_snowplow_unstruct_event_splitter') }}
    where 1=1
    
    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif %}
    
    {% if is_incremental() %}

        and _loaded_at >= (select max(_loaded_at) from {{ this }})

    {% endif %}


),

field_extraction as (

    select
        'snowpipe' as _source,
        event_id,
        database_source,

        unstruct_event:account_id::string as account_id,
        unstruct_event:environment_id::string as environment_id,
        unstruct_event:job_id::string as job_definition_id,
        unstruct_event:project_id::string as project_id,
        unstruct_event:run_id::string as run_id,
        unstruct_event:user_id::string as user_id,
        
        unstruct_event:interaction_type::string as interaction_type,
        
        derived_tstamp::timestamp_ntz as event_at,
        _loaded_at
    
    from unstruct_events
    where event_name = 'metadata_model_bottleneck_viz_interaction'


),

final as (

    select
        _source,
        event_id,
        database_source,

        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'environment_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'job_definition_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'project_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'run_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'user_id'
        ) }},

        interaction_type,

        event_at,
        _loaded_at

    from field_extraction

)

select * from final