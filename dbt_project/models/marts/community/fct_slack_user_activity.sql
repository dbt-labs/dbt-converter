with messages as (

    select * from {{ref('stg_slack__messages')}}
    --some messages don't have associated users, which we want to filter out
    where user_id is not null 

),

reactions as (

    select * from {{ref('stg_slack__reactions')}}

),

days as (

    select * from {{ref('all_days')}}

),

all_actions as (

    select 
        user_id, 
        sent_at as activity_ts,
        'message' as action_type
    from messages

    union all
    
    select 
        user_id,
        --we don't have a ts for the actual reaction, 
        --but this would seem to be a good enough approximation
        message_sent_at as activity_ts,
        'reaction' as action_type
    from reactions

),

actions_days as (

    select
        user_id,
        activity_ts::date as date_day,
        count(*) as action_count
    from all_actions
    group by 1, 2

),

users as (

    select 
        user_id, 
        min(date_day) as first_action_date,
        max(date_day) as last_action_date
    from actions_days
    group by 1

),

users_days as (

    select 
        user_id, 
        date_day
    from users
    join days
        on users.first_action_date <= days.date_day
        and dateadd(day, 30, users.last_action_date) >= days.date_day

),

user_activity as (

    select

        {{dbt_utils.generate_surrogate_key([
            'users_days.user_id',
            'users_days.date_day'
            ])}} as id,
        
        users_days.user_id,
        users_days.date_day,
        coalesce(actions_days.action_count, 0) as action_count,
        case when action_count > 0 then 1 else 0 end as active,
        
        max(active) over (
            partition by users_days.user_id 
            order by users_days.date_day 
            rows between 6 preceding and current row
            ) as t7d_active,

        max(active) over (
            partition by users_days.user_id 
            order by users_days.date_day 
            rows between 29 preceding and current row
            ) as t30d_active

    from users_days
    left join actions_days 
        on users_days.user_id = actions_days.user_id
        and users_days.date_day = actions_days.date_day

)

select * from user_activity