
    
    

with all_values as (

    select
        plan as value_field,
        count(*) as n_records

    from analytics_dev.dbt_jstein.stg_cloud__accounts
    group by plan

)

select *
from all_values
where value_field not in (
    'team','team_2022','developer','developer_2022','cancelled','cancelled_2022','trial','trial_2022','enterprise','free'
)


