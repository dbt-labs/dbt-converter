with

sessions as (

    select * from {{ ref('fct_web_sessions') }}

),

conversions as (

    select * from {{ ref('fct_web_conversions') }}

),

pre_conversion_sessions as (

    select
        conversions.event_id,
        conversions.inferred_user_id,
        conversions.cloud_user_id,
        conversions.salesforce_contact_id,
        sessions.session_id,
        sessions.source_mapping_id,
        sessions.ad_web_mapping_id,
        
        sessions.first_page_url,
        sessions.first_page_url_host,
        sessions.first_page_url_path,
        sessions.first_page_url_query,
        sessions.marketing_source,
        sessions.marketing_medium,
        sessions.team,
        sessions.source_type,
        sessions.channel_grouping,
        sessions.channel,
        sessions.sub_channel,
        sessions.marketing_campaign,
        sessions.marketing_campaign_name,
        sessions.marketing_campaign_period,
        sessions.marketing_campaign_goal,
        sessions.marketing_content,
        sessions.marketing_offer,
        sessions.marketing_asset,
        sessions.marketing_asset_version,
        sessions.marketing_term,
        sessions.experiment_name,
        sessions.branch_name,

        conversions.conversion_name,
        conversions.conversion_type,
        conversions.conversion_group,
        conversions.conversion_index,
        conversions.conversion_name_index,
        conversions.conversion_group_index,

        false as is_converting_session,
            
        sessions.session_start,
        conversions.converted_at

    from conversions
    inner join sessions
        on conversions.inferred_user_id = sessions.inferred_user_id
            and conversions.converted_at >= sessions.session_start
            and conversions.session_id != sessions.session_id
    
),

conversion_sessions as (

    select
        conversions.event_id,
        conversions.inferred_user_id,
        conversions.cloud_user_id,
        conversions.salesforce_contact_id,
        sessions.session_id,
        sessions.source_mapping_id,
        sessions.ad_web_mapping_id,
        
        sessions.first_page_url,
        sessions.first_page_url_host,
        sessions.first_page_url_path,
        sessions.first_page_url_query,
        sessions.marketing_source,
        sessions.marketing_medium,
        sessions.team,
        sessions.source_type,
        sessions.channel_grouping,
        sessions.channel,
        sessions.sub_channel,
        sessions.marketing_campaign,
        sessions.marketing_campaign_name,
        sessions.marketing_campaign_period,
        sessions.marketing_campaign_goal,
        sessions.marketing_content,
        sessions.marketing_offer,
        sessions.marketing_asset,
        sessions.marketing_asset_version,
        sessions.marketing_term,
        sessions.experiment_name,
        sessions.branch_name,

        conversions.conversion_name,
        conversions.conversion_type,
        conversions.conversion_group,
        conversions.conversion_index,
        conversions.conversion_name_index,
        conversions.conversion_group_index,

        true as is_converting_session,
            
        sessions.session_start,
        conversions.converted_at

    from conversions
    inner join sessions
        on conversions.session_id = sessions.session_id
    
),

unioned as (

    select * from pre_conversion_sessions
    union all
    select * from conversion_sessions

),

windowed as (

    select
        *,

        count(*) over (partition by
            inferred_user_id,
            event_id
        ) as total_sessions_in_conversion_window,

        row_number() over (
            partition by
                inferred_user_id,
                event_id
            order by session_start
        ) as conversion_session_index,

        conversion_index = 1 as is_first_conversion,
        conversion_name_index = 1 as is_first_conversion_of_name,
        conversion_group_index = 1 as is_first_conversion_of_group,

        datediff(day,session_start,converted_at) as days_from_session_to_conversion

    from unioned

),

attribution as (

    select
        *,
        
        case
            when total_sessions_in_conversion_window = 1 then 1.0
            when total_sessions_in_conversion_window = 2 then 0.5
            when conversion_session_index = 1 then 0.4
            when conversion_session_index = total_sessions_in_conversion_window then 0.4
            else 0.2 / (total_sessions_in_conversion_window - 2)
        end as forty_twenty_forty_points,

        case
            when conversion_session_index = 1 then 1.0
            else 0.0
        end as first_touch_points,

        case
            when conversion_session_index = total_sessions_in_conversion_window then 1.0
            else 0.0
        end as last_touch_points,

        1.0 / total_sessions_in_conversion_window as linear_points

    from windowed

),

with_id as (

    select
        {{dbt_utils.generate_surrogate_key([
            'session_id',
            'event_id'
        ])}} as attributed_session_id,
        *
    
    from attribution

)

select * from with_id

