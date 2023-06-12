with source as (

    select * from raw.salesforce.job_requisition__c
    where isdeleted = False

),

renamed as (

    select
        id as salesforce_job_requisition_id,
        job_id__c as adp_job_id,
        adp_associate_id__c as adp_associate_id,
        functional_role__c as role_name,
        l0_region__c as sales_region,
        l1_region__c as detail_sales_region,
        market_segment__c as market_segment,
        minor_level__c as minor_level

    from source

)

select * from renamed