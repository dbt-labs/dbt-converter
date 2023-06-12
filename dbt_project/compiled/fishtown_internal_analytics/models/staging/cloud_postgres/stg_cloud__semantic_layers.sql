with

source as (

    
    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.semantic_layer_configs' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.semantic_layer_configs

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.semantic_layer_configs' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.semantic_layer_configs

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.semantic_layer_configs' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.semantic_layer_configs

            
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
      end as semantic_layer_id,

      id as tenant_semantic_layer_id,
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

        target_name,
        state,
        snowflake_account,
        enabled,
        slug,

        created_at,
        updated_at

    from source

)

select * from renamed