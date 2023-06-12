with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.run_trigger' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.run_trigger

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.run_trigger' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.run_trigger

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.run_trigger' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.run_trigger

            
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
      end as trigger_id,

      id as tenant_trigger_id,
        case
          when database_source = 'cloud'
                then job_definition_id::varchar
          else md5(database_source || job_definition_id)
      end as job_definition_id,

      job_definition_id as tenant_job_definition_id,

        case
            when github_pull_request_id or gitlab_merge_request_id or azure_pull_request_id is not null
                then 'pull request'
            when cause = 'scheduled'
                then 'scheduled'
            when cause ilike 'Kicked off from UI by %'
                then 'manual'
            when cause ilike 'Kicked off from the UI by %'
                then 'manual'
            else 'api'
        end as trigger_type,

        -- user-supplied
        cause as trigger_cause,

        trigger_type = 'pull request' as is_pull_request_build,
        trigger_type = 'scheduled' as is_scheduled_run,
        trigger_type = 'api' as is_api_triggered,

        -- present if the run is kicked off via a webhook, else null
        coalesce (github_pull_request_id, gitlab_merge_request_id, azure_pull_request_id) as pull_request_number,
        case
            when github_pull_request_id is not null then 'github'
            when gitlab_merge_request_id is not null then 'gitlab'
            when azure_pull_request_id is not null then 'azure'
            else null
        end as pull_request_source,

        -- this will be set to a non-null value if:
        -- 1. this is a webhook build for a pull request, or
        -- 2. there is a custom branch configured for the environment, or
        -- 3. this run was triggered via the API with a custom branch parameter
        coalesce(git_branch, '<default>') as git_branch,

        -- this will be set to a non-null value if:
        -- 1. this is a webhook build for a pull request, or
        -- 2. this run was triggered via the API with a custom branch parameter
        git_sha,

        schema_override,
        steps_override,
        timeout_seconds_override,
        threads_override,
        generate_docs_override,
        target_name_override,

        created_at

    from source

)

select * from renamed