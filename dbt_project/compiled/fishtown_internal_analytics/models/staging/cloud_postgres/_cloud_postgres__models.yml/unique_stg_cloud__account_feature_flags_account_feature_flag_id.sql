
    
    

select
    account_feature_flag_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.stg_cloud__account_feature_flags
where account_feature_flag_id is not null
group by account_feature_flag_id
having count(*) > 1


