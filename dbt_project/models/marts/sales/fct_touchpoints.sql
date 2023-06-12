with

touchpoints as (

    select * from {{ ref('stg_salesforce__touchpoints') }}
    where is_deleted = false

),

cloud_user_mappings as (

    select * from {{ ref('stg_salesforce__cloud_user_mappings') }}

),

cloud_account_mappings as (

    select * from {{ ref('stg_salesforce__cloud_account_mappings') }}
    where is_deleted = false

),

partner_connect_signups as (

    select * from {{ ref('int_cloud__partner_connect_signups_unioned') }}

),

accounts as (

    select * from {{ ref('stg_salesforce__accounts') }}

),

campaign_mappings as (

    select * from {{ ref('stg_salesforce__campaigns') }}

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

joined as (

    select
        touchpoints.*,
        touchpoints.touchpoint_index = max(touchpoints.touchpoint_index) over (partition by touchpoints.contact_id) as is_most_recent_touchpoint,

        salesforce_accounts.region,
        salesforce_accounts.market_segment,

        cloud_accounts.cloud_account_id,
        cloud_accounts.sign_up_source,

        cloud_users.cloud_user_id,

        windowed.previous_touchpoint_opened_at,
        windowed.previous_touchpoint_source,
        windowed.previous_touchpoint_source_detail,
        windowed.previous_touchpoint_source_type,
        windowed.next_touchpoint_opened_at,
        windowed.next_touchpoint_source,
        windowed.next_touchpoint_source_detail,
        windowed.next_touchpoint_source_type,
        windowed.first_touchpoint_opened_at,
        windowed.first_touchpoint_source,
        windowed.first_touchpoint_source_detail,
        windowed.first_touchpoint_source_type,
        windowed.last_touchpoint_opened_at,
        windowed.last_touchpoint_source,
        windowed.last_touchpoint_source_detail,
        windowed.last_touchpoint_source_type,

        campaign_mappings.campaign_name,
        campaign_mappings.parent_campaign_id,
        campaign_mappings.parent_campaign_name
    
    from touchpoints
    left join salesforce_accounts
        on touchpoints.account_id = salesforce_accounts.account_id
    left join cloud_accounts
        on touchpoints.cloud_account_mapping_id = cloud_accounts.cloud_account_mapping_id
    left join cloud_users
        on touchpoints.cloud_user_mapping_id = cloud_users.cloud_user_mapping_id
    left join windowed
        on touchpoints.touchpoint_id = windowed.touchpoint_id
    left join campaign_mappings
        on touchpoints.campaign_id = campaign_mappings.campaign_id

),

final as (

    select
        -- identifiers
        touchpoint_id,
        account_id,
        campaign_id,
        cloud_account_id,
        cloud_account_mapping_id,
        cloud_user_account_mapping_id,
        cloud_user_id,
        cloud_user_mapping_id,
        contact_id,
        created_by_id,
        external_touchpoint_id,
        impartner_partner_account_id,
        last_modified_by_id,
        opportunity_id,
        owner_id,
        parent_campaign_id,
        referred_by_partner_contact_id,
        referred_by_partner_id,
        zendesk_ticket_id,

        -- dimensions
        archive_reason,
        campaign_name,
        channel,
        channel_grouping,
        cloud_user_account_relationship,
        data_source,
        first_touchpoint_source,
        first_touchpoint_source_detail,
        first_touchpoint_source_type,
        impartner_deal_registration_status,
        impartner_prm_referral_status,
        impartner_type_of_dbt_project,
        impartner_type_of_registration,
        last_touchpoint_source,
        last_touchpoint_source_detail,
        last_touchpoint_source_type,
        market_segment,
        message,
        next_touchpoint_source,
        next_touchpoint_source_detail,
        next_touchpoint_source_type,
        parent_campaign_name,
        previous_touchpoint_source,
        previous_touchpoint_source_detail,
        previous_touchpoint_source_type,
        project_registration_type,
        region,
        sign_up_source,
        source_type,
        sub_channel,
        system_modstamp,
        team,
        touchpoint_group,
        touchpoint_index,
        touchpoint_name,
        touchpoint_source,
        touchpoint_source_detail,
        touchpoint_source_type,
        touchpoint_status,
        utm_campaign,
        utm_medium,
        utm_source,

        -- booleans
        is_deleted,
        is_hand_raise_event,
        is_impartner_deal_registration,
        is_impartner_deal_registration_denied,
        is_impartner_notify_partner,
        is_most_recent_touchpoint,
        is_qualified_touchpoint,

        -- timestamps
        closed_at,
        created_at,
        first_touchpoint_opened_at,
        last_activity_at,
        last_modified_at,
        last_referenced_at,
        last_touchpoint_opened_at,
        last_viewed_at,
        next_touchpoint_opened_at,
        opened_at,
        previous_touchpoint_opened_at,
        qualified_at

    from joined
            
)

select * from final