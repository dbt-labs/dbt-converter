
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud__connections  as
        (with

source as (

    
    
    
    
    

    
    

        (
            select
                cast('RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_AFFIRM_POV_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ALLY_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ALSAC_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_AMAYSIM_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_AQUILACAPITAL_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ASB_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_BABBEL_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLEND_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_BLEND_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_BLOCKFI_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_BRIGHTE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CALIFORNIA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CAMBIA_DEV_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CHROBINSON_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CITYOFHOPE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ESRNZ_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_GRAIL_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_HEYCAR_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_HGCAPITAL_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_KUDA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_LACEWORK_DE_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_LAYA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_NBFC_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PHREESIA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_RGA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SCHNEIDER_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SONARSOURCE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SOUTHERNCROSS_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CAMBIA_UAT_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MIRVAC_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_MIRVAC_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PRIMARYBID_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_TANIUM_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_BHP_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PAYU_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_UDEMY_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_USAA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_VELLIV_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_UPWORK_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_GEICO_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_LACEWORK_US_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PARKNATIONALBANK_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_BOYDGAMING_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CHICKFILA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PELOTON_DEV_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PEPPERMONEY_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_TINDER_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MOHNZ_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_MOHNZ_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_THREE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SAGE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_FIL_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_TRANSPORTNSW_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_HELLOFRESH_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_INSTACART_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_OPORTUN_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_QUOTIENTSCIENCES_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_DROPBOX_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_UCSC_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CARLYLEGROUP_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_DJO_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_MERCURY_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_NBIM_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ZSCALER_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ONE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_OPTUM_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_VFNZ_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_MULTIMEDIA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_NBA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_OPTIVER_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SIEMENS_D2GO_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SOLIDIGM_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CAMBIA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CALIX_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ENDRESSHAUSER_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_NATWEST_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_MASSGENERAL_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CHS_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CONA_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CONA_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_INTEGRACONNECT_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_MEDIFOX_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_NATWEST_DEV_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PAXOS_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PAXOS_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SALESFORCE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_GROW_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_GUSTO_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_MEDTRONIC_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_TRANSPOWER_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_UPM_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_TMOBILE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_VIRGINMEDIA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_CISCO_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_DISNEY_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NASDAQ_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_NASDAQ_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ROCHE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_VESTAS_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_LUNDBECK_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_VISMA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_WATERCARE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_GRUNERJAHR_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PELOTON_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ELECTIONSDATA_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_STOREBRAND_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_TRUSTLY_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_PACIFICLIFE_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SHARP_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_NOTONTHEHIGHSTREET_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_REST_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_REST_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_USAA_DEV_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SWEATYBETTY_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_WWE_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_WWE_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_TAXFIX_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_TAXFIX_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_SCENTREGROUP_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.CONNECTION_INFO' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from RAW.FIVETRAN_ST_ONSEMI_PROD_PUBLIC.CONNECTION_INFO

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.connection_info' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from raw.fivetran_dbt_cloud_postgres_public.connection_info

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.connection_info' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from raw.fivetran_dbt_cloud_postgres_emea_public.connection_info

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.connection_info' as TEXT) as _dbt_source_relation,

                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("PROJECT_ID" as NUMBER(38,0)) as "PROJECT_ID" ,
                    cast("CREATED_BY_SERVICE_TOKEN_ID" as NUMBER(38,0)) as "CREATED_BY_SERVICE_TOKEN_ID" ,
                    cast("NAME" as character varying(1020)) as "NAME" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("CREATED_BY_ID" as NUMBER(38,0)) as "CREATED_BY_ID" ,
                    cast("TYPE" as character varying(1020)) as "TYPE" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("PRIVATE_LINK_ENDPOINT_ID" as character varying(124)) as "PRIVATE_LINK_ENDPOINT_ID" 

            from raw.fivetran_dbt_cloud_postgres_au_public.connection_info

            
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
      end as connection_id,

      id as tenant_connection_id,
        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,
        case
          when database_source = 'cloud'
                then created_by_id::varchar
          else md5(database_source || created_by_id)
      end as created_by_id,

      created_by_id as tenant_created_by_id,
        case
          when database_source = 'cloud'
                then project_id::varchar
          else md5(database_source || project_id)
      end as project_id,

      project_id as tenant_project_id,

        name,
        state,
        --default_schema,
        --tunnel_enabled,
        type,

        
    case
        when state = 2
            then 1
        else 0
    end as is_connection_deleted
,

        created_at,
        updated_at

    from source

)

select * from renamed
        );
      
  