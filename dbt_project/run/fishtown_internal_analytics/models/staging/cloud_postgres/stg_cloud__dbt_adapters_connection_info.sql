
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud__dbt_adapters_connection_info  as
        (with

source as (

    
    
    
    
    

    
    

        (
            select
                cast('RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.DBT_ADAPTER_CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("CONNECTION_ID" as NUMBER(38,0)) as "CONNECTION_ID" ,
                    cast("CONNECTION_DETAILS" as VARIANT) as "CONNECTION_DETAILS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ADAPTER_ID" as NUMBER(38,0)) as "ADAPTER_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.DBT_ADAPTER_CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.DBT_ADAPTER_CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("CONNECTION_ID" as NUMBER(38,0)) as "CONNECTION_ID" ,
                    cast("CONNECTION_DETAILS" as VARIANT) as "CONNECTION_DETAILS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ADAPTER_ID" as NUMBER(38,0)) as "ADAPTER_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.DBT_ADAPTER_CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.DBT_ADAPTER_CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("CONNECTION_ID" as NUMBER(38,0)) as "CONNECTION_ID" ,
                    cast("CONNECTION_DETAILS" as VARIANT) as "CONNECTION_DETAILS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ADAPTER_ID" as NUMBER(38,0)) as "ADAPTER_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.DBT_ADAPTER_CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.dbt_adapter_connection_info' as TEXT) as _dbt_source_relation,

                
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("CONNECTION_ID" as NUMBER(38,0)) as "CONNECTION_ID" ,
                    cast("CONNECTION_DETAILS" as VARIANT) as "CONNECTION_DETAILS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ADAPTER_ID" as NUMBER(38,0)) as "ADAPTER_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from raw.fivetran_dbt_cloud_postgres_public.dbt_adapter_connection_info

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.dbt_adapter_connection_info' as TEXT) as _dbt_source_relation,

                
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("CONNECTION_ID" as NUMBER(38,0)) as "CONNECTION_ID" ,
                    cast("CONNECTION_DETAILS" as VARIANT) as "CONNECTION_DETAILS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ADAPTER_ID" as NUMBER(38,0)) as "ADAPTER_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from raw.fivetran_dbt_cloud_postgres_emea_public.dbt_adapter_connection_info

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.dbt_adapter_connection_info' as TEXT) as _dbt_source_relation,

                
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("CONNECTION_ID" as NUMBER(38,0)) as "CONNECTION_ID" ,
                    cast("CONNECTION_DETAILS" as VARIANT) as "CONNECTION_DETAILS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ADAPTER_ID" as NUMBER(38,0)) as "ADAPTER_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from raw.fivetran_dbt_cloud_postgres_au_public.dbt_adapter_connection_info

            
        )

        

),

renamed as (

    select
        
    lower(split_part(_dbt_source_relation, '.', 2)) as database_schema,

    case
        when database_schema ilike 'fivetran_st%'
            then regexp_replace(database_schema, 'fivetran_st_|_public', '')
        when database_schema = 'fivetran_dbt_cloud_postgres_public'
            then 'cloud'
        when database_schema = 'fivetran_dbt_cloud_postgres_emea_public'
            then 'cloud_emea'
        when database_schema = 'fivetran_dbt_cloud_postgres_au_public'
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
        );
      
  