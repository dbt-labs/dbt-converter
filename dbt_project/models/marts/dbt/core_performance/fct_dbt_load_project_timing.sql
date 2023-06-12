{{ config(
    materialized = 'incremental',
    unique_key = 'event_id'
) }}

with timing as (
    
    select * from {{ ref('current_snowplow_load_all_timing') }}
    
    {% if is_incremental() %}
        where _loaded_at > (select dateadd(day, -1, max(_loaded_at)) from {{ this }})
    {% endif %}
    
    qualify row_number() over (partition by event_id order by _loaded_at desc) = 1
    
),

parent_invocations as (
    
    -- for RPC parent_invocations with many tasks, we only want one record per
    -- pick the first one
    select * from {{ ref('fct_dbt_invocations') }}
    qualify row_number() over (partition by parent_invocation_id order by started_at) = 1 
    
),

joined as (
    
    select
    
        timing.*,
        parent_invocations.dbt_version,
        parent_invocations.user_id,
        parent_invocations.transient_user,
        parent_invocations.user_type,
        parent_invocations.product,
        parent_invocations.started_at as invocation_started_at,
        parent_invocations.ended_at as invocation_ended_at
    
    from timing
    left join parent_invocations    
        on timing.invocation_id = parent_invocations.parent_invocation_id
    
)

select * from joined
