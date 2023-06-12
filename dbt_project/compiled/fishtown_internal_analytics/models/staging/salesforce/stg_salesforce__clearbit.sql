with source as (

    select * from raw.salesforce.cbit__clearbit__c

),

renamed as (

    select
        id as clearbit_id,
        cbit__account__c as account_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        ownerid as owner_id,

        cbit__companytype__c as clearbit_company_type,
        cbit__companycategoryindustry__c as clearbit_industry,
        cbit__companycategoryindustrygroup__c as clearbit_industry_group,
        cbit__companycategorysector__c as clearbit_sector,
        cbit__companycategorysubindustry__c as clearbit_sub_industry,
        cbit__companyfoundedyear__c as clearbit_year_company_founded,
        
        isdeleted as is_deleted,

        createddate as created_at,
        lastmodifieddate as last_modified_at,
        lastreferenceddate as last_referenced_at,
        lastvieweddate as last_viewed_at,
        systemmodstamp

    from source
    
)

select * from renamed