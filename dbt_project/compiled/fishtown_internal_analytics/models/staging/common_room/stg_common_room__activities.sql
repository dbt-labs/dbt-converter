with

source as (

    select * from analytics_dev.dbt_jstein.base__common_room_activities

),

renamed as (

    select
        community_member_id,
        
        emails,
        event_type,
        full_name,
        service_name,
        _dbt_source_relation as source_relation,

        activity_at,
        first_seen_time as first_seen_at

    from source

),

enriched as (

    select
        
    
md5(cast(coalesce(cast(community_member_id as TEXT), '') || '-' || coalesce(cast(activity_at as TEXT), '') || '-' || coalesce(cast(event_type as TEXT), '') as TEXT)) as activity_id,

        *,

        row_number() over (
            partition by activity_id
            order by activity_at
        ) as number_of_occurrences
    
    from renamed

)

select * from enriched