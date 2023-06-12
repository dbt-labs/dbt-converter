





with validation_errors as (

    select
        user_id, ip, user_agent
    from raw.slack.access_logs
    group by user_id, ip, user_agent
    having count(*) > 1

)

select *
from validation_errors


