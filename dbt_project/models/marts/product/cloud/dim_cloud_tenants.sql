with

single_tenants as (

    select database_source, single_tenant_name
    from {{ ref('single_tenant_mappings') }}
    qualify row_number() over (
        partition by database_source
        order by mapping_priority
    ) = 1

),

multi_tenants as (

    select database_source, instance_name
    from {{ ref('stg_seed__mt_multiregion_mappings') }}
    group by 1, 2

),

tenants_unioned as (

    select 
        
        'dbt-cloud-' || single_tenant_name as instance_name,
        md5(instance_name) as instance_name_md5,
        database_source,
        'single-tenant' as database_type

    from single_tenants

    union all

    select

        instance_name,
        md5(instance_name) as instance_name_md5,
        database_source,
        'multi-tenant' as database_type

    from multi_tenants

)

select * from tenants_unioned