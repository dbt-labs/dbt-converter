
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud__repos  as
        (with

source as (

    
    
    
    
    

    
    

        (
            select
                cast('RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLEND_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_BLEND_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NASDAQ_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_NASDAQ_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAXOS_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PAXOS_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CONA_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CONA_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MOHNZ_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_MOHNZ_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TAXFIX_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_TAXFIX_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_REST_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_REST_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MIRVAC_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_MIRVAC_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WWE_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_WWE_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.REPOSITORY' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.REPOSITORY

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.repository' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from raw.fivetran_dbt_cloud_postgres_public.repository

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.repository' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from raw.fivetran_dbt_cloud_postgres_emea_public.repository

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.repository' as TEXT) as _dbt_source_relation,

                
                    cast("REMOTE_URL" as character varying(4096)) as "REMOTE_URL" ,
                    cast("DEPLOY_KEY_ID" as NUMBER(38,0)) as "DEPLOY_KEY_ID" ,
                    cast("GIT_PROVIDER_ID" as NUMBER(38,0)) as "GIT_PROVIDER_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("GIT_CLONE_STRATEGY" as character varying(256)) as "GIT_CLONE_STRATEGY" ,
                    cast("GITHUB_INSTALLATION_ID" as NUMBER(38,0)) as "GITHUB_INSTALLATION_ID" ,
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("FULL_NAME" as character varying(4096)) as "FULL_NAME" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("PULL_REQUEST_URL_TEMPLATE" as character varying(4096)) as "PULL_REQUEST_URL_TEMPLATE" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("REMOTE_BACKEND" as character varying(256)) as "REMOTE_BACKEND" ,
                    cast("REPOSITORY_CREDENTIALS_ID" as NUMBER(38,0)) as "REPOSITORY_CREDENTIALS_ID" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" 

            from raw.fivetran_dbt_cloud_postgres_au_public.repository

            
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
      end as repository_id,

      id as tenant_repository_id,
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
                then deploy_key_id::varchar
          else md5(database_source || deploy_key_id)
      end as deploy_key_id,

      deploy_key_id as tenant_deploy_key_id,
        case
          when database_source = 'cloud'
                then github_installation_id::varchar
          else md5(database_source || github_installation_id)
      end as github_installation_id,

      github_installation_id as tenant_github_installation_id,
        case
          when database_source = 'cloud'
                then repository_credentials_id::varchar
          else md5(database_source || repository_credentials_id)
      end as repository_credentials_id,

      repository_credentials_id as tenant_repository_credentials_id,

        --dimensions
        full_name,
        state,
        remote_backend,

        remote_url,
        git_clone_strategy,
        pull_request_url_template,

        
    case
        when state = 2
            then 1
        else 0
    end as is_repo_deleted
,

        case
            -- these are more reliable than looking at the url for self-hosted deployments
            when git_clone_strategy = 'deploy_token' then 'GitLab'
            when git_clone_strategy = 'github_app' then 'GitHub'

            when remote_url ilike '%github%' then 'GitHub'
            when remote_url ilike '%bitbucket%' then 'Bitbucket'
            when remote_url ilike '%gitlab%' then 'GitLab'
            when remote_url ilike '%codecommit%' then 'CodeCommit'
            when remote_url ilike '%visualstudio%' then 'Visual Studio'
            when remote_url ilike '%azure%' then 'Azure'
            else 'Other'
        end as git_provider,

        case    
            when remote_backend = 'managed' then 1 
            else 0
        end as is_managed_repo,

        --timestamps
        created_at,
        updated_at

    from source

)

select * from renamed
        );
      
  