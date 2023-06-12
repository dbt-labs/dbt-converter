
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud__runs  as
        (with

source as (

    
    
    
    
    

    
    

        (
            select
                cast('RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLEND_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_BLEND_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast(null as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast(null as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast(null as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CONA_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CONA_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast(null as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast(null as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NASDAQ_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_NASDAQ_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MIRVAC_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_MIRVAC_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast(null as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MOHNZ_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_MOHNZ_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAXOS_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PAXOS_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast(null as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_REST_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_REST_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TAXFIX_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_TAXFIX_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WWE_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_WWE_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast(null as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.RUN' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.RUN

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.run' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from raw.fivetran_dbt_cloud_postgres_public.run

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.run' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from raw.fivetran_dbt_cloud_postgres_emea_public.run

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.run' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(4096)) as "STATUS_MESSAGE" ,
                    cast("HAS_DOCS_GENERATED" as BOOLEAN) as "HAS_DOCS_GENERATED" ,
                    cast("FINISHED_AT" as TIMESTAMP_TZ) as "FINISHED_AT" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("SHOULD_START_AT" as TIMESTAMP_TZ) as "SHOULD_START_AT" ,
                    cast("TRIGGER_ID" as NUMBER(38,0)) as "TRIGGER_ID" ,
                    cast("DEFERRING_RUN_ID" as NUMBER(38,0)) as "DEFERRING_RUN_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ARTIFACTS_SAVED" as BOOLEAN) as "ARTIFACTS_SAVED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("EXECUTED_BY_THREAD_ID" as character varying(1020)) as "EXECUTED_BY_THREAD_ID" ,
                    cast("GIT_SHA" as character varying(1020)) as "GIT_SHA" ,
                    cast("GIT_BRANCH" as character varying(1020)) as "GIT_BRANCH" ,
                    cast("LAST_CHECKED_AT" as TIMESTAMP_TZ) as "LAST_CHECKED_AT" ,
                    cast("JOB_DEFINITION_ID" as NUMBER(38,0)) as "JOB_DEFINITION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("ARTIFACT_S3_PATH" as character varying(4096)) as "ARTIFACT_S3_PATH" ,
                    cast("NOTIFICATIONS_SENT" as BOOLEAN) as "NOTIFICATIONS_SENT" ,
                    cast("WEBHOOKS_DELIVERED" as BOOLEAN) as "WEBHOOKS_DELIVERED" ,
                    cast("DEQUEUED_AT" as TIMESTAMP_TZ) as "DEQUEUED_AT" ,
                    cast("HAS_SOURCES_GENERATED" as BOOLEAN) as "HAS_SOURCES_GENERATED" ,
                    cast("BLOCKED_BY" as VARIANT) as "BLOCKED_BY" ,
                    cast("STARTED_AT" as TIMESTAMP_TZ) as "STARTED_AT" ,
                    cast("OWNER_THREAD_ID" as character varying(1020)) as "OWNER_THREAD_ID" ,
                    cast("LAST_HEARTBEAT_AT" as TIMESTAMP_TZ) as "LAST_HEARTBEAT_AT" ,
                    cast("SCRIBE_ENABLED" as BOOLEAN) as "SCRIBE_ENABLED" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDEMPOTENCY_KEY" as character varying(1020)) as "IDEMPOTENCY_KEY" ,
                    cast("IS_RUNNING" as BOOLEAN) as "IS_RUNNING" 

            from raw.fivetran_dbt_cloud_postgres_au_public.run

            
        )

        

),

blocked_by_hashing as (

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
      end as run_id,

      id as tenant_run_id,
        case
          when database_source = 'cloud'
                then value::varchar
          else md5(database_source || value)
      end as blocking_run_id,

      value as tenant_blocking_run_id

    from source,
    lateral flatten(input => source.blocked_by) blocking_run_id

),

blocked_by_agg as (

    select
        run_id,
        array_agg(blocking_run_id) as blocked_by_ids,
        array_agg(tenant_blocking_run_id) as tenant_blocked_by_ids

    from blocked_by_hashing
    group by 1

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
      end as run_id,

      id as tenant_run_id,
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
                then job_definition_id::varchar
          else md5(database_source || job_definition_id)
      end as job_definition_id,

      job_definition_id as tenant_job_definition_id,
        case
          when database_source = 'cloud'
                then trigger_id::varchar
          else md5(database_source || trigger_id)
      end as trigger_id,

      trigger_id as tenant_trigger_id,
        case
          when database_source = 'cloud'
                then deferring_run_id::varchar
          else md5(database_source || deferring_run_id)
      end as deferring_run_id,

      deferring_run_id as tenant_deferring_run_id,
        case
          when database_source = 'cloud'
                then executed_by_thread_id::varchar
          else md5(database_source || executed_by_thread_id)
      end as executed_by_thread_id,

      executed_by_thread_id as tenant_executed_by_thread_id,
        case
          when database_source = 'cloud'
                then owner_thread_id::varchar
          else md5(database_source || owner_thread_id)
      end as owner_thread_id,

      owner_thread_id as tenant_owner_thread_id,

        status as status_code,
        status_message,
        dbt_version,
        notifications_sent,
        scribe_enabled,
        webhooks_delivered,
        
        created_at,
        should_start_at,
        dequeued_at,
        started_at,
        last_heartbeat_at,
        finished_at,
        last_checked_at,
        updated_at

    from source

),

final as (

    select
        *,

        decode(status_code,
            1, 'queued',
            3, 'running',
            10, 'complete',
            20, 'error',
            30, 'cancelled'
            )
        as status,

        case
            when status = 'error'
                then 1
            else 0
        end as is_failed_run,

        case
            when status = 'complete'
                then 1
            else 0
        end as is_successful_run,

        array_size(blocked_by_ids) as blocked_by_count

    from renamed
    left join blocked_by_agg using (run_id)

)

select * from final
        );
      
  