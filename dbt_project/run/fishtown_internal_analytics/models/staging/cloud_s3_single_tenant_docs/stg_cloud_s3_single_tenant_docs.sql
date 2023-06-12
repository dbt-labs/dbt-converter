
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs  as
        (

with

source as (

    select * from raw.cloud_s3_single_tenant_docs.configs

),

renamed as (

    select 
        single_tenant_name,
        'dbt-cloud-' || single_tenant_name as instance_name,
        case
            -- these intial case when statements handle edge cases that we need
            -- to account for because some of these accounts were added by hand
            -- in fivetran and thus don't match their s3 docs counterparts. Some
            -- also, like this first case statement, show historical logic used
            -- which is not anymore consisted with the updated terraform build.
            when single_tenant_name in (
                'blend-prod',
                'notonthehighstreet-prod',
                'scentregroup-cloud',
                'chrobinson-prod',
                'taxfix-cloud',
                'trustly-cloud',
                'mirvac-cloud',
                'wwe-cloud',
                'integraconnect-cloud',
                'paxos-cloud',
                'nasdaq-prod',
                'cona-prod',
                'endresshauser-cloud'
            )
                then split_part(single_tenant_name, '-', 1)
            when single_tenant_name ilike '%cambia%'
                then replace(single_tenant_name, 'cambiahealth-', 'cambia_')
            when single_tenant_name ilike '%biahealth%'
                then 'mohnz'
            -- these final case statements are the default behavior of how
            -- postgres schemas are now defined during the terraform build
            when split_part(single_tenant_name, '-', 2) != 'cloud'
                then replace(single_tenant_name, '-', '_')
            else replace(single_tenant_name, '-cloud', '_prod')
        end as database_source,

    ---------- URLS
        environment_information:base_url::varchar as base_url,
        parse_url(base_url, 1):host::varchar as base_url_host,

        nullif(split_part(
            ltrim(
                environment_information:alias_url::varchar, 
                '['
            ),
            ']',
            1
        ), 'N/A') as alias_url,

        parse_url(alias_url, 1):host::varchar as alias_url_host,

    ---------- IP INFO
        environment_information:cloud::varchar as cloud_provider,
        environment_information:region::string as cloud_region,

        nullif(
            network_information:primary_nat_ip::varchar,
            'N/A'
        ) as primary_nat_ip,

        regexp_replace(
            primary_nat_ip, 
            '^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$', 
            '\\1\.\\2\.\\3\.x'
        ) as primary_nat_ip_masked,

        nullif(
            network_information:secondary_nat_ip::varchar,
            'N/A'
        ) as secondary_nat_ip,

        regexp_replace(
            secondary_nat_ip, 
            '^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$', 
            '\\1\.\\2\.\\3\.x'
        ) as secondary_nat_ip_masked_raw,

        case
            when secondary_nat_ip_masked_raw != primary_nat_ip_masked
                then secondary_nat_ip_masked_raw
            else null
        end as secondary_nat_ip_masked,

        nullif(
            network_information:aks_managed_nat_ip::varchar,
            ''
        ) as aks_managed_nat_ip,

        regexp_replace(
            aks_managed_nat_ip, 
            '^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$', 
            '\\1\.\\2\.\\3\.x'
        ) as aks_managed_nat_ip_masked,

    ---------- FEATURE FLAGS

        network_information:ip_whitelisting::boolean as has_ip_whitelisting,
        nullif(
            network_information:privatelink_connections_egress::varchar,
            'N/A'
        ) as privatelink_connections_egress,
        privatelink_connections_egress is not null as has_privatelink_connections_egress,
        case
            when network_information:privatelink_connections_ingress::varchar = 'N/A'
            then false
            else true
        end as has_privatelink_connections_ingress,
        

    ---------- ADDITIONAL INFO
        cluster_information,
        database_information,
        environment_information,
        network_information 
    
    from source

)

select * from renamed
        );
      
  