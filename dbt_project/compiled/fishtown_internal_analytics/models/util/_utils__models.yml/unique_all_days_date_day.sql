
    
    

select
    date_day as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.all_days
where date_day is not null
group by date_day
having count(*) > 1


