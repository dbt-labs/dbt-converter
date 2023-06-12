with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.develop_request' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.develop_request

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.develop_request' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.develop_request

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.develop_request' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.develop_request

            
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
      end as develop_request_id,

      id as tenant_develop_request_id,
        case
          when database_source = 'cloud'
                then user_id::varchar
          else md5(database_source || user_id)
      end as user_id,

      user_id as tenant_user_id,
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
                then project_id::varchar
          else md5(database_source || project_id)
      end as project_id,

      project_id as tenant_project_id,

        status as status_id,
        status_message,

        case status
            when 1 then 'starting'
            when 2 then 'environment setup'
            when 3 then 'profile setup'
            when 4 then 'deps setup'
            when 10 then 'running'
            when 11 then 'ready'
            when 19 then 'stopping'
            when 20 then 'stopped ok'
            when 21 then 'stopped error'
        end as status_name,

        case
            when status_name = 'stopped error'
                then 1
            else 0
        end as is_failed_session,
        case
            when status_name = 'stopped ok'
                then 1
            else 0
        end as is_successful_session,

        -- could eventually determine dbt_minor_version from dbt_version = 'HEAD' by created_at date
        concat(regexp_substr(dbt_version, '(\\d+\\.+\\d+)'), '.x') as dbt_minor_version,

        upper(dbt_version) as dbt_version,
        container_version,
        pv_storage_class,

        created_at,
        environment_setup_started_at,
        profile_setup_started_at,
        deps_setup_started_at,
        running_at,
        first_successful_health_check_at::timestamp_ntz as first_successful_health_check_at,
        first_successful_filetree_request_at::timestamp_ntz as first_successful_filetree_request_at,
        ready_at::timestamp_ntz as ready_at,
        last_request_at,
        stopping_at,
        stopped_at,
        updated_at

    from source

)

select * from renamed