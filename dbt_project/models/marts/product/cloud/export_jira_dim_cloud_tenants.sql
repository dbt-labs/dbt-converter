with

source_cloud_tenants as (
    select
        *
    from {{ ref('dim_cloud_tenants') }}
),

source_tenant_docs_data as (
    select
        *
    from {{ ref('stg_cloud_s3_single_tenant_docs') }}
),

trim_cloud_tenants as (
    select
        instance_name,
        instance_name_md5,
        database_type,
        database_source
    from source_cloud_tenants
),

trim_tenant_docs_data as (
    select
        instance_name_md5,
        single_tenant_name,
        base_url,
        base_url_host,
        alias_url,
        alias_url_host,
        cloud_provider,
        cloud_region,
        primary_nat_ip,
        primary_nat_ip_masked,
        secondary_nat_ip,
        secondary_nat_ip_masked_raw,
        secondary_nat_ip_masked,
        aks_managed_nat_ip,
        aks_managed_nat_ip_masked,
        has_ip_whitelisting,
        privatelink_connections_egress,
        has_privatelink_connections_egress,
        has_privatelink_connections_ingress,
        cluster_information,
        database_information,
        environment_information,
        network_information
    from source_tenant_docs_data

),

join_tenant_docs as (
    select
        tcc.instance_name,
        tcc.instance_name_md5,
        tcc.database_type,
        tcc.database_source,
        ttdd.single_tenant_name,
        ttdd.base_url,
        ttdd.base_url_host,
        ttdd.alias_url,
        ttdd.alias_url_host,
        ttdd.cloud_provider,
        ttdd.cloud_region,
        ttdd.primary_nat_ip,
        ttdd.primary_nat_ip_masked,
        ttdd.secondary_nat_ip,
        ttdd.secondary_nat_ip_masked_raw,
        ttdd.secondary_nat_ip_masked,
        ttdd.aks_managed_nat_ip,
        ttdd.aks_managed_nat_ip_masked,
        ttdd.has_ip_whitelisting,
        ttdd.privatelink_connections_egress,
        ttdd.has_privatelink_connections_egress,
        ttdd.has_privatelink_connections_ingress,
        ttdd.cluster_information,
        ttdd.database_information,
        ttdd.environment_information,
        ttdd.network_information,
        case
            when ttdd.instance_name_md5 is null then 'inactive'
            else 'active'
        end as instance_status_flag
    from trim_cloud_tenants as tcc
    left join trim_tenant_docs_data as ttdd
    on tcc.instance_name_md5 = ttdd.instance_name_md5
)

select * from join_tenant_docs
