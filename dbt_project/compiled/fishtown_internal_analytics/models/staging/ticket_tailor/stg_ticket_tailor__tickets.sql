with

source as (

    select * from analytics_dev.dbt_jstein.base__ticket_tailor_tickets

),

events as (

    select * from analytics_dev.dbt_jstein.stg_ticket_tailor__events

),

joined as (

    select
        source.*,

      --Event details
        events.name as event_name,
        events.is_learn_event,
        events.event_start_date,
        events.event_end_date,

      --Learn-specific fields
        case
            when current_date() >= events.event_end_date
            and source.status != 'voided'
            and is_learn_event = true
                then 1
        end as percentage_completed,

        case
            when current_date() >= events.event_end_date
            and source.status != 'voided'
            and is_learn_event = true
                then true
            when is_learn_event = false
                then null
            else false
        end as is_completed,

        case
            when current_date() >= events.event_start_date
            and source.status != 'voided'
            and is_learn_event = true
                then events.event_start_date
        end as started_at,

        case
            when current_date() >= events.event_end_date
            and source.status != 'voided'
            and is_learn_event = true
                then events.event_end_date
        end as completed_at

    from source
    left join events
        on source.event_id = events.event_id

)

select * from joined