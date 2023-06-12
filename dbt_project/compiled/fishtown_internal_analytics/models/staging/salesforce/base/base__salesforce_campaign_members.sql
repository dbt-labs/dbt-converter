with

source as (

    select * from raw.salesforce.campaignmember

),

renamed as (

    select
        id as campaign_member_id,
        campaignid as campaign_id,
        contactid as contact_id,
        createdbyid as created_by_id,
        external_id__c as external_id,
        leadid as lead_id,
        leadorcontactid as lead_or_contact_id,
        leadorcontactownerid as lead_or_contact_owner_id,
        
        campaign_grade__c as campaign_grade,
        city,
        companyoraccount as company_or_account,
        country,
        description,
        donotcall as do_not_call,
        email,
        name,
        firstname as first_name,
        lastname as last_name,
        leadsource as lead_source,
        isdeleted as is_deleted,
        phone,
        postalcode as postal_code,
        salutation,
        state,
        status,
        street,
        systemmodstamp,
        title,
        type,

        hasresponded as has_responded,

        createddate as campaign_member_created_at,
        -- first responded is a date field, not a timestamp
        firstrespondeddate::date as campaign_member_responded_date,
        engaged_at_date__c as campaign_member_engaged_at

    from source

)

select * from renamed