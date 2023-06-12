with

user_info as (

    select * from analytics_dev.dbt_jstein.base__delighted_users

)

select * from user_info