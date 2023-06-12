
    
    

select
    sfdc_rev_schedule_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.base__salesforce_rev_schedule
where sfdc_rev_schedule_id is not null
group by sfdc_rev_schedule_id
having count(*) > 1


