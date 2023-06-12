with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.run' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.run

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.run' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.run

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.run' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.run

            
        )

        

),

blocked_by_hashing as (

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
        case
          when database_source = 'cloud'
                then id::varchar
          else md5(database_source || id)
      end as run_id,

      id as tenant_run_id,
        case
          when database_source = 'cloud'
                then value::varchar
          else md5(database_source || value)
      end as blocking_run_id,

      value as tenant_blocking_run_id

    from source,
    lateral flatten(input => source.blocked_by) blocking_run_id

),

blocked_by_agg as (

    select
        run_id,
        array_agg(blocking_run_id) as blocked_by_ids,
        array_agg(tenant_blocking_run_id) as tenant_blocked_by_ids

    from blocked_by_hashing
    group by 1

),

renamed as (

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
        case
          when database_source = 'cloud'
                then id::varchar
          else md5(database_source || id)
      end as run_id,

      id as tenant_run_id,
        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,
        case
          when database_source = 'cloud'
                then environment_id::varchar
          else md5(database_source || environment_id)
      end as environment_id,

      environment_id as tenant_environment_id,
        case
          when database_source = 'cloud'
                then job_definition_id::varchar
          else md5(database_source || job_definition_id)
      end as job_definition_id,

      job_definition_id as tenant_job_definition_id,
        case
          when database_source = 'cloud'
                then trigger_id::varchar
          else md5(database_source || trigger_id)
      end as trigger_id,

      trigger_id as tenant_trigger_id,
        case
          when database_source = 'cloud'
                then deferring_run_id::varchar
          else md5(database_source || deferring_run_id)
      end as deferring_run_id,

      deferring_run_id as tenant_deferring_run_id,
        case
          when database_source = 'cloud'
                then executed_by_thread_id::varchar
          else md5(database_source || executed_by_thread_id)
      end as executed_by_thread_id,

      executed_by_thread_id as tenant_executed_by_thread_id,
        case
          when database_source = 'cloud'
                then owner_thread_id::varchar
          else md5(database_source || owner_thread_id)
      end as owner_thread_id,

      owner_thread_id as tenant_owner_thread_id,

        status as status_code,
        status_message,
        dbt_version,
        notifications_sent,
        scribe_enabled,
        webhooks_delivered,
        
        created_at,
        should_start_at,
        dequeued_at,
        started_at,
        last_heartbeat_at,
        finished_at,
        last_checked_at,
        updated_at

    from source

),

final as (

    select
        *,

        decode(status_code,
            1, 'queued',
            3, 'running',
            10, 'complete',
            20, 'error',
            30, 'cancelled'
            )
        as status,

        case
            when status = 'error'
                then 1
            else 0
        end as is_failed_run,

        case
            when status = 'complete'
                then 1
            else 0
        end as is_successful_run,

        array_size(blocked_by_ids) as blocked_by_count

    from renamed
    left join blocked_by_agg using (run_id)

)

select * from final