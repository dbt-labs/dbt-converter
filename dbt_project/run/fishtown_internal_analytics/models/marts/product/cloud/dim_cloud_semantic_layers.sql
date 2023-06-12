
  
    

        create or replace transient table analytics_dev.dbt_jstein.dim_cloud_semantic_layers  as
        (

with

semantic_layers as (

    -- this table has 1 row per semantic layer spun up. Has following FKs
    -- environment id
    -- project id
    -- account id
    select * from analytics_dev.dbt_jstein.stg_cloud__semantic_layers

),

-- care about this to see what version of dbt the env is using 
environments as (

    select * from analytics_dev.dbt_jstein.stg_cloud__environments

),

-- could care about this to see if metrics are defined and join with other tables
projects as (

    select * from analytics_dev.dbt_jstein.stg_cloud__projects

),

-- relevant because we want to pull in the data warehouse type
connections as (

    select * from analytics_dev.dbt_jstein.stg_cloud__connections

),

accounts as (

    select * from analytics_dev.dbt_jstein.stg_cloud__accounts
    
),

-- care about this to see if they have run the job
runs as (

    select 
        *,
        last_value(dbt_version) over (partition by account_id, environment_id order by updated_at) as latest_dbt_version
    from analytics_dev.dbt_jstein.stg_cloud__runs

),

-- care about this to see if they have run the job
runs_aggregated as (

    select
        account_id,
        environment_id,
        max(case when status = 'complete' then 1 else 0 end) as had_successful_run,
        max(latest_dbt_version) as latest_dbt_version,
        max(case when status = 'complete' then created_at end) as last_successful_run_at
    from runs
    group by 1, 2

),

-- care about this to see if they have a token created
service_tokens as (

    select 
        account_id,
        true as has_service_token
    from analytics_dev.dbt_jstein.stg_cloud__service_token
    where is_service_token_deleted = 0
    group by 1

),

joined as (

    select
        semantic_layer_id,
        semantic_layers.slug as semantic_layer_slug,
        semantic_layers.enabled as semantic_layer_enabled,
        semantic_layers.target_name as semantic_layer_target_name,
  
        environments.name as environment_name,
        accounts.name as account_name,
        projects.name as project_name,

        semantic_layers.account_id,
        semantic_layers.project_id,
        semantic_layers.environment_id,
  
        environments.database_type as cloud_backend_type,
        environments.environment_type,
        environments.dbt_version,
        case when environments.is_environment_deleted = 1 then true else false end as is_environment_deleted,

        accounts.plan as account_plan,
        accounts.plan_tier as account_plan_tier,
  
        projects.connection_id,
  
        connections.type as data_warehouse_type,
        
        service_tokens.has_service_token,

        case when runs_aggregated.had_successful_run = 1 then true else false end as had_successful_run,
        runs_aggregated.latest_dbt_version,
        runs_aggregated.last_successful_run_at,
  
        semantic_layers.created_at

    from semantic_layers
    left join environments
        on semantic_layers.account_id = environments.account_id
        and semantic_layers.project_id = environments.project_id
        and semantic_layers.environment_id = environments.environment_id
    left join projects
        on semantic_layers.account_id = projects.account_id
        and semantic_layers.project_id = projects.project_id
    left join connections
        on semantic_layers.account_id = connections.account_id
        and semantic_layers.project_id = connections.project_id
        and projects.connection_id = connections.connection_id
    left join accounts 
        on semantic_layers.account_id = accounts.account_id
    left join service_tokens
        on semantic_layers.account_id = service_tokens.account_id
    left join runs_aggregated 
        on semantic_layers.account_id = runs_aggregated.account_id
        and semantic_layers.environment_id = runs_aggregated.environment_id

)

select * from joined
        );
      
  