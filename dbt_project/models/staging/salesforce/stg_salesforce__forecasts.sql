with

source as (

      select * from {{ source('salesforce', 'forecasts') }}
),

renamed as (

    select
        id as forecast_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        name as forecast_name,
        delta_arr_all_types__c as delta_arr_all_types,
        delta_arr_land__c as delta_arr_land,
        organization__c as organization,
        status__c as status,
        systemmodstamp as system_modstamp,
        isdeleted as is_deleted,
        first_forecast_of_quarter__c as first_forecast_of_quarter,
        lastvieweddate as last_viewed_date,
        last_week_s_forecast__c as last_week_s_forecast,
        next_week_s_forecast__c as next_week_s_forecast,
        week__c as week,
        createddate as created_date,
        lastmodifieddate as last_modified_date,
        lastreferenceddate as last_referenced_date

    from source

)

select * from renamed
