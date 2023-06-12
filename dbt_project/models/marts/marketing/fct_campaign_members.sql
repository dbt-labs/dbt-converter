with campaign_members as (

    select 
    -- we are purposefully excluding leads & opps from the campaign member object so that we can bring these in with our own logic below
    {{ dbt_utils.star(
        from=ref('stg_salesforce__campaign_members'),
        except=["lead_id", "opportunity_id"])
    }}
    
    from {{ ref('stg_salesforce__campaign_members') }}
    where not is_internal_account

),

contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}

),

touchpoints as (

    select * from {{ ref('fct_touchpoints') }} 
    where is_deleted = false

),

opportunities as (

    select * from {{ ref('fct_opportunities') }}
    where opportunity_type = 'Land'

),

cloud_users as (

    select * from {{ ref('stg_salesforce__cloud_user_mappings') }}

),

first_cloud_signup as (

    select
        contact_id,
        cloud_user_id,
        cloud_signup_at
    
    from cloud_users
    qualify row_number() over (
        partition by contact_id
        order by cloud_signup_at
    ) = 1

),

pipeline_joined as (

    select
        campaign_members.*,
        first_cloud_signup.cloud_user_id,
        first_cloud_signup.cloud_signup_at,
        touchpoints.touchpoint_id,
        touchpoints.touchpoint_index,
        opportunities.opportunity_id,
        opportunities.opportunity_index,

        -- the furthest pipeline stage achieved allows us to measure how many opps made it to either the pre-pipeline or pipeline stage, regardless of closed status
        -- this is key for reporting on historical campaign perfomance
        opportunities.furthest_pipeline_stage_achieved,

        -- the below logic checks to see if the campaign is the very first campaign that a contact interacted with
        -- this isn't perfect, since sometimes the contact is created before the campaign member
        -- therefore, we default to matching on the same date, and then taking the first campaign for that date
        -- using the created_at date is more appropriate for this logic due to Salesforce automation
        case
            when campaign_members.campaign_member_created_at::date = campaign_members.contact_created_at:: date
                and row_number() over (
                    partition by campaign_members.contact_id
                    order by campaign_members.campaign_member_created_at
                )=1 then true
            else false
            end as is_new_contact,

        touchpoints.is_qualified_touchpoint,
        
        -- the below logic determines if a user is an existing Cloud user, or a new Cloud user at the time of their campaign engagement
        case
            when first_cloud_signup.cloud_signup_at >= campaign_members.campaign_member_engaged_at then 'New'
            when first_cloud_signup.cloud_signup_at < campaign_members.campaign_member_engaged_at then 'Existing'
            else null
        end as new_vs_existing_cloud_user,

        case 
            when touchpoints.touchpoint_index = 1 then 'New'
            when touchpoints.touchpoint_index > 1 then 'Existing'
        end as new_vs_existing_touchpoint,

        case 
            when touchpoints.touchpoint_id = opportunities.source_lead then 'New'
            when touchpoints.touchpoint_id != opportunities.source_lead then 'Existing'
        end as new_vs_existing_opportunity,

        datediff(day,campaign_members.campaign_member_engaged_at,touchpoints.opened_at) as days_to_touchpoint_conversion,
        datediff(day,campaign_members.campaign_member_engaged_at,first_cloud_signup.cloud_signup_at) as days_to_cloud_signup_conversion
    
    from campaign_members
    left join touchpoints 
        on campaign_members.contact_id = touchpoints.contact_id
        and touchpoints.opened_at >= campaign_members.campaign_member_engaged_at
    left join opportunities
        on touchpoints.opportunity_id = opportunities.opportunity_id
    left join first_cloud_signup
        on campaign_members.contact_id = first_cloud_signup.contact_id
    --where not campaign_members.email ilike any ('%fishtownanalytics.com%','%dbtlabs.com%')
    --28 June 2022 - Erica removed this as we've removed any campaign members
        --that are associated with an internal Salesforce Account. This allows us to remove
        --Internal Ops employees who were testing using gmail accounts

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key(['campaign_member_id','touchpoint_id','opportunity_id']) }} as id,
        *

    from pipeline_joined

)

select * from with_id