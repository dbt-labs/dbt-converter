





with validation_errors as (

    select
        ts, channel
    from raw.slack_historical.messages
    group by ts, channel
    having count(*) > 1

)

select *
from validation_errors


