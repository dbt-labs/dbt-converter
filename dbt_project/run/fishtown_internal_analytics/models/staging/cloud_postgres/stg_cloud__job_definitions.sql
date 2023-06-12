
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud__job_definitions  as
        (with

source as (

    
    
    
    
    

    
    

        (
            select
                cast('RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast(null as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast(null as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CONA_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CONA_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast(null as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WWE_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_WWE_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast(null as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MIRVAC_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_MIRVAC_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast(null as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast(null as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast(null as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NASDAQ_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_NASDAQ_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAXOS_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PAXOS_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast(null as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLEND_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_BLEND_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_REST_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_REST_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TAXFIX_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_TAXFIX_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MOHNZ_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_MOHNZ_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.JOB_DEFINITION' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.JOB_DEFINITION

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.job_definition' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from raw.fivetran_dbt_cloud_postgres_public.job_definition

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.job_definition' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from raw.fivetran_dbt_cloud_postgres_emea_public.job_definition

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.job_definition' as TEXT) as _dbt_source_relation,

                
                    cast("SETTINGS_TARGET_NAME" as character varying(512)) as "SETTINGS_TARGET_NAME" ,
                    cast("LIFECYCLE_WEBHOOKS" as BOOLEAN) as "LIFECYCLE_WEBHOOKS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("TIME_DEFINITION_TYPE" as character varying(200)) as "TIME_DEFINITION_TYPE" ,
                    cast("TRIGGERS_SCHEDULE" as BOOLEAN) as "TRIGGERS_SCHEDULE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("RUN_GENERATE_SOURCES" as BOOLEAN) as "RUN_GENERATE_SOURCES" ,
                    cast("DATE_DEFINITION_TYPE" as character varying(200)) as "DATE_DEFINITION_TYPE" ,
                    cast("CRON" as character varying(1020)) as "CRON" ,
                    cast("TRIGGERS_GITHUB_WEBHOOK" as BOOLEAN) as "TRIGGERS_GITHUB_WEBHOOK" ,
                    cast("GENERATE_DOCS" as BOOLEAN) as "GENERATE_DOCS" ,
                    cast("TRIGGERS_CUSTOM_BRANCH_ONLY" as BOOLEAN) as "TRIGGERS_CUSTOM_BRANCH_ONLY" ,
                    cast("TRIGGERS_GIT_PROVIDER_WEBHOOK" as BOOLEAN) as "TRIGGERS_GIT_PROVIDER_WEBHOOK" ,
                    cast("LIFECYCLE_WEBHOOKS_URL" as character varying(1020)) as "LIFECYCLE_WEBHOOKS_URL" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("EXECUTION_TIMEOUT_SECONDS" as NUMBER(38,0)) as "EXECUTION_TIMEOUT_SECONDS" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("EXECUTE_STEPS" as VARIANT) as "EXECUTE_STEPS" ,
                    cast("DEFERRING_JOB_DEFINITION_ID" as NUMBER(38,0)) as "DEFERRING_JOB_DEFINITION_ID" ,
                    cast("SETTINGS_THREADS" as NUMBER(38,0)) as "SETTINGS_THREADS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_FAILURE_COUNT" as NUMBER(38,0)) as "RUN_FAILURE_COUNT" ,
                    cast("DEACTIVATED" as BOOLEAN) as "DEACTIVATED" 

            from raw.fivetran_dbt_cloud_postgres_au_public.job_definition

            
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
      end as job_definition_id,

      id as tenant_job_definition_id,
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
        case
          when database_source = 'cloud'
                then deferring_job_definition_id::varchar
          else md5(database_source || deferring_job_definition_id)
      end as deferring_job_definition_id,

      deferring_job_definition_id as tenant_deferring_job_definition_id,

        name,
        state,
        execute_steps,
        generate_docs,
        cron,

        -- There are a few records with the below string values in place for NULL. This logic ensure they resolve to NULL.
        case
            when dbt_version in ('','null','NULL','None') then null
            else dbt_version
        end as dbt_version,

        date_definition_type,
        time_definition_type,
        triggers_github_webhook,
        triggers_schedule,
        settings_target_name,
        settings_threads,

        
    case
        when state = 2
            then 1
        else 0
    end as is_job_definition_deleted
,

        created_at,
        updated_at

    from source

)

select * from renamed
        );
      
  