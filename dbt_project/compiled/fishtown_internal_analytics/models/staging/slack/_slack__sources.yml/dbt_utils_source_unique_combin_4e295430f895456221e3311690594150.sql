





with validation_errors as (

    select
        ts, channel_id
    from raw.slack.messages
    group by ts, channel_id
    having count(*) > 1

)

select *
from validation_errors


