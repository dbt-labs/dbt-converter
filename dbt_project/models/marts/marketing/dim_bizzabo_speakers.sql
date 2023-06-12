with

speakers as (

    select * from {{ ref('stg_bizzabo__speakers') }}
    where is_deleted = false

),

bizzabo_contacts as (

    select * from {{ ref('stg_bizzabo__event_contacts') }}

),

sfdc_contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}
    where is_deleted = false

),

session_speakers as (

    select * from {{ ref('int__bizzabo_session_speakers') }}

),

calcs as (

    select
        speaker_id,
        event_id,
        count(distinct event_id) as count_of_events_spoken,
        count(*) as count_of_sessions_spoken
    
    from session_speakers
    group by 1,2

),

joined as (

    select
        speakers.*,
        bizzabo_contacts.contact_id,
        bizzabo_contacts.event_contact_id,
        sfdc_contacts.contact_id as salesforce_contact_id,
        sfdc_contacts.account_id as salesforce_account_id,
        coalesce(calcs.count_of_events_spoken,0) as count_of_events_spoken,
        coalesce(calcs.count_of_sessions_spoken,0) as count_of_sessions_spoken
    
    from speakers
    left join bizzabo_contacts
        on speakers.email = bizzabo_contacts.email
        and speakers.event_id = bizzabo_contacts.event_id
    left join sfdc_contacts
        on speakers.email = sfdc_contacts.email
    left join calcs
        on speakers.speaker_id = calcs.speaker_id

),

final as (

    select
        -- identifiers
        speaker_id,
        contact_id,
        event_id,
        event_contact_id,
        salesforce_contact_id,
        salesforce_account_id,

        -- dimensions
        bio,
        blog,
        company,
        country,
        email,
        first_name,
        last_name,
        full_name,
        linkedin_url,
        photo_set,
        prefix,
        title,
        twitter_handle,
        
        -- booleans
        is_hidden,

        -- measures
        count_of_events_spoken,
        count_of_sessions_spoken

    from joined

)

select * from final