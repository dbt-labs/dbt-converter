
{{
    config(
        materialized='incremental',
        unique_key='event_id',
        cold_storage=true,
        cold_storage_date_type='relative',
        cold_storage_period=var('cold_storage_default_period'),
        cold_storage_value=var('cold_storage_default_value')
    )
}}

with run_model_events as (

    select
        event_id,
        se_label as invocation_id,
        collector_tstamp,
        _loaded_at,
        dvce_created_tstamp,
        dvce_sent_tstamp

    from {{ ref('stg_dbt_events') }}
    where se_category = 'dbt' and se_action = 'run_model'

    {{ enhanced_incremental_filters(
        ref_timestamp='_loaded_at',
        this_timestamp='_loaded_at'
    )}}

),

model_executions as (

    select
        event_id,
        model_id,
        run_status,
        execution_time,
        hashed_contents as contents,
        index as model_index,
        total as model_total,
        model_materialization as materialization,
        language,
        case
            when model_materialization not in ('view', 'table', 'seed', 'incremental', 'snapshot', 'archive') then 3
            when model_materialization in ('incremental', 'snapshot', 'archive') then 2
            else 1
            end as model_complexity,
        case when run_skipped = 'true' then true else false end as skipped,
        run_error as error

    from {{ ref('stg_dbt_run_model_contexts') }}

),

invocations as (

    select distinct invocation_id, project_id from {{ ref('stg_dbt_invocation_events') }}

),

invocation_exceptions as (

    select * from {{ ref('exceptions_2023__v1_4_scheduler_invocations') }}
    where se_action = 'run_model'
    {{ enhanced_incremental_filters(
        ref_timestamp='_loaded_at',
        this_timestamp='_loaded_at'
    )}}    

),

joined as (

    select
        run_model_events.event_id,

        -- this prioritizes the overriden synthetic_invocation_id value
        coalesce(
            invocation_exceptions.synthetic_invocation_id,
            run_model_events.invocation_id
        ) as invocation_id,

        run_model_events.collector_tstamp,
        run_model_events._loaded_at,
        run_model_events.dvce_created_tstamp,
        run_model_events.dvce_sent_tstamp,

        model_executions.model_id,
        model_executions.run_status,
        model_executions.execution_time,
        model_executions.contents,
        model_executions.model_index,
        model_executions.model_total,
        model_executions.materialization,
        model_executions.language,
        model_executions.model_complexity,
        model_executions.skipped,
        model_executions.error


    from run_model_events
    left join invocation_exceptions
        on run_model_events.event_id = invocation_exceptions.event_id
    inner join model_executions
        on run_model_events.event_id = model_executions.event_id

),

projects_joined as (

    select
        joined.*,
        invocations.project_id
    
    from joined
    inner join invocations
        on joined.invocation_id = invocations.invocation_id

)

select * from projects_joined
