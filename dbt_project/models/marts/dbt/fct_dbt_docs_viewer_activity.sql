with docs_sessions as (
    
    select * from {{ref('dbt_docs_sessions')}}

),

days as (

    select * from {{ref('all_days')}}

),

docs_viewers as (
    
    select
        project_id,
        inferred_user_id,
        min(session_start) as first_viewed_at,
        max(session_start) as last_viewed_at
    
    from docs_sessions
    group by 1,2
    
),

spined as (

    select 
        project_id,
        inferred_user_id,
        date_day::date as date_day
    from docs_viewers
    join days 
        on days.date_day >= date_trunc('day', docs_viewers.first_viewed_at)
        and days.date_day <= date_trunc('day', dateadd('day', 30, docs_viewers.last_viewed_at))

),

daily_views as (

    select
        project_id,
        inferred_user_id,
        session_start::date as date_day,
        count(*) as sessions,
        sum(time_engaged_in_s) as time_engaged_in_s
    
    from docs_sessions
    group by 1,2,3
    
),

joined as (
    
    select
        {{dbt_utils.generate_surrogate_key([
            'project_id', 
            'inferred_user_id', 
            'date_day'
        ])}} as id,
        project_id,
        inferred_user_id,
        date_day,
        coalesce(sessions, 0) as sessions,
        coalesce(time_engaged_in_s, 0) as time_engaged_in_s,
        case when sessions > 0 then 1 else 0 end as active
    
    from spined
    left join daily_views using (project_id, inferred_user_id, date_day)
    
),

trailing as (
    
    select *,
    
        sum(sessions) over (
            partition by project_id 
            order by date_day 
            rows between 6 preceding and current row
            ) as t7d_sessions,
            
        sum(time_engaged_in_s) over (
            partition by project_id 
            order by date_day 
            rows between 6 preceding and current row
            ) as t7d_time_engaged_in_s,
        
        max(active) over (
            partition by project_id 
            order by date_day 
            rows between 6 preceding and current row
            ) as t7d_active,
            
        sum(sessions) over (
            partition by project_id 
            order by date_day 
            rows between 29 preceding and current row
            ) as t30d_sessions,
            
        sum(time_engaged_in_s) over (
            partition by project_id 
            order by date_day 
            rows between 29 preceding and current row
            ) as t30d_time_engaged_in_s,
        
        max(active) over (
            partition by project_id 
            order by date_day 
            rows between 29 preceding and current row
            ) as t30d_active
            
    from joined
    
    
)

select * from trailing
