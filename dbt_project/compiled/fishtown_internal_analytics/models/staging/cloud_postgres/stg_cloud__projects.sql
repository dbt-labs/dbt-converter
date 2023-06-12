with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.project' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.project

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.project' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.project

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.project' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.project

            
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
      end as project_id,

      id as tenant_project_id,
        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,
        case
          when database_source = 'cloud'
                then connection_id::varchar
          else md5(database_source || connection_id)
      end as connection_id,

      connection_id as tenant_connection_id,
        case
          when database_source = 'cloud'
                then repository_id::varchar
          else md5(database_source || repository_id)
      end as repository_id,

      repository_id as tenant_repository_id,
        case
          when database_source = 'cloud'
                then docs_job_id::varchar
          else md5(database_source || docs_job_id)
      end as docs_job_id,

      docs_job_id as tenant_docs_job_id,
        case
          when database_source = 'cloud'
                then freshness_job_id::varchar
          else md5(database_source || freshness_job_id)
      end as freshness_job_id,

      freshness_job_id as tenant_freshness_job_id,
        
        name,

        state,
        
    case
        when state = 2
            then 1
        else 0
    end as is_project_deleted
,
        
        dbt_project_subdirectory,

        created_at,
        updated_at
        
    from source

)

select * from renamed