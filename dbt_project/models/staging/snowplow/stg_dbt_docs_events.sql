{{ config(materialized='incremental', unique_key='event_id') }}

with events as (

    select * from {{ ref('stg_snowplow_events') }}
    where app_id = 'dbt-docs'
        and is_dev_event = false
    
    {% if is_incremental() %}
        and _loaded_at > (select max(_loaded_at) from {{ this }})
    {% endif %}

),

docs_contexts as (

    select * from {{ ref('current_snowplow_dbt_docs') }}

),

regex_ids as (

    select
        *,
        regexp_substr(page_urlpath, '/accounts/([0-9]+)', 1, 1, 'e') as cloud_account_id,
        regexp_substr(page_urlpath, '/jobs/([0-9]+)', 1, 1, 'e') as cloud_job_id,
        regexp_substr(page_urlpath, '/runs/([0-9]+)', 1, 1, 'e') as cloud_run_id,
        regexp_substr(page_urlpath, '/develop/([0-9]+)', 1, 1, 'e') as cloud_develop_id

    from events

),

pruned_events as (

    select
        event_id,
        domain_sessionid as session_id,
        user_ipaddress,
        page_urlhost,
        database_source,
        event,
        event_name,
        se_action,
        se_category,
        se_label,
        se_property,
        page_title,
        page_urlpath,
        page_urlfragment,

        {{ id_hashing(
            original_column_name = 'cloud_account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'cloud_job_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'cloud_run_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'cloud_develop_id'
        ) }},

        dvce_created_tstamp,
        dvce_sent_tstamp,
        collector_tstamp,
        _loaded_at
    
    from regex_ids

),

joined as (
    
    select
        pruned_events.*,
        
        /*
            In v0.18.0, we send the `project_id` as a custom context with
            every docs event. In prior versions of dbt, we rely on a structured event
            fired when the docs site is first viewed.
        */
        
        coalesce(
            docs_contexts.project_id,
            case 
                when se_action = 'identify' and se_label = 'project_id' 
                    then se_property
            end
        ) as project_id,

        coalesce(
            docs_contexts.is_cloud_hosted,
            cloud_account_id is not null
        ) as is_cloud_hosted
    
    from pruned_events
    left join docs_contexts
        on pruned_events.event_id = docs_contexts.event_id
    
)

select * from joined
