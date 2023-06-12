with

events_current as (

    select * from {{ ref('int_cloud_account_events__current') }}

),

events_historical as (

    select * from {{ ref('int_cloud_account_events__historical') }}

),

unioned as (

    select * from events_current
    union all
    select * from events_historical

),

date_alignment as (
    
    select 
        id,
        account_id,
        event_name,
        convert_timezone(
            'UTC',
            event_timestamp
        ) as event_timestamp

    from unioned
        
)

select * from date_alignment
