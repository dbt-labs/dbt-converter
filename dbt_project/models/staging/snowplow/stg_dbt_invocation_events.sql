
{{
    config(
        materialized='incremental',
        unique_key='event_id',
        cold_storage=true,
        cold_storage_date_type='relative',
        cold_storage_period=var('cold_storage_default_period'),
        cold_storage_value=var('cold_storage_default_value'),
        snowflake_warehouse = set_warehouse_config('large', 'large')
    )
}}

with invocation_events as (

    select *
    from {{ ref('stg_dbt_events') }}

    where se_category = 'dbt'
        and se_action = 'invocation'

    {{ enhanced_incremental_filters(
        ref_timestamp='_loaded_at',
        this_timestamp='_loaded_at'
    )}}
),

invocation_context as (

    select * from {{ ref('stg_dbt_invocation_contexts') }}

),

invocation_env as (

    select * from {{ ref('stg_dbt_invocation_env_contexts') }}

),

users_lookup as (

  select * from {{ ref('stg_dbt_users') }}

),

platform as (

    select * from {{ ref('stg_dbt_platform_contexts') }}

),

ip_lookup as (

    select distinct ip, source from {{ ref('ip_lookup') }}

),

resource_counts as (
    
    select * from {{ ref('stg_dbt_resource_counts') }}
    
),

-- for dbt-core>=1.5
adapter_info as (
    
    select * from {{ ref('current_snowplow_adapter_info') }}
    where 1=1
    {{ enhanced_incremental_filters(
        ref_timestamp='_loaded_at',
        this_timestamp='_loaded_at'
    )}}    
    qualify row_number() over (partition by invocation_id order by _loaded_at desc) = 1

),

-- for dbt-core>=1.5
project_info as (

    select * from {{ ref('current_snowplow_project_info') }}
    where 1=1
    {{ enhanced_incremental_filters(
        ref_timestamp='_loaded_at',
        this_timestamp='_loaded_at'
    )}}    
    qualify row_number() over (partition by invocation_id order by _loaded_at desc) = 1

),

invocation_exceptions as (

    select * from {{ ref('exceptions_2023__v1_4_scheduler_invocations') }}
    where 1=1
    {{ enhanced_incremental_filters(
        ref_timestamp='_loaded_at',
        this_timestamp='_loaded_at'
    )}}    

),

pruned_events as (

    select
        collector_tstamp,
        _loaded_at,
        user_ipaddress as ip_address,
        user_id,
        dvce_created_tstamp,
        dvce_sent_tstamp,
        event_id,
        se_category as app,
        se_label as progress,
        database_source,

        city_id

    from invocation_events

),

joined as (

    select
        pruned_events.*,

        -- this prioritizes the overriden synthetic_invocation_id value
        coalesce(
            invocation_exceptions.synthetic_invocation_id,
            invocation_context.invocation_id
        ) as invocation_id,

        users_lookup.user_name,

        case
            when invocation_context.result_type is null and pruned_events.progress = 'start'
                then 'started'
            else invocation_context.result_type
        end as result_type,

        coalesce(project_info.project_id, invocation_context.project_id) as project_id,
        coalesce(adapter_info.adapter_unique_id, invocation_context.adapter_unique_id) as adapter_unique_id,
        invocation_context.run_type,
        invocation_context.result,
        invocation_context.command,
        
        -- what do we think a "complex" dbt project looks like?
        case
            when (invocation_context.command = 'rpc' and env.environment not like 'dbt-cloud%')
                or resource_counts.count_exposures > 0
                or resource_counts.count_models >= 500
                then 3
            when invocation_context.command in ('run-operation', 'snapshot', 'archive', 'snapshot-freshness')
                or resource_counts.count_snapshots > 0
                or resource_counts.count_models >= 100
                then 2
            else 1
            end as run_complexity,
        
        invocation_context.command_options,
        invocation_context.version as dbt_version,
        regexp_substr(invocation_context.version, '[0-9]+\.[0-9]+') as dbt_minor_version,
        platform.platform,
        platform.python,
        platform.python_version,
        coalesce(env.environment, ip_lookup.source, 'manual') as run_env,
        coalesce(adapter_info.adapter_type, invocation_context.adapter_type) as adapter_type,
        
        -- only available for v0.19.1 and newer
        resource_counts.count_models,
        resource_counts.count_tests,
        resource_counts.count_snapshots,
        resource_counts.count_analyses,
        resource_counts.count_macros,
        resource_counts.count_operations,
        resource_counts.count_seeds,
        resource_counts.count_sources,
        resource_counts.count_exposures,
        resource_counts.count_metrics

    from pruned_events
    left join invocation_exceptions
        on pruned_events.event_id = invocation_exceptions.event_id
    left join invocation_context
        on pruned_events.event_id = invocation_context.event_id
    left join platform
        on pruned_events.event_id = platform.event_id
    left join invocation_env as env
        on pruned_events.event_id = env.event_id
    left join ip_lookup
        on pruned_events.ip_address = ip_lookup.ip
    left join users_lookup
        on pruned_events.user_id = users_lookup.user_id
    left join resource_counts
        on invocation_context.invocation_id = resource_counts.invocation_id
    left join project_info
        on invocation_context.invocation_id = project_info.invocation_id
    left join adapter_info
        on invocation_context.invocation_id = adapter_info.invocation_id

),

filtered as (

    select *
    from joined
    where user_id is not null
        and project_id is not null

)

select * from filtered
