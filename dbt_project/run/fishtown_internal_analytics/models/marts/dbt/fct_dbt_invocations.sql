
  
    

        create or replace transient table analytics_dev.dbt_jstein.fct_dbt_invocations  as
        (

with events as (

    select * from analytics_dev.dbt_jstein.stg_dbt_invocation_events

    where 1=1 
    

    
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    

    
    




),

model_summary as (

    select * from analytics_dev.dbt_jstein.dbt_model_summary

),

cloud_ide_sessions as (

    select * from analytics_dev.dbt_jstein.fct_cloud_ide_sessions

),

cloud_runs as (

    select * from analytics_dev.dbt_jstein.stg_cloud__runs

),

account_plan_history as (

    select * from analytics_dev.dbt_jstein.int_cloud__account_plan_history

),

invocation_starts as (

    select
        *,
        row_number() over (partition by invocation_id order by dvce_created_tstamp) as idx
    from events
    where progress in ('start', 'invalid')
    qualify idx = 1

),

invocation_ends as (

    select
        *,
        row_number() over (partition by invocation_id order by dvce_created_tstamp) as idx
    from events where progress = 'end'
    qualify idx = 1

),

rpc_tasks as (

    select * from analytics_dev.dbt_jstein.stg_dbt_rpc_tasks

),

xf as (

    select
        coalesce(
            rpc_tasks.event_id,
            invocation_starts.invocation_id
        ) as invocation_id,

        invocation_starts.invocation_id as parent_invocation_id,

        -- the below filter is temporary logic to resolve a significant bump in projects being created by Numbers Station AI
        -- we have determined that these projects are being created programmatically under the same IP address
        -- this suggests they are heavily testing their product under this one IP address, and shouldn't represent different projects
        case
            when invocation_starts.ip_address = '38.99.106.x'
                then coalesce(
                        invocation_starts.adapter_unique_id,
                        invocation_starts.project_id
                    )
            else invocation_starts.project_id
        end as project_id,

        invocation_starts.adapter_unique_id,

        coalesce(
            rpc_tasks.request_at,
            invocation_starts.collector_tstamp
        ) as started_at,

        -- only have an ended_at for standard invocations to preserve integrity
        -- of analytics related to invocation timings
        case
            when rpc_tasks.event_id is null
            then invocation_ends.collector_tstamp
        end as ended_at,
        invocation_starts.ip_address,
        invocation_starts.user_id,
        invocation_starts.user_name,
        invocation_starts.result_type as start_state,
        invocation_ends.result_type as end_state,
        invocation_starts.run_type,
        invocation_starts.result as start_result,
        invocation_ends.result as end_result,

        coalesce(
            rpc_tasks.task_type,
            invocation_starts.command
        ) as command,

        -- this boolean flag checks for whether the command occurs in an rpc server
        rpc_tasks.task_type is not null as is_command_in_rpc,

        invocation_starts.command_options,
        invocation_starts.dbt_version,
        invocation_starts.dbt_minor_version,
        invocation_starts.platform,
        invocation_starts.python,
        invocation_starts.python_version,
        invocation_starts.run_env,
        invocation_starts.database_source,
        invocation_starts.adapter_type as adapter,

        case
            when adapter in ('postgres', 'redshift', 'snowflake', 'bigquery') then 'core'
            when adapter in ('spark', 'presto') then 'fishtown_supported'
            when adapter is not null then 'community_supported'
        end as adapter_support,

        -- field used in visualization layer
        case
            when adapter_support = 'core' then invocation_starts.adapter_type
            when adapter_support is not null then 'non_core'
        end as adapter_label,
        
        -- total enabled in the project
        invocation_starts.count_models as project_count_models,
        invocation_starts.count_tests as project_count_tests,
        invocation_starts.count_snapshots as project_count_snapshots,
        invocation_starts.count_analyses as project_count_analyses,
        invocation_starts.count_macros as project_count_macros,
        invocation_starts.count_operations as project_count_operations,
        invocation_starts.count_seeds as project_count_seeds,
        invocation_starts.count_sources as project_count_sources,
        invocation_starts.count_exposures as project_count_exposures,
        invocation_starts.count_metrics as project_count_metrics,

        case
            when invocation_starts.run_env in ('sinter', 'sinter-dev', 'sinter-prod', 'dbt-cloud', 'dbt-cloud-dev', 'dbt-cloud-prod', 'dbt-cloud-onprem', 'hosted', 'bastion') then 'cloud'
            when invocation_starts.run_env = 'manual' then 'user'
            when invocation_starts.run_env in ('ci-appveyor', 'ci-circle') then 'ci'
            else invocation_starts.run_env
        end as user_type,

        --this is a flag that indicates if the user has only done a couple of
        --invocations, likely indicating that it is a docker container.
        count(*) over (
            partition by invocation_starts.user_id
         ) <= 4 as transient_user,

        -- this is a flag to check long-running RPC session, which means this likely is not a Cloud IDE RPC session.
        case
            when count(*) over (partition by parent_invocation_id) > 1000
                and count(distinct started_at::date) over (
                    partition by parent_invocation_id) > 2
                        then true
            else false
        end as is_busy_rpc_server,

        -- models actually executed this invocation
        model_summary.languages_used,
        model_summary.count_models,
        model_summary.count_changed,
        model_summary.count_skip,
        model_summary.count_error,
        model_summary.count_succeed,
        model_summary.count_view_models,
        model_summary.count_table_models,
        model_summary.count_incremental_models,
        model_summary.count_custom_materialization_models,
        model_summary.count_seeds,
        model_summary.count_snapshots,
        model_summary.count_python,

        greatest(
            coalesce(invocation_starts.run_complexity, 1),
            coalesce(model_summary.model_complexity, 1)
        ) as complexity,

        invocation_starts.city_id,

        case
            when invocation_starts.run_env in (
                'manual',
                'ci-appveyor',
                'ci-circle',
                'circle'
            )
                then 'core'
            when invocation_starts.run_env ilike any (
                '%prod-deployment%',
                '%sinter-prod%',
                '%onprem-deployment%',
                '%prod-development%',
                '%onprem-development%'
            ) 
                then 'cloud'
        end as distribution,

        case
            when invocation_starts.run_env in (
                'manual',
                'ci-appveyor',
                'ci-circle',
                'circle'
            )
                then 'core'
            when invocation_starts.run_env ilike any (
                '%prod-deployment%',
                '%sinter-prod%',
                '%onprem-deployment%'
            ) 
                then 'scheduler'
            when invocation_starts.run_env ilike any (
                '%prod-development%',
                '%onprem-development%'  
            )
                then 'ide'
        end as product,

        invocation_starts.run_env ilike '%onprem%' as is_single_tenant,

        case
            when distribution = 'cloud' and product = 'scheduler'
            then (try_cast(split_part(invocation_starts.run_env, '-', 5) as integer))::varchar
        end as run_id_raw,

        case
            when distribution = 'cloud' and product = 'ide'
            then (try_cast(split_part(invocation_starts.run_env, '-', 5) as integer))::varchar
        end as develop_request_id_raw,

        coalesce(invocation_ends.idx, 0) = 1 as is_completed_invocation

    from invocation_starts
    left outer join model_summary
        on model_summary.invocation_id = invocation_starts.invocation_id
    left outer join invocation_ends
        on invocation_ends.invocation_id = invocation_starts.invocation_id
    -- this join intentionally fans some records out
    left outer join rpc_tasks
        on rpc_tasks.invocation_id = invocation_starts.invocation_id

    where not (is_single_tenant and invocation_starts.database_source = 'cloud')

),

id_hashing as (

    select
        *,
        case
          when database_source = 'cloud'
                then run_id_raw::varchar
          else md5(database_source || run_id_raw)
      end as run_id,

      run_id_raw as tenant_run_id,
        case
          when database_source = 'cloud'
                then develop_request_id_raw::varchar
          else md5(database_source || develop_request_id_raw)
      end as develop_request_id,

      develop_request_id_raw as tenant_develop_request_id
    
    from xf

),

final as (

    select 
        id_hashing.*,
        coalesce(
            cloud_ide_sessions.account_id,
            cloud_runs.account_id
        ) as cloud_account_id,
        cloud_ide_sessions.project_id as cloud_project_id,
        account_plan_history.plan,
        account_plan_history.plan_tier,
        case
            when user_name is not null or user_type != 'user' then TRUE
            else FALSE
        end as internal,
        
    
md5(cast(coalesce(cast(project_id as TEXT), '') || '-' || coalesce(cast(adapter_unique_id as TEXT), '') as TEXT)) as inferred_project_id

    from id_hashing
    left join cloud_ide_sessions using (develop_request_id)
    left join cloud_runs using (run_id)
    left join account_plan_history 
        on account_plan_history.account_id = coalesce(
            cloud_ide_sessions.account_id,
            cloud_runs.account_id
        )
        and id_hashing.started_at >= account_plan_history.start_date
        and id_hashing.started_at < account_plan_history.end_date

)

select * from final
        );
      
  