with source as (

    select * from {{ source('salesforce', 'dbt_cloud_user') }}

),

renamed as (

    select
        id as cloud_user_mapping_id,
        contact__c as contact_id,
        dbt_cloud_user_id__c as cloud_user_id,
        ownerid as owner_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,

        email__c as email,
        email_domain__c as email_domain,
        name,
        first_name__c as first_name,
        last_name__c as last_name,

        isdeleted as is_deleted,

        createddate as created_at,
        to_date(createddate) as created_date,
        date_joined__c as cloud_signup_at,
        lastmodifieddate as last_modified_at,
        systemmodstamp

    from source

)

select * from renamed
where not is_deleted