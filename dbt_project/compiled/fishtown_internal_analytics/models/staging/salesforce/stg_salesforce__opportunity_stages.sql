with source as (

    select * from raw.salesforce.opportunitystage

),

renamed as (

    select
    
        ----------  ids
        id as opportunity_stage_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        
        apiname as stage_name,
        defaultprobability as default_probability,
        forecastcategory as forecast_category,
        forecastcategoryname as forecast_category_name,
        masterlabel as master_label,
        sortorder as sort_order,
        
        ----------  final status info
        isactive as is_active,
        isclosed as is_closed,
        iswon as is_won,
        
        ----------  dates and timestamps
        createddate as created_date,
        lastmodifieddate as last_modified_date,
        systemmodstamp as system_mod_stamp,
        
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version 

    from source

)

select * from renamed