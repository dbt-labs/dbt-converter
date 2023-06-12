with source as (

    select * from {{ source('salesforce', 'opportunity_history') }}

),

renamed as (

    select
    
        ----------  ids
        id as opportunity_history_id,
        opportunityid as opportunity_id,
        createdbyid as created_by_id,
        
        stagename as stage_name,
        amount,
        probability,
        expectedrevenue as expected_revenue,
        forecastcategory as forecast_category,
        isdeleted as is_deleted,
        
        ----------  dates and timestamps
        to_date(closedate) as close_date,
        createddate as created_at,
        createddate::timestamp_ntz as created_at_ntz,  
        to_date(createddate) as created_date,  
        systemmodstamp as system_mod_stamp,
        
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)
select * from renamed