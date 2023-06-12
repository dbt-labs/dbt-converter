with

contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}
    where is_deleted = false

),

leads as (

    select * from {{ ref('stg_salesforce__touchpoints') }}
    where is_deleted = false

),

opportunities as (

    select * from {{ ref('fct_opportunities') }}

),

campaign_members as (

    select * from {{ ref('stg_salesforce__campaign_members') }}

),

contact_campaigns as (
    --NOTE: we should think about how we want to attribute a campaign to a contact
    select
        contacts.contact_id,
        contacts.account_id,
        contacts.contact_created_at,
        contacts.lead_source,
        arrayagg(campaign_members.campaign_name) within group (order by campaign_name asc) as campaign_sources

    from contacts
    left join campaign_members on contacts.contact_id = campaign_members.contact_id
    group by 1,2,3,4

),

leads_opps_joined as (

    select
        
        leads.touchpoint_id,
        leads.contact_id,
        opportunities.opportunity_id,
        leads.touchpoint_source,
        leads.touchpoint_source_type,
        leads.touchpoint_index,
        leads.opened_at as touchpoint_opened_at,
        opportunities.created_at as opportunity_created_at,
        opportunities.discover_at as opportunity_discovered_at,
        
        case 
            when opportunities.is_won = True then opportunities.close_at 
            end as opportunity_won_at

    from leads
    left join opportunities using (opportunity_id)

),


contacts_joined as (
    -- NOTE: This table includes both "campaign sources" and "lead sources". We might want to rename these to something like "Campaign Source" and "Hand Raise Event"

    select
        contact_campaigns.account_id,
        contact_campaigns.contact_id,
        leads_opps_joined.touchpoint_id,
        leads_opps_joined.opportunity_id,
        leads_opps_joined.touchpoint_source,
        leads_opps_joined.touchpoint_source_type,
        leads_opps_joined.touchpoint_index,
        array_to_string(contact_campaigns.campaign_sources,', ') as campaign_sources,
        contact_campaigns.contact_created_at,
        leads_opps_joined.touchpoint_opened_at,
        leads_opps_joined.opportunity_created_at,
        leads_opps_joined.opportunity_discovered_at,
        leads_opps_joined.opportunity_won_at

    from contact_campaigns
    full outer join leads_opps_joined using (contact_id)

),

final as (

    select
        
        {{dbt_utils.generate_surrogate_key([
          'contact_id',
          'touchpoint_id'
        ])}} as user_funnel_id,
        
        account_id,
        contact_id,
        touchpoint_id,
        opportunity_id,
        touchpoint_source,
        touchpoint_source_type,
        touchpoint_index,
        campaign_sources,
        contact_created_at,
        touchpoint_opened_at,
        opportunity_created_at,
        opportunity_discovered_at,
        opportunity_won_at
    
    from contacts_joined

)

select * from final