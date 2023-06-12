

with recency as (

    select max(collector_tstamp) as max_collector_tstamp
    from raw.snowplow.event
    where app_id = 'dbt'

),

comparison as (

    select

        max_collector_tstamp,
        current_timestamp() - interval '48 hour' as error_after_ts
        
    from recency

)

select * from comparison
where max_collector_tstamp < error_after_ts

