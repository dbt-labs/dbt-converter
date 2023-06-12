
  create or replace   view analytics_dev.dbt_jstein.metadata_account_usage
  
   as (
    with

metadata_daily_user_activity as (

    select * from analytics_dev.dbt_jstein.metadata_daily_user_activity
    where account_id is not null

),

metadata_account_summary as (

    select
        account_id,
        sum(total_metadata_api_requests) as total_metadata_api_requests,
        sum(total_external_metadata_api_requests) as total_external_metadata_api_requests,
        min(
            case 
                when total_metadata_api_requests > 0
                then first_metadata_api_requests_at
            end
        ) as first_metadata_api_request_at,
        max(
            case 
                when total_metadata_api_requests > 0
                then last_metadata_api_requests_at
            end
        ) as last_metadata_api_request_at,
        sum(total_model_bottleneck_viz_events) as total_model_bottleneck_viz_events,
        min(
            case 
                when total_model_bottleneck_viz_events > 0
                then first_model_bottleneck_viz_at
            end
        ) as first_model_bottleneck_viz_at,
        max(
            case 
                when total_model_bottleneck_viz_events > 0
                then last_model_bottleneck_viz_at
            end
        ) as last_model_bottleneck_viz_at
    
    from metadata_daily_user_activity
    group by 1

),

final as (

    select
        *,
        case when total_metadata_api_requests > 0 then 1 else 0 end as has_metadata_api_requests,
        case when total_external_metadata_api_requests > 0 then 1 else 0 end as has_external_metadata_api_requests,
        case when total_model_bottleneck_viz_events > 0 then 1 else 0 end as has_model_bottleneck_viz_events

    from metadata_account_summary

)

select * from final
  );

