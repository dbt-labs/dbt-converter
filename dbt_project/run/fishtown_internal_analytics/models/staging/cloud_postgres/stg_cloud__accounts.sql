
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud__accounts  as
        (with

source as (

    
    
    
    
    

    
    

        (
            select
                cast('RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast(null as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLEND_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_BLEND_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "IDENTIFIER" ,
                    cast(null as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MOHNZ_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_MOHNZ_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "IDENTIFIER" ,
                    cast(null as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CONA_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CONA_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "IDENTIFIER" ,
                    cast(null as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NASDAQ_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_NASDAQ_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "IDENTIFIER" ,
                    cast(null as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_REST_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_REST_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MIRVAC_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_MIRVAC_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TAXFIX_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_TAXFIX_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WWE_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_WWE_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAXOS_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_PAXOS_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.DATABASE_ACCOUNT' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast(null as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast(null as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.DATABASE_ACCOUNT

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.database_account' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast("METRONOME_CUSTOMER_ID" as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast("SALESFORCE_CUSTOMER_ID" as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from raw.fivetran_dbt_cloud_postgres_public.database_account

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.database_account' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast("METRONOME_CUSTOMER_ID" as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast("SALESFORCE_CUSTOMER_ID" as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from raw.fivetran_dbt_cloud_postgres_emea_public.database_account

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.database_account' as TEXT) as _dbt_source_relation,

                
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("LOCK_REASON" as character varying(1020)) as "LOCK_REASON" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(200)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(120)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("PLAN" as character varying(120)) as "PLAN" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(4000)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("BILLING_EMAIL_ADDRESS" as character varying(4096)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(200)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("STARTER_REPO_URL" as character varying(4096)) as "STARTER_REPO_URL" ,
                    cast("GIT_AUTH_LEVEL" as character varying(400)) as "GIT_AUTH_LEVEL" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("IDENTIFIER" as character varying(124)) as "IDENTIFIER" ,
                    cast("FORCE_SSO" as BOOLEAN) as "FORCE_SSO" ,
                    cast("METRONOME_CUSTOMER_ID" as character varying(200)) as "METRONOME_CUSTOMER_ID" ,
                    cast("SALESFORCE_CUSTOMER_ID" as character varying(200)) as "SALESFORCE_CUSTOMER_ID" 

            from raw.fivetran_dbt_cloud_postgres_au_public.database_account

            
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
      end as account_id,

      id as tenant_account_id,
        stripe_customer_id,

        --account info
        name,
        plan,
        

case
    when RIGHT( plan, 5 ) ='_2022'
        then split_part(plan,'_',1)
    else plan
end 

 as plan_tier,
        run_slots,
        read_only_seats + developer_seats as total_seats,
        read_only_seats,
        developer_seats,
        billing_email_address,

        name ilike '%(Partner)%' as is_partner_training_acct,
        -- Accounts with a 5x suffix denote they are a reseller account sold by 5x
        -- these accounts are not yet paying teams accounts, and should not yet be included in Customer counts
        -- Slack thread for more context: https://dbt-labs.slack.com/archives/C0101LM7Z89/p1670560904713559
        name ilike any('%(5x)','5x Dev%') as is_reseller_acct,

        case 
        -- We know these are tripped by %test% logic so until we get a standard indicator
        -- we want to do this with as little hardcoding as possible.
            when name ilike '%greatest%'
                then false
            when name ilike '%latest%'
                then false
            when name ilike '%statestreet%'
                then false
            when name ilike '%testlio%'
                then false
        -- the original criteria
            when (name ilike '%dbt%support%' and plan = 'enterprise')
            --for single-tenant support accts
                then true
            when name ilike '%test%'
                then true
            when name ilike '%sandbox%'
                then true
            else false
        end as is_test_account,

        
    case
        when state = 2
            then 1
        else 0
    end as is_account_deleted
,

        case 
            when enterprise_authentication_method is not null
                then concat('auth0_', enterprise_authentication_method)
            else enterprise_authentication_method
        end as auth0_enterprise_authentication_method,

        locked as is_locked,
        lock_reason,

        --timestamps
        created_at,
        updated_at

    from source

)

select * from renamed
        );
      
  