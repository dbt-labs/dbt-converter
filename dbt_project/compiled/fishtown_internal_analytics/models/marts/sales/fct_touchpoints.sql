

with

touchpoints as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__touchpoints
    where is_deleted = false

),

cloud_user_mappings as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__cloud_user_mappings

),

cloud_account_mappings as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__cloud_account_mappings
    where is_deleted = false

),

partner_connect_signups as (

    select * from analytics_dev.dbt_jstein.stg_cloud__partner_connect_signups

),

accounts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__accounts

),

cloud_users as (

    select
        cloud_user_mapping_id,
        cloud_user_id
    
    from cloud_user_mappings

),

cloud_accounts as (

    select
        cloud_account_mappings.cloud_account_mapping_id,
        cloud_account_mappings.cloud_account_id,
        partner_connect_signups.sign_up_source
    
    from cloud_account_mappings
    left join partner_connect_signups
        on cloud_account_mappings.cloud_account_id = partner_connect_signups.dbt_cloud_account_id
    
),

salesforce_accounts as (

    select
        account_id,
        account_region as region,
        market_segment
    
    from accounts

),

windowed as (

    select
        touchpoint_id,

        row_number() over (partition by contact_id order by opened_at) as touchpoint_index,

        --the previous touchpoint is the touchpoint immediately before the selected touchpoint for a given contact
        lag(opened_at) over (
            partition by contact_id
            order by opened_at
        ) as previous_touchpoint_opened_at,
        
        lag(touchpoint_source) over (
            partition by contact_id
            order by opened_at
        ) as previous_touchpoint_source,

        lag(touchpoint_source_detail) over (
            partition by contact_id
            order by opened_at
        ) as previous_touchpoint_source_detail,

        lag(touchpoint_source_type) over (
            partition by contact_id
            order by opened_at
        ) as previous_touchpoint_source_type,

        --the next touchpoint is the touchpoint immediately after the selected touchpoint for a given contact
        lead(opened_at) over (
            partition by contact_id
            order by opened_at
        ) as next_touchpoint_opened_at,

        lead(touchpoint_source) over (
            partition by contact_id
            order by opened_at
        ) as next_touchpoint_source,

        lead(touchpoint_source_detail) over (
            partition by contact_id
            order by opened_at
        ) as next_touchpoint_source_detail,

        lead(touchpoint_source_type) over (
            partition by contact_id
            order by opened_at
        ) as next_touchpoint_source_type,

        --the first touchpoint is the first touchpoint for a given contact
        first_value(opened_at) over (
            partition by contact_id
            order by opened_at
        ) as first_touchpoint_opened_at,

        first_value(touchpoint_source) over (
            partition by contact_id
            order by opened_at
        ) as first_touchpoint_source,

        first_value(touchpoint_source_detail) over (
            partition by contact_id
            order by opened_at
        ) as first_touchpoint_source_detail,

        first_value(touchpoint_source_type) over (
            partition by contact_id
            order by opened_at
        ) as first_touchpoint_source_type,

        --the last touchpoint is the last touchpoint for a given contact
        last_value(opened_at) over (
            partition by contact_id
            order by opened_at
        ) as last_touchpoint_opened_at,

        last_value(touchpoint_source) over (
            partition by contact_id
            order by opened_at
        ) as last_touchpoint_source,

        last_value(touchpoint_source_detail) over (
            partition by contact_id
            order by opened_at
        ) as last_touchpoint_source_detail,

        last_value(touchpoint_source_type) over (
            partition by contact_id
            order by opened_at
        ) as last_touchpoint_source_type
    
    from touchpoints
    where contact_id is not null

),

cleaned as (

    select
        touchpoint_id,
        
        --the below loop referencing the hand raise events list at the top of the model
        --to include a new hand raise event, add the touchpoint source to the hand_raise_events list at the top
        case
            when touchpoint_source in (
                'Contact Sales'
                ,'Support Request'
                ,'Contact Sales Email'
                ,'Email Introduction'
                ,'Community Introduction'
                ,'Partner - Existing Partner Customer'
                ,'Partner - Joint Coselling Opportunity'
                ,'dbt Cloud Enterprise sales referral'
                ) then true 
            else false
        end as is_hand_raise_event,

        -- partners can register projects via Impartner and designate a
        -- dbt project as being 'dbt Core' or 'dbt Cloud'.
        -- this cleans up the Impartner data.
        case
            when touchpoint_source = 'dbt Project Registration Form'
                and message ilike '%Introduction of dbt Core%'
                    then 'dbt Core'

            when touchpoint_source = 'dbt Project Registration Form'
                and message ilike '%Introduction of dbt Cloud%'
                    then 'dbt Cloud'

            when touchpoint_source = 'dbt Project Registration Form'
                and message ilike '%Development support%'
                    then 'development support'

            when touchpoint_source = 'dbt Project Registration Form'
                and impartner_type_of_dbt_project in ('dbt Core', 'dbt Core project registration')
                    then 'dbt Core'
            when touchpoint_source = 'dbt Project Registration Form'
                and impartner_type_of_dbt_project in ('dbt Cloud', 'dbt Cloud Teams project registration')
                    then 'dbt Cloud'          
 
        end as project_registration_type

    from touchpoints

),

joined as (

    select
        *,
        touchpoint_index = max(touchpoint_index) over (partition by contact_id) as is_most_recent_touchpoint
    
    from touchpoints
    left join salesforce_accounts using (account_id)
    left join cloud_accounts using (cloud_account_mapping_id)
    left join cloud_users using (cloud_user_mapping_id)
    left join windowed using (touchpoint_id)
    left join cleaned using (touchpoint_id)

)

select * from joined