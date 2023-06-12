with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.dbt_adapter_connection_info' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.dbt_adapter_connection_info

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.dbt_adapter_connection_info' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.dbt_adapter_connection_info

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.dbt_adapter_connection_info' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.dbt_adapter_connection_info

            
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
      end as connection_adapter_id,

      id as tenant_connection_adapter_id,
        case
          when database_source = 'cloud'
                then adapter_id::varchar
          else md5(database_source || adapter_id)
      end as adapter_id,

      adapter_id as tenant_adapter_id,
        case
          when database_source = 'cloud'
                then connection_id::varchar
          else md5(database_source || connection_id)
      end as connection_id,

      connection_id as tenant_connection_id,

        connection_details,
        
        created_at,
        updated_at
    

    from source

)

select * from renamed