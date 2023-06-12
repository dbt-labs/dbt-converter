
    
    

select
    connector_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_fivetran_log__connectors
where connector_id is not null
group by connector_id
having count(*) > 1


