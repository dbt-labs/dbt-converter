

with

source as (

    select * from raw.salesforce.partner_influence__c

),

renamed as (

    select
        id as partner_influence_id,
        opportunity__c as opportunity_id,
        partner__c as partner_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,

        name as opportunity_name,
        opportunity_status__c as opportunity_status,

        influence_type__c as influence_type,
        influence_percent__c as influence_percent,

        partner_influenced_open_pipeline__c as partner_influenced_open_pipeline,
        partner_influenced_revenue__c as partner_influenced_revenue,
        partner_influenced_won_arr__c as partner_influenced_won_arr,
        partner_influence_notes__c as partner_influence_notes,

        isdeleted as is_deleted,

        lastmodifieddate as last_modified_date,
        createddate as created_at,
        close_date__c as close_at

    from source

)

select * from renamed