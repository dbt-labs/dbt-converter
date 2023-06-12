{{
  config(
    materialized = 'incremental',
    unique_key = 'event_id'
    )
}}

-- capture todays date so we can compare against the incident_end_date
{% set today = modules.datetime.date.today() %}

-- the date the incident started
{% set incident_start_date = modules.datetime.date(2023, 1, 30) %}

-- the date in which the fix for the incident was finalized
{% set incident_end_date = modules.datetime.date(2023, 5, 12) %}

with

-- filters for events that occurred after the incident start date
-- also ensures that if the run date is past the invocation end date, it runs with 0 rows
dbt_events as (

    select * from {{ref('stg_snowplow_events')}}
    where app_id = 'dbt'
        and is_dev_event = false
        and dvce_created_tstamp between '{{ incident_start_date }}' and '{{ incident_end_date }}'

    {% if is_incremental() %}
        and dvce_created_tstamp >= dateadd(d,-1,(select max(dvce_created_tstamp) from {{ this }}) )

        -- the below logic ensures that this table doesn't update if the current date is greater than the fix date
        {% if today > incident_end_date %}
        limit 0
        {% endif %}

    {% endif %}

),

-- filters for events that occurred after the incident start date
-- also ensures that if the run date is past the invocation end date, it runs with 0 rows
invocation_contexts as (

    select * from {{ ref('stg_dbt_invocation_contexts') }}
    where _loaded_at between '{{ incident_start_date }}' and '{{ incident_end_date }}'

    {% if is_incremental() %}
        and _loaded_at >= dateadd(d,-1,(select max(dvce_created_tstamp) from {{ this }}) )

            -- the below logic ensures that this table doesn't update if the current date is greater than the fix date
        {% if today > incident_end_date %}
        limit 0
        {% endif %}

    {% endif %}

),

-- filters for events that occurred after the incident start date
-- also ensures that if the run date is past the invocation end date, it runs with 0 rows
invocation_env_contexts as (

    select * from {{ ref('stg_dbt_invocation_env_contexts') }}
    where _loaded_at between '{{ incident_start_date }}' and '{{ incident_end_date }}'

    {% if is_incremental() %}
        and _loaded_at >= dateadd(d,-1,(select max(dvce_created_tstamp) from {{ this }}) )

            -- the below logic ensures that this table doesn't update if the current date is greater than the fix date
        {% if today > incident_end_date %}
        limit 0
        {% endif %}

    {% endif %}

),

-- this join is required so that we can run the indexing logic over all events with the proper version/environment
joined as (

    select
        dbt_events.*,
        -- for run_model events, the invocation ID is present in the se_label, not the context
        case
            when dbt_events.se_action = 'run_model' then dbt_events.se_label
            else invocation_contexts.invocation_id
        end as invocation_id,
        invocation_contexts.version,
        invocation_env_contexts.environment

    from dbt_events
    left join invocation_contexts
        on dbt_events.event_id = invocation_contexts.event_id
    left join invocation_env_contexts
        on dbt_events.event_id = invocation_env_contexts.event_id

),

-- this filters out only invocations that occurred during a scheduler run (environment)
-- and invocations that happened on dbt major version 1, minor version 4
-- in addition, this aggregates the version/environment for the entire invocation
corrupt_invocations as (

    select distinct
        invocation_id,
        max(version) over (partition by invocation_id) as version,
        max(environment) over (partition by invocation_id) as environment

    from joined
    where se_action = 'invocation'
        and invocation_id is not null
    qualify environment ilike any (
        '%prod-deployment%',
        '%sinter-prod%',
        '%onprem-deployment%'
        )
        and version like '=1.4%'

),

-- we need to join back in the initial event stream, but retain the values from the corrupt invocations for version and environment
-- the inner join ensures we only have events that were affected
filtered_events as (

    select
        joined.* exclude (version, environment),
        corrupt_invocations.version,
        corrupt_invocations.environment

    from joined
    inner join corrupt_invocations
        on joined.invocation_id = corrupt_invocations.invocation_id

),

-- this creates an index for each invocation_id over the start action
-- this serves as the basis for the synthetic_invocation_id
indexed as (

    select
        event_id,
        invocation_id,

        sum(
            case
                when se_action = 'invocation'
                    and se_label = 'start'
                        then 1
                else 0
            end
        ) over (
            partition by invocation_id
            order by dvce_created_tstamp
            rows between unbounded preceding and current row
        ) as invocation_index,

        se_category,
        se_action,
        se_label,
        contexts,

        collector_tstamp,
        dvce_created_tstamp,
        dvce_sent_tstamp,
        _loaded_at

    from filtered_events

),

-- this creates the synthetic invocation id, which matches invocation_id` + '-' + invocation_index
final as (

    select
        event_id,
        invocation_id,
        concat(invocation_id, '-', invocation_index) as synthetic_invocation_id,

        invocation_index,
        se_category,
        se_action,
        se_label,
        contexts,

        collector_tstamp,
        dvce_created_tstamp,
        dvce_sent_tstamp,
        _loaded_at
        
    from indexed
    -- this ensures we only capture events if they are a part of an invocation with multiple starts on a single invocation
    qualify max(invocation_index) over (partition by invocation_id) > 1

)

select * from final