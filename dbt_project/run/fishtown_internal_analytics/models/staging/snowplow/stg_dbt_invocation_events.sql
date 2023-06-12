
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_dbt_invocation_events  as
        (

with invocation_events as (

    select *
    from analytics_dev.dbt_jstein.stg_dbt_events

    where se_category = 'dbt'
        and se_action = 'invocation'

    

    
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    

    
    



),

invocation_context as (

    select * from analytics_dev.dbt_jstein.stg_dbt_invocation_contexts

),

invocation_env as (

    select * from analytics_dev.dbt_jstein.stg_dbt_invocation_env_contexts

),

users_lookup as (

  select * from analytics_dev.dbt_jstein.stg_dbt_users

),

platform as (

    select * from analytics_dev.dbt_jstein.stg_dbt_platform_contexts

),

ip_lookup as (

    select distinct ip, source from analytics_dev.dbt_jstein.ip_lookup

),

resource_counts as (
    
    select * from analytics_dev.dbt_jstein.stg_dbt_resource_counts
    
),

pruned_events as (

    select
        collector_tstamp,
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
        invocation_context.invocation_id,
        users_lookup.user_name,

        case
            when result_type is null and pruned_events.progress = 'start'
                then 'started'
            else result_type
        end as result_type,

        invocation_context.project_id,
        invocation_context.adapter_unique_id,
        run_type,
        result,
        command,
        
        -- what do we think a "complex" dbt project looks like?
        case
            when (command = 'rpc' and env.environment not like 'dbt-cloud%')
                or resource_counts.count_exposures > 0
                or resource_counts.count_models >= 500
                then 3
            when command in ('run-operation', 'snapshot', 'archive', 'snapshot-freshness')
                or resource_counts.count_snapshots > 0
                or resource_counts.count_models >= 100
                then 2
            else 1
            end as run_complexity,
        
        command_options,
        version as dbt_version,
        regexp_substr(version, '[0-9]+\.[0-9]+') as dbt_minor_version,
        platform.platform,
        platform.python,
        platform.python_version,
        coalesce(env.environment, ip_lookup.source, 'manual') as run_env,
        invocation_context.adapter_type,
        
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

),

filtered as (

    select *
    from joined
    where user_id is not null
        and project_id is not null

)

select * from filtered
        );
      
  