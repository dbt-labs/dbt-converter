with

registrations as (

    select * from {{ ref('stg_bizzabo__registrations') }}
    where validity = 'valid'

),

event_contacts as (

    select * from {{ ref('stg_bizzabo__event_contacts') }}

),

salesforce_contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}
    where is_deleted = false

),

cloud_users as (

    select * from {{ ref('int_cloud__users_joined') }}

),

session_speakers as (

    select * from {{ ref('int__bizzabo_session_speakers') }}

),

locations as (

    select * from {{ ref('stg_bizzabo__locations') }}

),

recording_views as (

    select * from {{ ref('int__bizzabo_recording_views') }}

),

-- we can't simply join to cloud users on email address since there are cases where a registrant's email
-- may be tied to several dbt Cloud users.
-- this is most often the case for single tenant clients where a user has a login for several accounts.
-- instead, we'll use a boolean field to enable downstream filtering
-- there may be a better way to do this in the future (primary cloud user per email, for example) - but not yet.
cloud_user_boolean as (

    select distinct
        registrations.registration_id,
        true as is_cloud_user
    
    from registrations
    inner join cloud_users
        on registrations.email = cloud_users.email

),

recording_views_boolean as (

    select distinct
        registration_id,
        true as has_watched_recording
    
    from recording_views

),

joined as (

    select
        registrations.*,
        event_contacts.roles as registrant_roles,
        cloud_user_boolean.is_cloud_user,
        recording_views_boolean.has_watched_recording,
        salesforce_contacts.contact_id as salesforce_contact_id,
        salesforce_contacts.account_id as salesforce_account_id
       
    from registrations
    left join event_contacts
        on registrations.event_contact_id = event_contacts.event_contact_id
    left join cloud_user_boolean
        on registrations.registration_id = cloud_user_boolean.registration_id
    left join recording_views_boolean
        on registrations.registration_id = recording_views_boolean.registration_id
    left join salesforce_contacts
        on registrations.email = salesforce_contacts.email

),

-- the below logic allows us to parse the location in which a Speaker is speaking at
-- this will be used below to populate `ticket_location`
-- this is required since Speakers have a generic promo code that is not location dependent
speaker_locations as (

    select
        registrations.event_contact_id,
        min(locations.location_name) as location_name
    
    from registrations
    inner join session_speakers
        on registrations.email = session_speakers.email
        and registrations.event_id = session_speakers.event_id
    inner join locations
        on session_speakers.location_id = locations.location_id
    group by 1

),

final as (

    select
        -- identifiers
        registration_id,
        contact_id,
        event_id,
        event_contact_id,
        order_id,
        ticket_id,
        salesforce_contact_id,
        salesforce_account_id,

        -- dimensions
        first_name,
        last_name,
        full_name,
        email,
        billing_address_properties,
        billing_address,
        billing_contact_name,
        billing_city,
        billing_company,
        billing_country,
        billing_email,
        billing_first_name,
        billing_last_name,
        billing_state,
        billing_zip_code,
        currency_code,
        magic_link,
        manage_registration_link,
        order_type,
        payment_method,
        payment_status,
        promo_code,
        promo_name,
        registrant_properties,
        registrant_roles,
        status,
        ticket_name,

        -- the below logic is required to group tickets to their associated location
        -- this is because there are vague Ticket Names & Promo Code names that can't be directly tied to a location
        -- So, first we have to parse from the ticket name whether it includes a location
        -- then, we join in Speaker locations to tie those with the "Speaker" ticket to their location
        -- third, we are specificy certian sponsors & vague ticket types to certain locations based on the Coalesce team's feedback
        coalesce(
            speaker_locations.location_name,
            -- Coalesce 2022 logic 
            case 
                when event_id = 396530 then
                    (case
                        when ticket_name ilike '%new orleans%' then 'New Orleans'
                        when ticket_name ilike '% hub%' then 'New Orleans'
                        when ticket_name ilike '%sydney%' then 'Sydney'
                        when ticket_name ilike '%london%' then 'London'
                        when ticket_name ilike '%online%' then 'Online'
                        when ticket_name = 'dbt Labs team' then 'New Orleans'
                        -- any other Speakers who have a null location in the above join (speaker_locations) are assumed to be online
                        when ticket_name ilike '%speaker%' then 'Online'
                        else 'New Orleans'
                    end)
                --Coalesce 2023 logic
                when event_id = 433222 then
                    (case
                        when ticket_name ilike '%sydney%' then 'Sydney'
                        when ticket_name ilike '%london%' then 'London'
                        when ticket_name ilike '%online%' then 'Online'
                        when ticket_name ilike '%san diego%' then 'San Diego'
                        when ticket_name ilike '%berlin%' then 'Berlin'
                        else 'San Diego'
                    end)
                end
        ) as ticket_location,

        marketing_campaign,
        marketing_content,
        marketing_medium,
        marketing_source,
        {{ parse_marketing_dimensions() }},
        validity,

        -- booleans
        has_invoice,
        is_checked_in,
        coalesce(is_cloud_user,false) as is_cloud_user,
        is_virtual_checkin,
        is_checked_in or is_virtual_checkin as has_attended_live,
        has_watched_recording,
        has_attended_live or has_watched_recording as has_attended,

        -- timestamps
        created_at,      
        modified_at,
        payment_at,
        registered_at,
        checked_in_at,

        -- measures
        charge_amount,
        ticket_price - charge_amount as discount_amount,
        fees_amount,
        ticket_price
    
    from joined
    left join speaker_locations using (event_contact_id)

)

select * from final