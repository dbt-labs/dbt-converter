with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.repository' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.repository

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.repository' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.repository

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.repository' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.repository

            
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
      end as repository_id,

      id as tenant_repository_id,
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
                then deploy_key_id::varchar
          else md5(database_source || deploy_key_id)
      end as deploy_key_id,

      deploy_key_id as tenant_deploy_key_id,
        case
          when database_source = 'cloud'
                then github_installation_id::varchar
          else md5(database_source || github_installation_id)
      end as github_installation_id,

      github_installation_id as tenant_github_installation_id,
        case
          when database_source = 'cloud'
                then repository_credentials_id::varchar
          else md5(database_source || repository_credentials_id)
      end as repository_credentials_id,

      repository_credentials_id as tenant_repository_credentials_id,

        --dimensions
        full_name,
        state,
        remote_backend,

        remote_url,
        git_clone_strategy,
        pull_request_url_template,

        
    case
        when state = 2
            then 1
        else 0
    end as is_repo_deleted
,

        case
            -- these are more reliable than looking at the url for self-hosted deployments
            when git_clone_strategy = 'deploy_token' then 'GitLab'
            when git_clone_strategy = 'github_app' then 'GitHub'

            when remote_url ilike '%github%' then 'GitHub'
            when remote_url ilike '%bitbucket%' then 'Bitbucket'
            when remote_url ilike '%gitlab%' then 'GitLab'
            when remote_url ilike '%codecommit%' then 'CodeCommit'
            when remote_url ilike '%visualstudio%' then 'Visual Studio'
            when remote_url ilike '%azure%' then 'Azure'
            else 'Other'
        end as git_provider,

        case    
            when remote_backend = 'managed' then 1 
            else 0
        end as is_managed_repo,

        --timestamps
        created_at,
        updated_at

    from source

)

select * from renamed