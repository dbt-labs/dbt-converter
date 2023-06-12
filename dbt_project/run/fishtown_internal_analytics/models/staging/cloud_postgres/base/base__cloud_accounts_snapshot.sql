
  
    

        create or replace transient table analytics_dev.dbt_jstein.base__cloud_accounts_snapshot  as
        (with

unioned as (

    
    

        (
            select
                cast('analytics_dev.snapshots.cloud_accounts_snapshot' as TEXT) as dbt_snapshot_relation,

                
                    cast("BILLING_EMAIL_ADDRESS" as character varying(16777216)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(16777216)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(16777216)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(16777216)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("EXTRA_DEVELOPER_SEATS" as NUMBER(38,0)) as "EXTRA_DEVELOPER_SEATS" ,
                    cast("EXTRA_SEATS" as NUMBER(38,0)) as "EXTRA_SEATS" ,
                    cast("EXTRA_SLOTS" as NUMBER(38,0)) as "EXTRA_SLOTS" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("LOCK_REASON" as character varying(16777216)) as "LOCK_REASON" ,
                    cast("NAME" as character varying(16777216)) as "NAME" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("PLAN" as character varying(16777216)) as "PLAN" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(16777216)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("_SDC_BATCHED_AT" as TIMESTAMP_TZ) as "_SDC_BATCHED_AT" ,
                    cast("_SDC_EXTRACTED_AT" as TIMESTAMP_TZ) as "_SDC_EXTRACTED_AT" ,
                    cast("_SDC_RECEIVED_AT" as TIMESTAMP_TZ) as "_SDC_RECEIVED_AT" ,
                    cast("_SDC_SEQUENCE" as NUMBER(38,0)) as "_SDC_SEQUENCE" ,
                    cast("_SDC_TABLE_VERSION" as NUMBER(38,0)) as "_SDC_TABLE_VERSION" ,
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("DBT_SCD_ID" as character varying(32)) as "DBT_SCD_ID" ,
                    cast("DBT_UPDATED_AT" as TIMESTAMP_TZ) as "DBT_UPDATED_AT" ,
                    cast("DBT_VALID_FROM" as TIMESTAMP_TZ) as "DBT_VALID_FROM" ,
                    cast("DBT_VALID_TO" as TIMESTAMP_TZ) as "DBT_VALID_TO" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("GIT_AUTH_LEVEL" as character varying(16777216)) as "GIT_AUTH_LEVEL" ,
                    cast("STARTER_REPO_URL" as character varying(16777216)) as "STARTER_REPO_URL" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast("METRONOME_CUSTOMER_ID" as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast("SALESFORCE_CUSTOMER_ID" as character varying(200)) as "SALESFORCE_CUSTOMER_ID" ,
                    cast(null as character varying(16777216)) as "_DBT_SOURCE_RELATION" ,
                    cast(null as character varying(32)) as "UNIQUE_ID" 

            from analytics_dev.snapshots.cloud_accounts_snapshot

            
        )

        union all
        

        (
            select
                cast('analytics_dev.snapshots.cloud_accounts_st_snapshot' as TEXT) as dbt_snapshot_relation,

                
                    cast("BILLING_EMAIL_ADDRESS" as character varying(16777216)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(16777216)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(16777216)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(16777216)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast(null as NUMBER(38,0)) as "EXTRA_DEVELOPER_SEATS" ,
                    cast(null as NUMBER(38,0)) as "EXTRA_SEATS" ,
                    cast(null as NUMBER(38,0)) as "EXTRA_SLOTS" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("LOCK_REASON" as character varying(16777216)) as "LOCK_REASON" ,
                    cast("NAME" as character varying(16777216)) as "NAME" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("PLAN" as character varying(16777216)) as "PLAN" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(16777216)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_BATCHED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_EXTRACTED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_RECEIVED_AT" ,
                    cast(null as NUMBER(38,0)) as "_SDC_SEQUENCE" ,
                    cast(null as NUMBER(38,0)) as "_SDC_TABLE_VERSION" ,
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("DBT_SCD_ID" as character varying(32)) as "DBT_SCD_ID" ,
                    cast("DBT_UPDATED_AT" as TIMESTAMP_TZ) as "DBT_UPDATED_AT" ,
                    cast("DBT_VALID_FROM" as TIMESTAMP_TZ) as "DBT_VALID_FROM" ,
                    cast("DBT_VALID_TO" as TIMESTAMP_TZ) as "DBT_VALID_TO" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("GIT_AUTH_LEVEL" as character varying(16777216)) as "GIT_AUTH_LEVEL" ,
                    cast("STARTER_REPO_URL" as character varying(16777216)) as "STARTER_REPO_URL" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast("METRONOME_CUSTOMER_ID" as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast("SALESFORCE_CUSTOMER_ID" as character varying(200)) as "SALESFORCE_CUSTOMER_ID" ,
                    cast("_DBT_SOURCE_RELATION" as character varying(16777216)) as "_DBT_SOURCE_RELATION" ,
                    cast("UNIQUE_ID" as character varying(32)) as "UNIQUE_ID" 

            from analytics_dev.snapshots.cloud_accounts_st_snapshot

            
        )

        

),

fixed as (

    select
        "CREATED_AT",
  "UPDATED_AT",
  "NAME",
  "STATE",
  "ID",
  "RUN_SLOTS",
  "PLAN",
  "STRIPE_CUSTOMER_ID",
  "DEVELOPER_SEATS",
  "PENDING_CANCEL",
  "DOCS_JOB_ID",
  "FRESHNESS_JOB_ID",
  "ENTERPRISE_AUTHENTICATION_METHOD",
  "ENTERPRISE_LOGIN_SLUG",
  "ENTERPRISE_UNIQUE_IDENTIFIER",
  "BILLING_EMAIL_ADDRESS",
  "LOCKED",
  "LOCK_REASON",
  "UNLOCK_IF_SUBSCRIPTION_RENEWED",
  "DEVELOP_FILE_SYSTEM",
  "POD_MEMORY_REQUEST_MEBIBYTES",
  "READ_ONLY_SEATS",
  "UNLOCKED_AT",
  "STARTER_REPO_URL",
  "QUEUE_LIMIT",
  "SSO_REAUTH",
  "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED",
  "GIT_AUTH_LEVEL",
  "RUN_DURATION_LIMIT_SECONDS",
  "DBT_SCD_ID",
  "DBT_UPDATED_AT",
  "DBT_VALID_FROM",
  "DBT_VALID_TO",
  "UNIQUE_ID",
  "IDENTIFIER",
  "FORCE_SSO",
  "METRONOME_CUSTOMER_ID",
  "SALESFORCE_CUSTOMER_ID",

        coalesce(
            _dbt_source_relation,
            'raw.fivetran_dbt_cloud_postgres_public.database_account'
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
      end as account_id,

      id as tenant_account_id,

        "_DBT_SOURCE_RELATION",
  "CREATED_AT",
  "UPDATED_AT",
  "NAME",
  "STATE",
  "ID",
  "RUN_SLOTS",
  "PLAN",
  "STRIPE_CUSTOMER_ID",
  "DEVELOPER_SEATS",
  "PENDING_CANCEL",
  "DOCS_JOB_ID",
  "FRESHNESS_JOB_ID",
  "ENTERPRISE_AUTHENTICATION_METHOD",
  "ENTERPRISE_LOGIN_SLUG",
  "ENTERPRISE_UNIQUE_IDENTIFIER",
  "BILLING_EMAIL_ADDRESS",
  "LOCKED",
  "LOCK_REASON",
  "UNLOCK_IF_SUBSCRIPTION_RENEWED",
  "DEVELOP_FILE_SYSTEM",
  "POD_MEMORY_REQUEST_MEBIBYTES",
  "READ_ONLY_SEATS",
  "UNLOCKED_AT",
  "STARTER_REPO_URL",
  "QUEUE_LIMIT",
  "SSO_REAUTH",
  "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED",
  "GIT_AUTH_LEVEL",
  "RUN_DURATION_LIMIT_SECONDS",
  "DBT_SCD_ID",
  "DBT_UPDATED_AT",
  "DBT_VALID_FROM",
  "DBT_VALID_TO",
  "UNIQUE_ID",
  "IDENTIFIER",
  "FORCE_SSO",
  "METRONOME_CUSTOMER_ID",
  "SALESFORCE_CUSTOMER_ID"

    from fixed

)

select * from enriched
where _dbt_source_relation is not null
        );
      
  