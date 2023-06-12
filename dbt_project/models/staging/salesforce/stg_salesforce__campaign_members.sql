with

campaign_members as (

    select * from {{ ref('base__salesforce_campaign_members') }}
    where is_deleted = false

),

campaigns as (

    select * from {{ ref('stg_salesforce__campaigns') }}
    where is_deleted = false

),

contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}

),

campaign_members_enriched as (

    select
        campaign_members.*,
        campaign_members.campaign_member_engaged_at is not null as is_engaged,
        contacts.account_id,
        coalesce(
            contacts.is_internal_account,
            false
        ) as is_internal_account,
        campaigns.campaign_name,
        campaigns.campaign_type,
        campaigns.campaign_start_date,
        campaigns.campaign_end_date,
        contacts.contact_created_at

    from campaign_members
    left join campaigns
        on campaign_members.campaign_id = campaigns.campaign_id
    left join contacts
        on campaign_members.contact_id = contacts.contact_id

)

select * from campaign_members_enriched