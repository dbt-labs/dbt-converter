
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud__develop_requests  as
        (with

source as (

    
    
    
    
    

    
    

        (
            select
                cast('RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLEND_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_BLEND_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MOHNZ_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_MOHNZ_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WWE_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_WWE_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CONA_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CONA_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAXOS_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PAXOS_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TAXFIX_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_TAXFIX_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast(null as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast(null as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_REST_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_REST_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MIRVAC_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_MIRVAC_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NASDAQ_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_NASDAQ_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.DEVELOP_REQUEST' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.DEVELOP_REQUEST

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.develop_request' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from raw.fivetran_dbt_cloud_postgres_public.develop_request

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.develop_request' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from raw.fivetran_dbt_cloud_postgres_emea_public.develop_request

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.develop_request' as TEXT) as _dbt_source_relation,

                
                    cast("STATUS_MESSAGE" as character varying(16777216)) as "STATUS_MESSAGE" ,
                    cast("DEPS_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "DEPS_SETUP_STARTED_AT" ,
                    cast("ENVIRONMENT_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "ENVIRONMENT_SETUP_STARTED_AT" ,
                    cast("PV_STORAGE_CLASS" as character varying(256)) as "PV_STORAGE_CLASS" ,
                    cast("ENVIRONMENT_ID" as NUMBER(38,0)) as "ENVIRONMENT_ID" ,
                    cast("LAST_REQUEST_AT" as TIMESTAMP_TZ) as "LAST_REQUEST_AT" ,
                    cast("RUNNING_AT" as TIMESTAMP_TZ) as "RUNNING_AT" ,
                    cast("STOPPING_AT" as TIMESTAMP_TZ) as "STOPPING_AT" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("PROFILE_SETUP_STARTED_AT" as TIMESTAMP_TZ) as "PROFILE_SETUP_STARTED_AT" ,
                    cast("CONTAINER_VERSION" as character varying(1020)) as "CONTAINER_VERSION" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("READY_AT" as TIMESTAMP_TZ) as "READY_AT" ,
                    cast("DBT_VERSION" as character varying(256)) as "DBT_VERSION" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STOPPED_AT" as TIMESTAMP_TZ) as "STOPPED_AT" ,
                    cast("STATUS" as NUMBER(38,0)) as "STATUS" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("FIRST_SUCCESSFUL_HEALTH_CHECK_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_HEALTH_CHECK_AT" ,
                    cast("FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" as TIMESTAMP_TZ) as "FIRST_SUCCESSFUL_FILETREE_REQUEST_AT" ,
                    cast("API_START_DELAY" as TIMESTAMP_TZ) as "API_START_DELAY" 

            from raw.fivetran_dbt_cloud_postgres_au_public.develop_request

            
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
        );
      
  