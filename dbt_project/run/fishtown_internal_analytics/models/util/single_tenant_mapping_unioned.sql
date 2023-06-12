
  
    

        create or replace transient table analytics_dev.dbt_jstein.single_tenant_mapping_unioned  as
        (with

single_tenant_docs_flattened as (

    select
        single_tenant_name,
        database_source,

      cast('INSTANCE_NAME' as TEXT) as field_name,
      cast(  
           INSTANCE_NAME
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('BASE_URL_HOST' as TEXT) as field_name,
      cast(  
           BASE_URL_HOST
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('ALIAS_URL_HOST' as TEXT) as field_name,
      cast(  
           ALIAS_URL_HOST
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('CLOUD_REGION' as TEXT) as field_name,
      cast(  
           CLOUD_REGION
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('PRIMARY_NAT_IP_MASKED' as TEXT) as field_name,
      cast(  
           PRIMARY_NAT_IP_MASKED
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('SECONDARY_NAT_IP_MASKED' as TEXT) as field_name,
      cast(  
           SECONDARY_NAT_IP_MASKED
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('AKS_MANAGED_NAT_IP_MASKED' as TEXT) as field_name,
      cast(  
           AKS_MANAGED_NAT_IP_MASKED
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('HAS_IP_WHITELISTING' as TEXT) as field_name,
      cast(  
           HAS_IP_WHITELISTING
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('PRIVATELINK_CONNECTIONS_EGRESS' as TEXT) as field_name,
      cast(  
           PRIVATELINK_CONNECTIONS_EGRESS
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('HAS_PRIVATELINK_CONNECTIONS_EGRESS' as TEXT) as field_name,
      cast(  
           HAS_PRIVATELINK_CONNECTIONS_EGRESS
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    union all
    select
        single_tenant_name,
        database_source,

      cast('HAS_PRIVATELINK_CONNECTIONS_INGRESS' as TEXT) as field_name,
      cast(  
           HAS_PRIVATELINK_CONNECTIONS_INGRESS
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs

    

),

single_tenant_gsheet_flattened as (

    select
        deployment,
        database_source,

      cast('MASKED' as TEXT) as field_name,
      cast(  
           MASKED
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_googlesheets__singletenant_lookup

    union all
    select
        deployment,
        database_source,

      cast('URL_HOST' as TEXT) as field_name,
      cast(  
           URL_HOST
             
           as varchar) as mapping_value

    from analytics_dev.dbt_jstein.stg_googlesheets__singletenant_lookup

    

),

single_tenant_docs_typed as (

    select
        's3_docs' as mapping_source,
        1 as mapping_priority,
        *,
        case
            when field_name ilike '%nat_ip%'
                then 'ip_address'
            when field_name ilike '%host%'
                then 'url_host'
            else lower(field_name)
        end as mapping_field_type,

        
    
md5(cast(coalesce(cast(database_source as TEXT), '') || '-' || coalesce(cast(field_name as TEXT), '') as TEXT)) as unique_id
    
    from single_tenant_docs_flattened
    where mapping_value != 'NULL'

),

single_tenant_gsheet_typed as (

    select
        'gsheet_mapping' as mapping_source,
        2 as mapping_priority,
        deployment as single_tenant_name,
        database_source,
        field_name,
        mapping_value,
        case
            when field_name ilike '%masked%'
                then 'ip_address'
            when field_name ilike '%host%'
                then 'url_host'
            else lower(field_name)
        end as mapping_field_type,

        
    
md5(cast(coalesce(cast(database_source as TEXT), '') || '-' || coalesce(cast(field_name as TEXT), '') as TEXT)) as unique_id
    
    from single_tenant_gsheet_flattened
    where database_source is not null

),

final as (

    select * from single_tenant_docs_typed

    union all

    select * from single_tenant_gsheet_typed
    where mapping_value != 'NULL'

)

-- this qualify statement is meant to make sure that we only take the primary value
-- across both the s3 bucket and gsheet
select * from final
    qualify row_number() over (
        partition by mapping_value, mapping_field_type, database_source
        order by mapping_priority
    ) = 1
        );
      
  