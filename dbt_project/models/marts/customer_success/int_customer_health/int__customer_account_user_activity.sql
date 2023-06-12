{# 
    This value sets the number of days in a month you want to report out.
    For example, setting it to 11 tells you how many users were active at least 10 days in the last 30 days

#}
{% set daily_total_range = 11 %}

with cloud_user_account_activities as (

    select * 
    from {{ ref('fct_cloud_user_account_activities') }}
    where
        date_day >= (current_date - 30)
        and is_active = 1
        and user_license_type = 'developer'
        and is_paying_account

),

active_user_summary as (

    select
        customer_id,
        salesforce_account_id,
        email,
        count(distinct date_day) as active_day_count
    from cloud_user_account_activities
    group by 1,2,3

),

user_days_in_month_active as (

    select
        customer_id,
        salesforce_account_id,
        {% for i in range(1, daily_total_range) %}
            count(distinct 
                    case when active_day_count >= {{i}} then email 
                    else null 
                end) as active_{{i}}_plus_days
            {% if not loop.last %}
            ,
            {% endif %}
        {% endfor %}
    from active_user_summary
    group by 1,2

)

select * from user_days_in_month_active