{{ config(
    materialized='incremental',
    unique_key = 'event_id'
) }}

with

snowplow_context as (

    select * from {{ ref('current_snowplow_context_splitter') }}

),

final as (

    select
        'snowpipe' as _source,
        _loaded_at::timestamp_ltz as _loaded_at,
        
        event_id,
        se_label as invocation_id,
        context:task::string as task_type,
        collector_tstamp as request_at

    from snowplow_context

    where context_type = 'rpc_request'
        and task_type in (
            'run',
            'test',
            'docs.generate',
            'deps',
            'seed',
            'snapshot',
            'compile'
        )

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif %}

    {% if is_incremental() %}

        and _loaded_at >= (select max(_loaded_at) from {{ this }})

    {% endif %}

)

select * from final
