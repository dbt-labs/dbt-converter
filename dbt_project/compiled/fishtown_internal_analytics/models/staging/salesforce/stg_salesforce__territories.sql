with source as (

    select * from raw.salesforce.territory__c
    where isdeleted = False

),

renamed as (

    select
        id as territory_id,
        territory_region__c as territory_region_id,
        commercial_sd__c as commercial_sd_id,
        enterprise_sd__c as enterprise_sd_id,
        createdbyid as created_by_id,

        name as territory_name,
        theater__c as territory_theater,
        region__c as territory_region,
        subregion__c as territory_subregion,
        group__c as territory_group,
        pod__c as territory_pod,

        territory_assignees_commercial_sa__c as count_assigned_commercial_sas,
        territory_assignees_commercial_sd__c as count_assigned_commercial_sds,
        territory_assignees_enterprise_sa__c as count_assigned_enterprise_sas,
        territory_assignees_enterprise_sd__c as count_assigned_enterprise_sds,

        createddate as created_at

    from source

)

select * from renamed