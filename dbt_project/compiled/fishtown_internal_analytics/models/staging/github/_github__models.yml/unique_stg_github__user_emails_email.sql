
    
    

select
    email as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_github__user_emails
where email is not null
group by email
having count(*) > 1


