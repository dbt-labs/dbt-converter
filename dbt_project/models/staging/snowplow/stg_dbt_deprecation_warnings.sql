with deprecation_warn as (

    select * from {{ ref('current_snowplow_deprecation_warn') }}
    where 1=1

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif%}
    
    {% if is_incremental() %}

        and _loaded_at >= (select max(installed_at) from {{ this }})

    {% endif %}


),

start_events as (

    select distinct
        invocation_id,
        project_id,
        adapter_type,
        version
    
    from {{ ref('current_snowplow_invocation') }}
    where progress = 'start'

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif %}
    
    {% if is_incremental() %}

        and _loaded_at >= (select max(installed_at) from {{ this }})

    {% endif %}

),



joined as (

    select
        deprecation_warn.event_id,
        deprecation_warn._loaded_at as warned_at,
        deprecation_warn.deprecation_name,

        start_events.project_id,
        start_events.adapter_type,
        start_events.version as dbt_version

    from deprecation_warn

    left join start_events
        on deprecation_warn.invocation_id = start_events.invocation_id

)

select * from joined
