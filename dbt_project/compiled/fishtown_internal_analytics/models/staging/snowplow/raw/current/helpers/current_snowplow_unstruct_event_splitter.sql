

with event as (

    select * from analytics_dev.dbt_jstein.current_snowplow_event

)

select
    event.event_id,
    event.domain_userid,
    nullif(event.user_id::string,'') as user_id,
    event.domain_sessionid,
    event.database_source,
    event.collector_tstamp,
    event.derived_tstamp,
    event.event,
    event.event_name,
    unstruct_event:data:data as unstruct_event

from event
where event.unstruct_event is not null



    and collector_tstamp >= dateadd(d, -3, current_date)





    and event.collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter)

