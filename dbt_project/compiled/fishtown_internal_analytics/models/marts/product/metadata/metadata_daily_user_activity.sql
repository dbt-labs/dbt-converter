

with

metadata_api_requests as (

    select * from analytics_dev.dbt_jstein.stg_metadata_api__requests
    where 1=1

    

        and _loaded_at >= dateadd(d, -3, current_date)
    
    
    
    

        and _loaded_at >= (select max(event_date) from analytics_dev.dbt_jstein.metadata_daily_user_activity)

    

),

model_bottleneck as (

    select * from analytics_dev.dbt_jstein.stg_metadata__model_bottleneck_interactions
    where 1=1

    

        and _loaded_at >= dateadd(d, -3, current_date)
    
    

    

        and _loaded_at >= (select max(event_date) from analytics_dev.dbt_jstein.metadata_daily_user_activity)

    

),

api_requests_summarized as (

    select
        account_id,
        user_id,
        created_at::date as event_date,

        
    
md5(cast(coalesce(cast(user_id as TEXT), '') || '-' || coalesce(cast(account_id as TEXT), '') || '-' || coalesce(cast(event_date as TEXT), '') as TEXT)) as id,
        count(distinct event_id) as total_metadata_api_requests,
        count(case when source_buckets != 'cloud-applications' then event_id end) as total_external_metadata_api_requests,
        count(distinct source) as source_count,
        min(event_date) as first_metadata_api_requests_at,
        max(event_date) as last_metadata_api_requests_at
    
    from metadata_api_requests
    group by 1,2,3,4

),

model_bottleneck_summarized as (

    select
        account_id,
        user_id,
        event_at::date as event_date,

        
    
md5(cast(coalesce(cast(user_id as TEXT), '') || '-' || coalesce(cast(account_id as TEXT), '') || '-' || coalesce(cast(event_date as TEXT), '') as TEXT)) as id,

        count(distinct event_id) as total_model_bottleneck_viz_events,
        min(event_date) as first_model_bottleneck_viz_at,
        max(event_date) as last_model_bottleneck_viz_at
    
    from model_bottleneck
    -- exclude failed renders or interactions to get the right count
    where interaction_type not ilike '%unavailable%'
    group by 1,2,3,4

),

final as (

    select *
    from api_requests_summarized
    full outer join model_bottleneck_summarized
        using (account_id, user_id, event_date, id)

)

select * from final