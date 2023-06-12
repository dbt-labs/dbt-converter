with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_webhooks_postgres_public.events' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_public.events

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_webhooks_postgres_emea_public.events' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_emea_public.events

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_webhooks_postgres_au_public.events' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_au_public.events

            
        )

        
),

payload_extraction as (
    select
        
    lower(split_part(_dbt_source_relation, '.', 2)) as database_schema,

    case
        when database_schema ilike 'fivetran_st%'
            then regexp_replace(database_schema, 'fivetran_st_|_public', '')
        when database_schema in ('fivetran_dbt_cloud_postgres_public', 'fivetran_webhooks_postgres_public')
            then 'cloud'
        when database_schema in ('fivetran_dbt_cloud_postgres_emea_public', 'fivetran_webhooks_postgres_emea_public')
            then 'cloud_emea'
        when database_schema in ('fivetran_dbt_cloud_postgres_au_public', 'fivetran_webhooks_postgres_au_public')
            then 'cloud_au'
    end as database_source,

    case
        when database_schema ilike 'fivetran_st%'
            then 'single-tenant'
        else 'multi-tenant'
    end as database_type

    -- tenancy region
    -- tenancy provider

,
        account_id,
        id,
        subscription_id,
        payload,
        coalesce(payload:data:dbtVersion, payload:run:fields:dbtVersion) as dbt_version,
        coalesce(payload:data:environmentId, payload:run:fields:environmentId) as environment_id,
        coalesce(payload:data:environmentName, payload:run:fields:environmentName) as environment_name,
        coalesce(payload:data:jobId, payload:run:fields:jobId) as job_id,
        coalesce(payload:data:jobName, payload:run:fields:jobName) as job_name,
        coalesce(payload:data:projectId, payload:run:fields:projectId) as project_id,
        coalesce(payload:data:projectName, payload:run:fields:projectName) as project_name,
        coalesce(payload:data:runId, payload:run:fields:runId) as job_run_id,
        coalesce(payload:data:runReason, payload:run:fields:runReason) as job_run_reason,
        coalesce(payload:data:runStartedAt, payload:run:fields:runStartedAt) as job_run_started_at,
        coalesce(payload:data:runStatus, payload:run:fields:runStatus) as job_run_status,
        coalesce(payload:data:runStatusCode, payload:run:fields:runStatusCode) as job_run_status_code,
        coalesce(payload:data:runStatusMessage, payload:run:fields:runStatusMessage) as job_run_status_message,

        trigger_event_type,
        http_status_code,

        created_at,
        updated_at
    from source
),

hashed_source as (
    select
        database_schema,
        database_source,
        database_type,
        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,
        dbt_version,
        
        case
          when database_source = 'cloud'
                then id::varchar
          else md5(database_source || id)
      end as event_id,

      id as tenant_event_id,
        case
          when database_source = 'cloud'
                then subscription_id::varchar
          else md5(database_source || subscription_id)
      end as subscription_id,

      subscription_id as tenant_subscription_id,

        case
          when database_source = 'cloud'
                then environment_id::varchar
          else md5(database_source || environment_id)
      end as environment_id,

      environment_id as tenant_environment_id,
        environment_name,

        case
          when database_source = 'cloud'
                then project_id::varchar
          else md5(database_source || project_id)
      end as project_id,

      project_id as tenant_project_id,
        project_name,

        case
          when database_source = 'cloud'
                then job_id::varchar
          else md5(database_source || job_id)
      end as job_id,

      job_id as tenant_job_id,
        job_name,

        case
          when database_source = 'cloud'
                then job_run_id::varchar
          else md5(database_source || job_run_id)
      end as job_run_id,

      job_run_id as tenant_job_run_id,
        job_run_reason,
        job_run_started_at,
        job_run_status,
        job_run_status_code,
        job_run_status_message,

        trigger_event_type,
        http_status_code,

        created_at,
        updated_at
    from payload_extraction
),

dedupe as (

    select *
    from hashed_source
    qualify row_number() over (partition by event_id order by created_at desc) = 1

)

select * from dedupe