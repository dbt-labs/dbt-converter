
    
    

select
    single_tenant_name as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs
where single_tenant_name is not null
group by single_tenant_name
having count(*) > 1


