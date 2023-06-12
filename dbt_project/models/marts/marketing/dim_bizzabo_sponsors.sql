with

sponsors as (

    select * from {{ ref('stg_bizzabo__sponsors') }}
    where is_deleted = false

),

bizzabo_contacts as (

    select * from {{ ref('stg_bizzabo__event_contacts') }}

),

sfdc_contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}
    where is_deleted = false

),

session_sponsors as (

    select * from {{ ref('int__bizzabo_session_sponsors') }}

),

session_calcs as (

    select
        sponsor_id,
        count(*) as count_of_sessions_sponsored
    
    from session_sponsors
    group by 1
        
),

event_calcs as (

    select
        sponsor_id,
        count(*) as count_of_events_sponsored
    
    from sponsors
    group by 1

),

joined as (

    select
        sponsors.*,
        bizzabo_contacts.contact_id,
        bizzabo_contacts.event_contact_id,
        sfdc_contacts.contact_id as salesforce_contact_id,
        sfdc_contacts.account_id as salesforce_account_id,
        coalesce(event_calcs.count_of_events_sponsored,0) as count_of_events_sponsored,
        coalesce(session_calcs.count_of_sessions_sponsored,0) as count_of_sessions_sponsored
    
    from sponsors
    left join bizzabo_contacts
        on sponsors.contact_email = bizzabo_contacts.email
        and sponsors.event_id = bizzabo_contacts.event_id
    left join sfdc_contacts
        on sponsors.contact_email = sfdc_contacts.email
    left join event_calcs
        on sponsors.sponsor_id = event_calcs.sponsor_id
    left join session_calcs
        on sponsors.sponsor_id = session_calcs.sponsor_id

),

final as (

    select
        -- identifiers
        sponsor_id,
        event_id,
        contact_id,
        event_contact_id,
        salesforce_contact_id,
        salesforce_account_id,

        -- dimensions
        booth,
        contact_email,
        contact_phone,
        description,
        facebook_url,
        level,
        linkedin_url,
        logo,
        name,
        promoted_offer,
        twitter_handle,
        type,
        website_url,

        -- booleans
        is_visible,
        
        -- timestamps
        created_at,

        -- measures
        count_of_events_sponsored,
        count_of_sessions_sponsored

    from joined

)

select * from final
