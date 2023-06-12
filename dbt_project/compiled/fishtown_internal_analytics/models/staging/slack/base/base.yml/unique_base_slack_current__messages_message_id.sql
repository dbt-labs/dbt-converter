
    
    

select
    message_id as unique_field,
    count(*) as n_records

from ANALYTICS.dbt_jstein.base_slack_current__messages
where message_id is not null
group by message_id
having count(*) > 1


