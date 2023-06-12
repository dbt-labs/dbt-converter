select * 
from -- depends on: analytics_dev.dbt_jstein.dbt_metrics_default_calendar

(

with calendar as (
    select 
        * 
    from analytics_dev.dbt_jstein.dbt_metrics_default_calendar
    where date_day >= cast('2022-01-01' as date)
            and date_day <= cast('2022-12-31' as date) 
)

, model_fa6f0c8923114a5f13ea5d1a2d4409a3__aggregate as (
    
    select
        date_week,
        boolor_agg(metric_date_day is not null) as has_data,
        count(property_to_aggregate__new_verified_accounts_activated) as new_verified_accounts_activated
    from (
        select 
            cast(base_model.cloud_activation_due_at as date) as metric_date_day,
            calendar.date_week as date_week,
            calendar.date_day as window_filter_date,
            1 as property_to_aggregate__new_verified_accounts_activated
        from analytics_dev.dbt_jstein.fct_cloud_accounts base_model 
        
        left join calendar
            on cast(base_model.cloud_activation_due_at as date) = calendar.date_day
        
        where 1=1
        and (
        cast(base_model.cloud_activation_due_at as date) >= cast('2022-01-01' as date)
            and cast(base_model.cloud_activation_due_at as date) <= cast('2022-12-31' as date) 
        )
    
        and (
            first_cloud_activated_at != null
            )
    
        
    ) as base_query

    where 1=1
    group by 1

), model_fa6f0c8923114a5f13ea5d1a2d4409a3__final as (
    
    select
        parent_metric_cte.date_week,
        coalesce(new_verified_accounts_activated, 0) as new_verified_accounts_activated
    from model_fa6f0c8923114a5f13ea5d1a2d4409a3__aggregate as parent_metric_cte
)

select
    date_week ,
    new_verified_accounts_activated  
    
from model_fa6f0c8923114a5f13ea5d1a2d4409a3__final
    
order by 1 desc
    
) metric_subq