select * from {{ref('stg_snowplow_events')}}
where app_id = 'dbt'
    and is_dev_event = false
