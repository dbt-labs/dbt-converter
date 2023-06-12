with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.job_definition' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.job_definition

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.job_definition' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.job_definition

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.job_definition' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.job_definition

            
        )

        

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
      end as job_definition_id,

      id as tenant_job_definition_id,
        case
          when database_source = 'cloud'
                then environment_id::varchar
          else md5(database_source || environment_id)
      end as environment_id,

      environment_id as tenant_environment_id,
        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,
        case
          when database_source = 'cloud'
                then project_id::varchar
          else md5(database_source || project_id)
      end as project_id,

      project_id as tenant_project_id,
        case
          when database_source = 'cloud'
                then deferring_job_definition_id::varchar
          else md5(database_source || deferring_job_definition_id)
      end as deferring_job_definition_id,

      deferring_job_definition_id as tenant_deferring_job_definition_id,

        name,
        state,
        execute_steps,
        generate_docs,
        cron,

        -- There are a few records with the below string values in place for NULL. This logic ensure they resolve to NULL.
        case
            when dbt_version in ('','null','NULL','None') then null
            else dbt_version
        end as dbt_version,

        date_definition_type,
        time_definition_type,
        triggers_github_webhook,
        triggers_git_provider_webhook,
        triggers_schedule,
        settings_target_name,
        settings_threads,

        
    case
        when state = 2
            then 1
        else 0
    end as is_job_definition_deleted
,

        created_at,
        updated_at

    from source

)

select * from renamed