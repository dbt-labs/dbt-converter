
  
    

        create or replace transient table analytics_dev.dbt_jstein.base__cloud_userpermissions_snapshot  as
        (with

unioned as (

    
    

        (
            select
                cast('analytics_dev.snapshots.cloud_userpermissions_snapshot' as TEXT) as dbt_snapshot_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("LEVEL" as NUMBER(38,0)) as "LEVEL" ,
                    cast("LICENSE_TYPE" as character varying(16777216)) as "LICENSE_TYPE" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("_SDC_BATCHED_AT" as TIMESTAMP_TZ) as "_SDC_BATCHED_AT" ,
                    cast("_SDC_EXTRACTED_AT" as TIMESTAMP_TZ) as "_SDC_EXTRACTED_AT" ,
                    cast("_SDC_RECEIVED_AT" as TIMESTAMP_TZ) as "_SDC_RECEIVED_AT" ,
                    cast("_SDC_SEQUENCE" as NUMBER(38,0)) as "_SDC_SEQUENCE" ,
                    cast("_SDC_TABLE_VERSION" as NUMBER(38,0)) as "_SDC_TABLE_VERSION" ,
                    cast("DBT_SCD_ID" as character varying(32)) as "DBT_SCD_ID" ,
                    cast("DBT_UPDATED_AT" as TIMESTAMP_TZ) as "DBT_UPDATED_AT" ,
                    cast("DBT_VALID_FROM" as TIMESTAMP_TZ) as "DBT_VALID_FROM" ,
                    cast("DBT_VALID_TO" as TIMESTAMP_TZ) as "DBT_VALID_TO" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(16777216)) as "_DBT_SOURCE_RELATION" ,
                    cast(null as character varying(32)) as "UNIQUE_ID" 

            from analytics_dev.snapshots.cloud_userpermissions_snapshot

            
        )

        union all
        

        (
            select
                cast('analytics_dev.snapshots.cloud_userpermissions_st_snapshot' as TEXT) as dbt_snapshot_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("LEVEL" as NUMBER(38,0)) as "LEVEL" ,
                    cast("LICENSE_TYPE" as character varying(16777216)) as "LICENSE_TYPE" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_BATCHED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_EXTRACTED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_RECEIVED_AT" ,
                    cast(null as NUMBER(38,0)) as "_SDC_SEQUENCE" ,
                    cast(null as NUMBER(38,0)) as "_SDC_TABLE_VERSION" ,
                    cast("DBT_SCD_ID" as character varying(32)) as "DBT_SCD_ID" ,
                    cast("DBT_UPDATED_AT" as TIMESTAMP_TZ) as "DBT_UPDATED_AT" ,
                    cast("DBT_VALID_FROM" as TIMESTAMP_TZ) as "DBT_VALID_FROM" ,
                    cast("DBT_VALID_TO" as TIMESTAMP_TZ) as "DBT_VALID_TO" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("_DBT_SOURCE_RELATION" as character varying(16777216)) as "_DBT_SOURCE_RELATION" ,
                    cast("UNIQUE_ID" as character varying(32)) as "UNIQUE_ID" 

            from analytics_dev.snapshots.cloud_userpermissions_st_snapshot

            
        )

        

),

fixed as (

    select
        "CREATED_AT",
  "UPDATED_AT",
  "STATE",
  "ACCOUNT_ID",
  "USER_ID",
  "LICENSE_TYPE",
  "LEVEL",
  "ID",
  "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED",
  "DBT_SCD_ID",
  "DBT_UPDATED_AT",
  "DBT_VALID_FROM",
  "DBT_VALID_TO",
  "UNIQUE_ID",

        coalesce(
            _dbt_source_relation,
            'raw.fivetran_dbt_cloud_postgres_public.user_license'
        ) as _dbt_source_relation
            --This is a temporary fix until we change all multi-tenant
            --accounts to use the hashed identifier

    from unioned

),

enriched as (

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
      end as user_license_id,

      id as tenant_user_license_id,

        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,

        case
          when database_source = 'cloud'
                then user_id::varchar
          else md5(database_source || user_id)
      end as user_id,

      user_id as tenant_user_id,

        case
          when database_source = 'cloud'
                then dbt_scd_id::varchar
          else md5(database_source || dbt_scd_id)
      end as dbt_scd_id,

      dbt_scd_id as tenant_dbt_scd_id,

        "_DBT_SOURCE_RELATION",
  "CREATED_AT",
  "UPDATED_AT",
  "STATE",
  "LICENSE_TYPE",
  "LEVEL",
  "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED",
  "DBT_UPDATED_AT",
  "DBT_VALID_FROM",
  "DBT_VALID_TO",
  "UNIQUE_ID"

    from fixed

)

select * from enriched
        );
      
  