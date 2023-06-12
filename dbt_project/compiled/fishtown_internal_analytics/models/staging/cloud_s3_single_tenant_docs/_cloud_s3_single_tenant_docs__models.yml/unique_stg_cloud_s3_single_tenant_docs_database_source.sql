
    
    

select
    database_source as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud_s3_single_tenant_docs
where database_source is not null
group by database_source
having count(*) > 1


