

with events as (

    select * from analytics_dev.dbt_jstein.stg_snowplow_events
    where app_id = 'dbt-docs'
        and is_dev_event = false
    
    

),

docs_contexts as (

    select * from analytics_dev.dbt_jstein.current_snowplow_dbt_docs

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

        case
          when database_source = 'cloud'
                then cloud_account_id::varchar
          else md5(database_source || cloud_account_id)
      end as cloud_account_id,

      cloud_account_id as tenant_cloud_account_id,
        case
          when database_source = 'cloud'
                then cloud_job_id::varchar
          else md5(database_source || cloud_job_id)
      end as cloud_job_id,

      cloud_job_id as tenant_cloud_job_id,
        case
          when database_source = 'cloud'
                then cloud_run_id::varchar
          else md5(database_source || cloud_run_id)
      end as cloud_run_id,

      cloud_run_id as tenant_cloud_run_id,
        case
          when database_source = 'cloud'
                then cloud_develop_id::varchar
          else md5(database_source || cloud_develop_id)
      end as cloud_develop_id,

      cloud_develop_id as tenant_cloud_develop_id,

        dvce_created_tstamp,
        dvce_sent_tstamp,
        collector_tstamp
    
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