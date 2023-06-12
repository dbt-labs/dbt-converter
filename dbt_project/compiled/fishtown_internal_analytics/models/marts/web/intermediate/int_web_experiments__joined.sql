with

experiment_contexts as (

    select * from analytics_dev.dbt_jstein.stg_snowplow_web_experiment_contexts
    where event_name = 'page_view'

),

page_contexts as (

    select * from analytics_dev.dbt_jstein.snowplow_web_page_context
    
),

joined as (

    select
        page_contexts.page_view_id,
        experiment_contexts.*
    
    from page_contexts
    inner join experiment_contexts
        on page_contexts.root_id = experiment_contexts.event_id

),

final as (

    select
        page_view_id,
        event_id,
        event_name,

        context_type,
        context,

        case
            when experiment_name in ('undefined','none') then null
            else experiment_name
        end as experiment_name,

        case
            when branch_name in ('undefined', 'none') then null
            else branch_name
        end as branch_name,

        collector_tstamp
    
    from joined

)

select * from final