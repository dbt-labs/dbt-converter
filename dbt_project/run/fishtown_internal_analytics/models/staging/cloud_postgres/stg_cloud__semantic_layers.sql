
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud__semantic_layers  as
        (with

source as (

    
    
    
    
    
    

    
    

        (
            select
                cast('RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.SEMANTIC_LAYER_CONFIGS' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("TARGET_NAME" as character varying(1020)) as "TARGET_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("ENABLED" as BOOLEAN) as "ENABLED" ,
                    cast("SLUG" as character varying(1020)) as "SLUG" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(1020)) as "SNOWFLAKE_ACCOUNT" 

            from RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.SEMANTIC_LAYER_CONFIGS

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MOHNZ_PUBLIC.SEMANTIC_LAYER_CONFIGS' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("TARGET_NAME" as character varying(1020)) as "TARGET_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("ENABLED" as BOOLEAN) as "ENABLED" ,
                    cast("SLUG" as character varying(1020)) as "SLUG" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(1020)) as "SNOWFLAKE_ACCOUNT" 

            from RAW.FIVETRAN_ST_MOHNZ_PUBLIC.SEMANTIC_LAYER_CONFIGS

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.SEMANTIC_LAYER_CONFIGS' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("TARGET_NAME" as character varying(1020)) as "TARGET_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("ENABLED" as BOOLEAN) as "ENABLED" ,
                    cast("SLUG" as character varying(1020)) as "SLUG" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(1020)) as "SNOWFLAKE_ACCOUNT" 

            from RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.SEMANTIC_LAYER_CONFIGS

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.SEMANTIC_LAYER_CONFIGS' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("TARGET_NAME" as character varying(1020)) as "TARGET_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("ENABLED" as BOOLEAN) as "ENABLED" ,
                    cast("SLUG" as character varying(1020)) as "SLUG" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(1020)) as "SNOWFLAKE_ACCOUNT" 

            from RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.SEMANTIC_LAYER_CONFIGS

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.semantic_layer_configs' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("TARGET_NAME" as character varying(1020)) as "TARGET_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("ENABLED" as BOOLEAN) as "ENABLED" ,
                    cast("SLUG" as character varying(1020)) as "SLUG" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("SNOWFLAKE_ACCOUNT" as character varying(1020)) as "SNOWFLAKE_ACCOUNT" 

            from raw.fivetran_dbt_cloud_postgres_public.semantic_layer_configs

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.semantic_layer_configs' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("TARGET_NAME" as character varying(1020)) as "TARGET_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("ENABLED" as BOOLEAN) as "ENABLED" ,
                    cast("SLUG" as character varying(1020)) as "SLUG" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("SNOWFLAKE_ACCOUNT" as character varying(1020)) as "SNOWFLAKE_ACCOUNT" 

            from raw.fivetran_dbt_cloud_postgres_emea_public.semantic_layer_configs

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.semantic_layer_configs' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("TARGET_NAME" as character varying(1020)) as "TARGET_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("ENABLED" as BOOLEAN) as "ENABLED" ,
                    cast("SLUG" as character varying(1020)) as "SLUG" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("SNOWFLAKE_ACCOUNT" as character varying(1020)) as "SNOWFLAKE_ACCOUNT" 

            from raw.fivetran_dbt_cloud_postgres_au_public.semantic_layer_configs

            
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
        );
      
  