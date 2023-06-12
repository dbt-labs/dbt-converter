
    
    

select
    date_month as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.all_months
where date_month is not null
group by date_month
having count(*) > 1


