with events as (

    select * from {{ ref('int_marketing_funnel_events_joined') }}

),

new_contacts as (

    select
        user_funnel_id,
        contact_id as object_id,
        '1. New Contact Created' as event_name,
        campaign_sources as source,
        null as touchpoint_source_type,
        contact_created_at as event_timestamp

    from events
    -- if a contact has multiple downstream leads, there were several new contact created events (one per lead). the below logic limits this to the first event.
    where (touchpoint_index = 1 or touchpoint_index is null)
        and contact_created_at is not null

),

new_leads as (

    select
        user_funnel_id,
        touchpoint_id as object_id,
        '2a. New Lead Created' as event_name,
        touchpoint_source as source,
        touchpoint_source_type,
        touchpoint_opened_at as event_timestamp

    from events
    -- this akes sure this is the leads first hand raise event. it also makes sure this lead doesn't come through after the opportunity closed
    where touchpoint_index = 1
        and (touchpoint_opened_at <= opportunity_won_at or opportunity_won_at is null)

),

reactivated_leads as (

    select
        user_funnel_id,
        touchpoint_id as object_id,
        '2b. Lead Reactivated' as event_name,
        touchpoint_source as source,
        touchpoint_source_type,
        touchpoint_opened_at as event_timestamp
    
    from events
    -- this makes sure the hand raise event is not the users first. it also makes sure this lead doesn't come through after an opportunity is closed.
    where touchpoint_index > 1
        and (touchpoint_opened_at <= opportunity_won_at or opportunity_won_at is null)

),

pre_pipeline_opportunities as (

    select
        user_funnel_id,
        opportunity_id as object_id,
        '3. New Opportunity Created' as event_name,
        /*this is always Contact Us...
        is it possible to find the true lead source via account_id? 
        Might want to do an intermediate table*/
        touchpoint_source as source,
        touchpoint_source_type,
        opportunity_created_at as event_timestamp

    from events
    where opportunity_id is not null

),

pipeline_opportunities as (

    select
        user_funnel_id,
        opportunity_id as object_id,
        '4. New Opportunity Entered Pipeline' as event_name,
        /*this is always Contact Us...
        is it possible to find the true lead source via account_id? 
        Might want to do an intermediate table*/
        touchpoint_source as source,
        touchpoint_source_type,
        opportunity_discovered_at as event_timestamp

    from events
    where opportunity_discovered_at is not null

),

unioned as (

    select * from new_contacts
    union all
    select * from new_leads
    union all
    select * from reactivated_leads
    union all
    select * from pre_pipeline_opportunities
    union all
    select * from pipeline_opportunities

),

final as (

    select

        {{dbt_utils.generate_surrogate_key([
          'user_funnel_id',
          'object_id',
          'event_name'
        ])}} as event_id,

        user_funnel_id,
        object_id,
        event_name,
        source,
        touchpoint_source_type,
        event_timestamp
    
    from unioned
)

select * from final