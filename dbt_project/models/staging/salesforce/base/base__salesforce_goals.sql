with source as (

    select * from {{ source('salesforce', 'goals') }}

),

renamed as (

    select
        id as salesforce_goal_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        quarter__c as quarter_id,
        month__c as month_id,

        name as goal_name,
        goal_type__c as goal_type,
        team__c as team,
        market_segment__c as market_segment,
        lead_source__c as touchpoint_source,
        channel__c as channel,

        apac_goal__c as apac_goal,
        emea_goal__c as emea_goal,
        us_east_goal__c as useast_goal,
        us_west_goal__c as uswest_goal,
        us_central_goal__c as uscentral_goal,
        unknown_goal__c as unknown_goal,
        total_goal__c as total_goal,

        apac_forecast__c as apac_forecast,
        emea_forecast__c as emea_forecast,
        us_east_forecast__c as useast_forecast,
        us_west_forecast__c as uswest_forecast,
        us_central_forecast__c as uscentral_forecast,
        total_forecast__c as total_forecast,

        isdeleted as is_deleted,

        createddate as created_at,
        lastmodifieddate as last_modified_at,
        systemmodstamp as system_modstamp

    from source

)

select * from renamed